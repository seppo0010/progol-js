%%%%%%%%%%%%%%%%%%%
% Learning a simple range concept such as 0=<X=<PI or -2PI=<X=<-PI.
%	This demonstrates the use of the recall number when using =</2.

:- set(posonly)?
:- modeb(3,(+r=< #r))?
:- modeb(3,(#r=< +r))?
:- modeh(1,inrange(+r))?

% Types - note that for testing generality you need a distribution over numbers.

r(X) :- uniform(X,-9.5,7.5).
% r(X) :- normal(X,-1.5,8).

inrange1(X) :- r(X), -6.28=<X, X=< -3.14.
inrange1(X) :- r(X), 0=<X, X=< 3.14.

%%%%%%%%%%%%%%%%%%%
% Positive examples

inrange(-6.2).
inrange(-6.1).
inrange(-6.0).
inrange(-5.9).
inrange(-5.8).
inrange(-5.7).
inrange(-5.6).
inrange(-5.5).
inrange(-5.4).
inrange(-5.3).
inrange(-5.2).
inrange(-5.1).
inrange(-5.0).
inrange(-4.9).
inrange(-4.8).
inrange(-4.7).
inrange(-4.6).
inrange(-4.5).
inrange(-4.4).
inrange(-4.3).
inrange(-4.2).
inrange(-4.1).
inrange(-4.0).
inrange(-3.9).
inrange(-3.8).
inrange(-3.7).
inrange(-3.6).
inrange(-3.5).
inrange(-3.4).
inrange(-3.2).
inrange(0.1).
inrange(0.2).
inrange(0.3).
inrange(0.4).
inrange(0.5).
inrange(0.6).
inrange(0.7).
inrange(0.8).
inrange(0.9).
inrange(1.0).
inrange(1.1).
inrange(1.2).
inrange(1.3).
inrange(1.4).
inrange(1.5).
inrange(1.6).
inrange(1.7).
inrange(1.8).
inrange(1.9).
inrange(2.0).
inrange(2.1).
inrange(2.2).
inrange(2.3).
inrange(2.4).
inrange(2.5).
inrange(2.6).
inrange(2.7).
inrange(2.8).
inrange(2.9).
inrange(3.0).
inrange(3.1).

% This prunes clauses such as
%	inrange(X) :- X=<5.1, X=<6.2.

prune(_,B) :- atomof((V=<N),B), var(V), float(N), atomof((V1=<N1),B),
	float(N1), N\=N1, V==V1.
prune(_,B) :- atomof((N=<V),B), var(V), float(N), atomof((N1=<V1),B),
	float(N1), N\=N1, V==V1.

atomof(Atom,Atom) :- Atom=..[F|_], F\= ','.
atomof(Atom,(Atom,_)).
atomof(Atom,(_,Atoms)) :- atomof(Atom,Atoms).
