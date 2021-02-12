% Qualitative regression general background knowledge.
%
% Background knowledge for learning numeric functions in order[0-4].pl
% The modes gives three families of functions that can be fitted
%	to the points. These are 1) linear, 2) polynomial in one
%	term and 3) exponential.
% The predicate order/1 contains one solver for each of these
%	functional forms. The solvers work by successive approximation
%	and find integer coefficients and floating point error terms that fit
%	the given example. For ease, the solvers all assume that
%	the function goes through the origin. This assumtion
%	works best for large values of X and Y.

:- set(posonly)?
:- modeh(1,f(+posfloat,+posfloat))?
:- modeb(32,order((+posfloat)=((#int)*(+posfloat)+(#int))+/-(#posfloat)))?
:- modeb(32,order((+posfloat)=((#int)*(+posfloat)^(#int))+/-(#posfloat)))?
:- modeb(8,order(+posfloat=((#int)^(+posfloat))+/-(#posfloat)))?
:- set(c,1)?
% :- set(noise,100)?

posfloat(X) :- uniform(X,0,500).

range(-0.5,0.5).

round(X,Y) :- Y is floor(X).
round(X,Y) :- Y is ceil(X).

abs(X,Y) :- not(0.0=<X), Y is -X, !.
abs(X,X).

check(X,Y) :- X1 is X, Y1 is Y, abs(X1,AX1), abs(Y1,AY1), AX1=<AY1.
	% Check that the constants and errors are not too high to
	%	estimate other coefficients.

order(R^2=X^2+Y^2+/-E) :- var(R), !, not(Y==X), float(F),
	R1 is exp(log(X^2+Y^2)/2),
	round(R1,R), E1 is (R-0.5*F)^2-X^2-Y^2, abs(E1,E), check(E,R1).
order(Y=F+/-E) :- var(Y), !, Y is F.
order(Y=K*X+C+/-E) :- var(K), !, not(Y==X), float(F), K1 is Y/X, round(K1,K),
	C1 is Y-K*X, round(C1,C), E1 is Y-((K-0.5*F)*X+C), abs(E1,E),
	abs(C,AC), check(AC+E,K*X).
order(Y=C*X^K+/-E) :- var(K), !, not(Y==X), float(F), K1 is log(Y)/log(X),
	round(K1,K), C1 is Y/X^K, round(C1,C), E1 is Y-C*X^(K-0.5*F), abs(E1,E),
	check(E,C*X^K).
order(Y=K^X+/-E) :- var(K), !, not(Y==X), float(F), K1 is exp(log(Y)/X),
	round(K1,K), E1 is Y-(K-0.5*F)^X, abs(E1,E), check(E,K^X).
order(Y=F+/-E) :- !, Diff is Y-F, Low is -E,
	Low=<Diff, Diff=<E.
