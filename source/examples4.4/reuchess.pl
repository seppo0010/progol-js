%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Progol4.4 demonstration example file.
%
% This file demonstrates the re-use of predicates invented and
% used in the definitions resulting from invchess.pl. Th definitions
% of these invented predicates are at the end of this file.
% The examples and background knowledge are otherwise the same
% as in invchess.pl. This is so-called `repeat' learning. Note that
% the search is faster with the new predicates, and that the definition
% is also more compact.


:- fixedseed?
:- set(h,10000), set(c,4), set(i,2), set(nodes,200)?
:- set(posonly)?
:- set(inflate,100)?
:- modeh(1,move(#piece,pos(+file,+rank),pos(+file,+rank)))?
:- modeb(1,rdiff(+rank,+rank,-int))?
:- modeb(1,fdiff(+file,+file,-int))?
:- modeb(1,rdiff(+rank,+rank,#int))?
:- modeb(1,fdiff(+file,+file,#int))?
:- modeb(*,defn(#pn,+pmrank))?	% This allows definitions of
			% invented predicates to be used.

:- constraint(invent/2)?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Types

piece(king).  piece(queen).  piece(bishop).
piece(knight).  piece(rook).  piece(pawn).

rank(1).  rank(2).  rank(3).  rank(4).
rank(5).  rank(6).  rank(7).  rank(8).

file(a).  file(b).  file(c).  file(d).
file(e).  file(f).  file(g).  file(h).

% A list of predicate symbols

pn(q0).pn(q1).pn(q2).pn(q3).pn(q4).pn(q5).pn(q6).pn(q7).pn(q8).pn(q9).
pn(q10).pn(q11).pn(q12).pn(q13).pn(q14).pn(q15).pn(q16).pn(q17).pn(q18).pn(q19).
pn(q20).pn(q21).pn(q22).pn(q23).pn(q24).pn(q25).pn(q26).pn(q27).pn(q28).pn(q29).

nrank(-1).  nrank(-2).  nrank(-3).  nrank(-4).
nrank(-5).  nrank(-6).  nrank(-7).  nrank(-8).

pmrank(X) :- rank(X).
pmrank(X) :- nrank(X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Background knowledge

rdiff(Rank1,Rank2,Diff) :-
	rank(Rank1), rank(Rank2),
	Diff is Rank1-Rank2.

fdiff(File1,File2,Diff) :-
	file(File1), file(File2),
	project(File1,Rank1),
	project(File2,Rank2),
	Diff is Rank1-Rank2.

abs(X,X) :- X>=0.
abs(X,Y) :- X<0, Y is -X.

project(a,1).  project(b,2).  project(c,3).  project(d,4).
project(e,5).  project(f,6).  project(g,7).  project(h,8).

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% User-defined predicate invention code.

invent(P,X) :-			% Non-solving clause
	not(solving),
	!, defn(P,X), !.	% Simply use definition of P
invent(P,[PosA,_]) :-
	solving,		% Solving clause,
	flatten(PosA,PosA1),	% Flatten substs. for positive examples.
	sort(PosA1,PosA2),	% Make normal form model for P by sorting.
	not(element(X,PosA2),not(number(X))),
				% Check no Skolem constants.
	(clause(model(P,PosA2),true);	% Already exists?
	 (gensym(P),		% Otherwise, create a new predicate symbol P.
	  asserta(model(P,PosA2)), % Assert the model of P.
	  assertdef(P,PosA2))). % Assert the definition of P.

assertdef(P,PosA2) :-
	element(E,PosA2),
	asserta(defn(P,E)),
	fail.
assertdef(_,_).

gensym(P) :-
	(retract('$gnum'(Gnum)); Gnum=0),
	Gnum1 is Gnum+1,
	asserta('$gnum'(Gnum1)),
	write(asserta('$gnum'(Gnum1))), nl,
	name(q,[Q]),
	name(Gnum,Num),
	name(P,[Q|Num]), !.

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

prune(_,Body) :-	% At most one rdiff in the Body.
	setof(rdiff(A,B,C),in(rdiff(A,B,C),Body),[_,_|_]).
prune(_,Body) :-	% At most one fdiff in the Body.
	setof(fdiff(A,B,C),in(fdiff(A,B,C),Body),[_,_|_]).
prune(_,Body) :-	% At most two invent atoms in the Body.
	setof(invent(A,B,C),in(invent(A,B,C),Body),[_,_,_|_]).
prune(_,Body) :-	% First two variables of rdiff must be distinct.
	in(rdiff(X,Y,Z),Body), X==Y.
prune(_,Body) :-	% First two variables of fdiff must be distinct.
	in(fdiff(X,Y,Z),Body), X==Y.

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Positive examples

move(knight,pos(b,8),pos(c,6)).
move(knight,pos(f,7),pos(e,5)).
move(knight,pos(e,4),pos(d,2)).
move(knight,pos(c,8),pos(d,6)).
move(knight,pos(d,2),pos(f,1)).
move(knight,pos(a,4),pos(c,5)).
move(knight,pos(b,5),pos(c,7)).
move(knight,pos(b,2),pos(c,4)).
move(knight,pos(a,8),pos(b,6)).
move(knight,pos(a,6),pos(c,5)).
move(knight,pos(a,6),pos(b,4)).
move(knight,pos(f,4),pos(g,6)).
move(knight,pos(e,5),pos(f,7)).
move(knight,pos(g,6),pos(f,8)).
move(knight,pos(e,3),pos(g,2)).
move(knight,pos(d,4),pos(f,5)).
move(knight,pos(d,2),pos(b,3)).
move(knight,pos(b,6),pos(d,7)).
move(knight,pos(c,2),pos(b,4)).
move(knight,pos(f,1),pos(d,2)).
move(knight,pos(g,6),pos(h,4)).
move(knight,pos(a,3),pos(c,2)).
move(knight,pos(f,4),pos(h,3)).
move(knight,pos(d,8),pos(b,7)).
move(knight,pos(a,5),pos(c,6)).
move(knight,pos(b,5),pos(a,3)).
move(knight,pos(e,6),pos(f,4)).
move(knight,pos(f,6),pos(d,5)).
move(knight,pos(d,1),pos(b,2)).
move(knight,pos(c,6),pos(d,4)).
move(knight,pos(f,7),pos(h,6)).
move(knight,pos(c,1),pos(d,3)).

:- move(knight,pos(f,1),pos(g,4)).
:- move(knight,pos(f,1),pos(c,2)).
:- move(knight,pos(f,1),pos(h,3)).
:- move(knight,pos(f,3),pos(h,1)).
:- move(knight,pos(a,4),pos(h,2)).
:- move(knight,pos(a,5),pos(h,3)).
:- move(knight,pos(a,6),pos(h,4)).
:- move(knight,pos(b,6),pos(a,3)).
:- move(knight,pos(b,4),pos(a,3)).
:- move(knight,pos(c,5),pos(a,3)).
:- move(knight,pos(c,4),pos(a,2)).
:- move(knight,pos(c,3),pos(a,1)).
:- move(knight,pos(c,7),pos(a,5)).
:- move(knight,pos(c,6),pos(a,4)).
:- move(knight,pos(c,2),pos(a,7)).
:- move(knight,pos(e,8),pos(b,8)).
:- move(knight,pos(d,8),pos(d,6)).

%%%%%%%%%%%%%%%%%%%%
%
% Invented predicates

defn(q5,2).
defn(q5,-2).
defn(q10,1).
defn(q10,-1).
