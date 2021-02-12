%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Progol4.4 demonstration example file.
% 
% Predicate invention example for inventing append1/3 given examples
% of reverse. Examples of the invented predicate q1/3 can be found
% in the file append1.pl.

:- set(h,400), set(r,1600), set(c,2)?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mode declarations

:- modeh(1,reverse([+r|+list],+list))?
:- modeb(1,reverse(+list,-list))?
:- modeb(1,invent(#pn,[+list,+r,+list]))?
% :- set(posonly)?

:- constraint(invent/2)?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Type definitions

list([]).
list([H|T]) :- r(H), list(T).

r(0). r(1). r(2). r(3). r(4).

% A list of predicate symbols

pn(q0).pn(q1).pn(q2).pn(q3).pn(q4).pn(q5).pn(q6).pn(q7).pn(q8).pn(q9).
pn(q10).pn(q11).pn(q12).pn(q13).pn(q14).pn(q15).pn(q16).pn(q17).pn(q18).pn(q19).
pn(q20).pn(q21).pn(q22).pn(q23).pn(q24).pn(q25).pn(q26).pn(q27).pn(q28).pn(q29).

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% User-defined predicate invention code.

invent(P,X) :-			% Non-solving clause
	not(solving),
	!, defn(P,X), !.	% Simply use definition of P
invent(P,[[PosX,_],[PosY,_],[PosZ,_]]) :-
	solving,		% Solving clause,
	flatten1(PosX,PosX1),	% Flatten substs. for pos examples for X,Y,Z.
	flatten1(PosY,PosY1),
	flatten1(PosZ,PosZ1),
	maketriple(PosX1,PosY1,PosZ1,T), % Put into triples.
	sort(T,T1),		% Make normal form model for P by sorting.
	(clause(model(P,T1),true); % Already exists?
	 (gensym(P),		% Otherwise, create a new predicate symbol P.
	  asserta(model(P,T1)), % Assert the model of P.
	  assertdef(P,T1))).	% Assert the definition of P.

assertdef(P,PosA2) :-
	element(E,PosA2),
	asserta(defn(P,E)),
	fail.
assertdef(_,_).

maketriple([],_,_,[]).
maketriple(_,[],_,[]).
maketriple(_,_,[],[]).
maketriple([H1|T1],[H2|T2],[H3|T3],[[H1,H2,H3]|T4]) :-
	maketriple(T1,T2,T3,T4).

gensym(P) :-
	(retract('$gnum'(Gnum)); Gnum=0), !,
	Gnum1 is Gnum+1,
	asserta('$gnum'(Gnum1)),
	write(asserta('$gnum'(Gnum1))), nl,
	name(q,[Q]),
	name(Gnum,Num),
	name(P,[Q|Num]), !.

flatten1([],[]).
flatten1([[H]|T1],[H|T2]) :- flatten1(T1,T2).

prune(_,reverse(X,Y)) :- X==Y.
prune(_,invent(_,_)).		% Ban leftmost invention
prune(Head,Body) :-		% Ban invention of equivalent predicate
	vars(Head,VH),
	in(invent(_,Args),Body),
	vars(Args,VA),
	VH==VA.
prune(_,Body) :-		% Invention predicate must have distinct vars.
	in(invent(_,Args),Body),
	length(Args,N),
	vars(Args,Vs),
	length(Vs,N1),
	N1\=N.
prune(reverse(X,Y),Body) :-
	in(reverse(Z,_),Body), Y==Z.

vars(T,Vs) :-			% Find set of variables
	vars([T],Vs1,[]),
	qsort(Vs1,Vs), !.

vars([],Vs,Vs).
vars([V|Ts],[V|Vs1],Vs2) :-
	var(V),
	vars(Ts,Vs1,Vs2).
vars([T|Ts],Vs1,Vs2) :-
	T=.. [_|Ts1],
	vars(Ts1,Vs1,Vs3),
	vars(Ts,Vs3,Vs2).

qsort([],[]).
qsort([H|T],L) :-
	part(H,T,L1,L2),
	qsort(L1,L3),
	qsort(L2,L4),
	append(L3,[H|L4],L).

part(H,[],[],[]).
part(H,[X|T],L1,L2) :- H==X, part(H,T,L1,L2).
part(H,[X|T],[X|L1],L2) :- X@<H, part(H,T,L1,L2).
part(H,[X|T],L1,[X|L2]) :- H@<X, part(H,T,L1,L2).

append([],L,L).
append([H|T],L,[H|R]) :- append(T,L,R).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Positive examples

reverse([],[]).
reverse([1],[1]).
reverse([1,2,3],[3,2,1]).
reverse([2],[2]).
reverse([3],[3]).
reverse([4],[4]).
reverse([1,2],[2,1]).
reverse([1,3],[3,1]).
reverse([1,4],[4,1]).
reverse([2,2],[2,2]).
reverse([2,3],[3,2]).
reverse([2,4],[4,2]).
reverse([0,1,2],[2,1,0]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Negative examples
:- reverse([1],[]).
:- reverse([],[0]).
:- reverse([0,1],[0,1]).
:- reverse([0,1,2],[2,0,1]).
:- reverse([1,2,3],[2,3,1]).
:- reverse([1,2,3],[3,2,4]).
:- reverse([1,2,3],[4,2,1]).
:- reverse([0,1,2,3],[2,1,0]).
:- reverse([2,3],[4,2]).

%%%%%%%%%%%%%%%%%%%%%%
% Integrity constraints
 
:- hypothesis(Head,Body,_), nongenerative((Head,Body)).
			% hypothesised clauses must be strongly generative

nongenerative(C) :-     % C is a comma-separated list of atoms
	in(A1,C), var(U,A1),
	not((in(A2,C), A1\==A2, var(V,A2), U==V)).

var(V,V) :- var(V).
var(V,T) :- arg(N,T,T1), N>0, var(V,T1).

