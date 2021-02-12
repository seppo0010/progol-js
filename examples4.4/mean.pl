%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Progol4.4 demonstration example file.
%
% Finding numeric intervals using mean +/- K s.d.'s.
% Hypotheses take the following form.
%
%	p(A) :- q(A,B), interval(-0.534 =<(B=<6.769)).
%
% In the above B is a numeric variable, which is non-determinately
% related to the variable A via the predicate q/2. The predicate
% interval/1 is declared to be a constraint. Thus the constants
% in the interval atom are determined by the `solving' clause of
% interval/1, which computes the mean +/- K s.d.'s of all substitutions
% for variable B from the positive examples. The substitutions for negative
% examples are ignored. The value of K can be varied by changing
% the definition of k/1.

:- set(h,10000)?		% h set high since no recursion in hypotheses.
:- modeh(1,p(+a))?
:- modeb(1,q(+p,-r))?
:- modeb(1,interval(#r =< +r =< #r))?	% Interval predicate is a constraint
:- modeb(4,(#r=< +r))?		% Generates 4 lower bounds for input variable.
:- modeb(4,(+r=< #r))?		% Generates 4 upper bounds for input variable.

% :- set(posonly)?

:- constraint(interval/1)?

a(a).  a(b).  a(c).  a(d).  a(e).  a(f).  a(g).  a(h).
a(i).  a(j).  a(k).  a(l).

% Distribution over reals for posonly leanring

r(X) :- uniform(X,-9.5,7.5).

% Constraint predicate

interval(Min=<[P,N]=<Max) :-	% Solver for mean +/- K s.d.
	solving,
	write(input([P,N])), nl,
	flatten(P,L1),
	meansigma(L1,Mu,Sg), k(K),
	Min is Mu-K*Sg,
	Max is Mu+K*Sg,
	write(output(min=Min,max=Max)), nl.
interval(Min=<X=<Max) :-	% Tester
	not(solving),
	Min=<X, X=<Max.

% K standard deviations. Try it with K= 1,1.5,3 etc.

k(2).

flatten(L1,L2) :-
	flatten(L1,L2,[]).

flatten([],E,E).
flatten([H|T],[H|E2],E3) :-
	not(H= [_|_]),
	flatten(T,E2,E3).
flatten([H|T],E2,E3) :-
	H= [_|_],
	flatten(H,E2,E4),
	flatten(T,E4,E3).

% Compute the mean (Mu) and standard deviation (Sg) of a Bag of numbers.

meansigma(Bag,Mu,Sg) :-
	ms1(Bag,0,0,0,Mu,Sg).

ms1([],Sum,Sum2,N,Mu,Sg) :-
	Mu is Sum/N,
	Sg is (Sum2/N-Mu^2)^0.5.
ms1([X|T],Sum,Sum2,N,Mu,Sg) :-
	ms1(T,Sum+X,Sum2+X^2,N+1,Mu,Sg).

p(a).
p(b).
p(c).
p(d).
p(e).
p(f).
p(g).
p(h).

:- p(i).
:- p(j).

q(a,0). q(a,0.1).  q(a,0.3).
q(b,1). q(b,1.2).  q(b,1.5).
q(c,2). q(c,2.2).  q(c,2.5). q(c,2.8).
q(d,3). q(d,3.1).  q(d,3.2). q(d,3.4).
q(e,3.5).
q(f,4). q(f,4.5).  q(f,4.7). q(f,4.9).
q(g,5). q(g,5.2).  q(g,5.4). q(g,5.7).
q(h,6).
q(i,7).
q(j,9).
