%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Progol4.4 demonstration example file.
%
% Predicate invention example for learning legal knight moves.
% Background knowledge contains rank and file difference rather
% than symmetric difference. Progol invents predicates to
% define rank and file difference symmetries for the knight move.
% The target theory is learnable with or without invention, but
% requires smaller samples to learn with invention than without,
% since target expression is more compact with the invented predicates.
%
% See the file `reuchess.pl' for the effect of re-using invented predicates.
%
% The moves of the chess pieces
%	
%	Pieces = {King, Queen, Bishop, Knight and Rook}
%
% are learned from examples. Each example is represented by
% a triple from the domain
%
%	Piece x (Rank x File) x (Rank x File)
%
% For instance, the following illustrates a knight (n) move example.
%         _______________
%	8|.   .   .   .  |
%	7|  .   .   .   .|
%	6|.   .   .   .  |
%	5|  .   .   .   .|
%	4|.   n   .   .  |
%	3|  .   .   .   .|
%	2|. n .   .   .  |
%	1|  .   .   .   .|
%	 |_______________|
%	  a b c d e f g h
%
% The only background predicate used is difference, i.e.
%
%	diff(X,Y) = difference between X and Y (either positive or negative)


:- fixedseed?
:- set(h,10000), set(c,5), set(i,2), set(nodes,200)?
:- modeh(1,knight(pos(+file,+rank), pos(+file,+rank)))?
:- modeb(1,rdiff(+rank,+rank,-pmrank))?
:- modeb(1,fdiff(+file,+file,-pmrank))?
:- modeb(1,rdiff(+rank,+rank,#pmrank))?
:- modeb(1,fdiff(+file,+file,#pmrank))?
:- modeb(1,invent(#pn,+pmrank))?

:- constraint(invent/2)?

:- commutative(rdiff/3)?
:- commutative(fdiff/3)?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Types

rank(1).  rank(2).  rank(3).  rank(4).
rank(5).  rank(6).  rank(7).  rank(8).

file(a).  file(b).  file(c).  file(d).
file(e).  file(f).  file(g).  file(h).

pn(q0). pn(q1). pn(q2). pn(q3). pn(q4). pn(q5). pn(q6). pn(q7). pn(q8).
pn(q9).
pn(q10). pn(q11). pn(q12). pn(q13). pn(q14). pn(q15). pn(q16). pn(q17).
pn(q18). pn(q19). 
pn(q20). pn(q21). pn(q22). pn(q23). pn(q24). pn(q25). pn(q26). pn(q27). 
pn(q28). pn(q29). 
pn(q30). pn(q31). pn(q32). pn(q33). pn(q34). pn(q35). pn(q36). pn(q37).
pn(q38). pn(q39).
pn(q40). pn(q41). pn(q42). pn(q43). pn(q44). pn(q45). pn(q46). pn(q47).
pn(q48). pn(q49).
pn(q50). pn(q51). pn(q52). pn(q53). pn(q54). pn(q55). pn(q56). pn(q57).
pn(q58). pn(q59).
pn(q60). pn(q61). pn(q62). pn(q63). pn(q64). pn(q65). pn(q66). pn(q67).
pn(q68). pn(q69).
pn(q70). pn(q71). pn(q72). pn(q73). pn(q74). pn(q75). pn(q76). pn(q77).
pn(q78). pn(q79).
pn(q80). pn(q81). pn(q82). pn(q83). pn(q84). pn(q85). pn(q86). pn(q87).
pn(q88). pn(q89).
pn(q90). pn(q91). pn(q92). pn(q93). pn(q94). pn(q95). pn(q96). pn(q97).
pn(q98). pn(q99).
pn(q100).
  

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

project(a,1).  project(b,2).  project(c,3).  project(d,4).
project(e,5).  project(f,6).  project(g,7).  project(h,8).

invent(P,X) :-
	not(solving),	     % if not currently solving the constraint
	!, invent1(P,X), !.  % access existing invented predicates 
invent(P,[PosA,_]) :-   % P is the predicate symbol, PosA is the first
	solving,	% element of the second argument
	flatten(PosA,PosA1),
	sort(PosA1,PosA2),		% PosA2 is PosA sorted and flattened 
	(clause(invent1(P,_),(element(_,PosA2)));	% Already exists
	 (gensym(P),			% Invent new predicate under invent1
	  Atom=.. [invent1,P,X],	% and add to definition 
	  asserta((Atom :- element(X,PosA2))))).

gensym(P) :-			% generates predicate symbols q1,q2,q3,..
	(retract('$gnum'(Gnum)); Gnum=0), !, % if this is first time start at 0
	Gnum1 is Gnum+1,		  % else increment and keep track of 
	asserta('$gnum'(Gnum1)),	  % symbol number in '$gnum'(Gnum1)
	name(q,[Q]),		% name gives the list of ascii numbers in
	name(Gnum,Num),		% the characters of the character constant q
	name(P,[Q|Num]), !.     % So P is basically qNum 

flatten(L1,L2) :-	    % flattens a list
	flatten(L1,L2,[]).  % i.e. gets rid of all superflous [].

flatten([],E,E).
flatten([H|T],[H|E2],E3) :- % First arg. represnets unflattened list
	not(H= [_|_]),      % Second arg. is list flattened so far
	flatten(T,E2,E3).   % Third arg. is final unflattened list
flatten([H|T],E2,E3) :-
	H= [_|_],
	flatten(H,E2,E4),
	flatten(T,E4,E3).

prune(_,Body) :-		% Prune all clauses with more than 1 rdiff
	setof(rdiff(A,B,C),in(rdiff(A,B,C),Body),[_,_|_]).
prune(_,Body) :-		% Prune all clauses with more than 1 fdiff
	setof(fdiff(A,B,C),in(fdiff(A,B,C),Body),[_,_|_]).
prune(_,Body) :-		% Prune all clauses with more than 2 invent
	setof(invent(A,B),in(invent(A,B),Body),[_,_,_|_]).
prune(_,Body) :-		% Prune clauses with rdiff(A,A,_)
	in(rdiff(X,Y,Z),Body), X==Y.
prune(_,Body) :-		% Prune clauses with fdiff(A,A,_)
	in(fdiff(X,Y,Z),Body), X==Y.


% Returns the mean and the s.d. of the mean of a bag of N numbers
meansigma(Bag,Mu,MuSg) :-   
        ms1(Bag,0,0,0,Mu,Sg,MuSg).

ms1([],Sum,Sum2,N,Mu,Sg,MuSg) :-
        Mu is Sum/N,
        Sg is (Sum2/N-Mu^2)^0.5,
        MuSg is Sg/((N)^0.5).
ms1([X|T],Sum,Sum2,N,Mu,Sg,MuSg) :-
        ms1(T,Sum+X,Sum2+X^2,N+1,Mu,Sg,MuSg).

append([],L,L).
append([H|T],L,[H|T1]) :- append(T,L,T1).

% Random examples, 80 pos and 80 neg.

knight(pos(c,4),pos(a,5)).
knight(pos(g,3),pos(f,5)).
knight(pos(d,6),pos(c,4)).
knight(pos(b,6),pos(c,8)).
knight(pos(c,7),pos(d,5)).
knight(pos(f,7),pos(d,8)).
knight(pos(c,5),pos(a,4)).
knight(pos(g,1),pos(f,3)).
knight(pos(c,3),pos(e,2)).
knight(pos(f,7),pos(d,6)).
knight(pos(h,5),pos(f,6)).
knight(pos(e,4),pos(d,2)).
knight(pos(f,6),pos(d,7)).
knight(pos(c,2),pos(e,3)).
knight(pos(b,3),pos(d,2)).
knight(pos(e,7),pos(f,5)).
knight(pos(h,7),pos(f,8)).
knight(pos(d,3),pos(f,4)).
knight(pos(c,4),pos(a,5)).
knight(pos(e,7),pos(c,8)).
knight(pos(a,3),pos(b,5)).
knight(pos(c,7),pos(e,6)).
knight(pos(h,2),pos(f,3)).
knight(pos(e,4),pos(c,3)).
knight(pos(g,4),pos(h,2)).
knight(pos(f,3),pos(g,5)).
knight(pos(d,4),pos(f,5)).
knight(pos(e,5),pos(c,4)).
knight(pos(g,7),pos(f,5)).
knight(pos(h,1),pos(f,2)).
knight(pos(g,6),pos(f,4)).
knight(pos(d,3),pos(c,1)).
knight(pos(b,7),pos(c,5)).
knight(pos(g,4),pos(e,5)).
knight(pos(c,5),pos(e,6)).
knight(pos(g,2),pos(f,4)).
knight(pos(d,6),pos(c,4)).
knight(pos(c,5),pos(a,4)).
knight(pos(h,2),pos(f,3)).
knight(pos(a,7),pos(c,8)).
knight(pos(g,8),pos(e,7)).
knight(pos(b,4),pos(a,6)).
knight(pos(b,6),pos(d,5)).
knight(pos(c,6),pos(e,5)).
knight(pos(f,5),pos(e,3)).
knight(pos(f,4),pos(h,5)).
knight(pos(d,7),pos(e,5)).
knight(pos(g,6),pos(h,8)).
knight(pos(c,1),pos(e,2)).
knight(pos(h,6),pos(g,8)).
knight(pos(a,4),pos(b,6)).
knight(pos(f,1),pos(d,2)).
knight(pos(e,5),pos(f,7)).
knight(pos(e,3),pos(f,5)).
knight(pos(c,4),pos(e,5)).
knight(pos(g,3),pos(e,2)).
knight(pos(d,4),pos(c,2)).
knight(pos(g,1),pos(f,3)).
knight(pos(e,4),pos(f,2)).
knight(pos(d,7),pos(e,5)).
knight(pos(g,6),pos(e,5)).
knight(pos(d,6),pos(b,5)).
knight(pos(b,7),pos(d,8)).
knight(pos(e,1),pos(d,3)).
knight(pos(h,6),pos(f,7)).
knight(pos(f,7),pos(d,6)).
knight(pos(c,2),pos(e,1)).
knight(pos(e,3),pos(d,5)).
knight(pos(b,4),pos(d,5)).
knight(pos(f,2),pos(h,1)).
knight(pos(c,2),pos(a,3)).
knight(pos(d,5),pos(b,6)).
knight(pos(c,7),pos(d,5)).
knight(pos(g,1),pos(f,3)).
knight(pos(e,5),pos(f,3)).
knight(pos(h,5),pos(f,4)).
knight(pos(a,1),pos(b,3)).
knight(pos(c,8),pos(a,7)).
knight(pos(d,6),pos(c,4)).
knight(pos(b,3),pos(a,1)).
:-knight(pos(g,7),pos(g,6)).
:-knight(pos(e,6),pos(d,1)).
:-knight(pos(h,4),pos(e,4)).
:-knight(pos(f,8),pos(f,5)).
:-knight(pos(a,5),pos(g,5)).
:-knight(pos(f,2),pos(f,3)).
:-knight(pos(b,1),pos(h,6)).
:-knight(pos(e,4),pos(d,3)).
:-knight(pos(c,1),pos(c,4)).
:-knight(pos(e,2),pos(e,8)).
:-knight(pos(a,3),pos(b,8)).
:-knight(pos(d,3),pos(f,1)).
:-knight(pos(c,7),pos(b,8)).
:-knight(pos(f,5),pos(d,3)).
:-knight(pos(d,5),pos(b,2)).
:-knight(pos(e,4),pos(h,5)).
:-knight(pos(d,4),pos(d,4)).
:-knight(pos(d,3),pos(h,7)).
:-knight(pos(g,8),pos(g,3)).
:-knight(pos(c,5),pos(g,2)).
:-knight(pos(d,2),pos(c,8)).
:-knight(pos(d,7),pos(g,1)).
:-knight(pos(h,7),pos(c,7)).
:-knight(pos(d,2),pos(c,1)).
:-knight(pos(c,6),pos(g,6)).
:-knight(pos(c,6),pos(a,1)).
:-knight(pos(a,2),pos(d,3)).
:-knight(pos(a,1),pos(a,3)).
:-knight(pos(a,4),pos(d,3)).
:-knight(pos(b,6),pos(f,8)).
:-knight(pos(b,6),pos(e,1)).
:-knight(pos(a,6),pos(d,1)).
:-knight(pos(a,5),pos(c,1)).
:-knight(pos(d,1),pos(a,3)).
:-knight(pos(g,3),pos(g,2)).
:-knight(pos(b,5),pos(c,2)).
:-knight(pos(a,3),pos(g,1)).
:-knight(pos(b,8),pos(a,8)).
:-knight(pos(b,2),pos(a,5)).
:-knight(pos(g,8),pos(c,7)).
:-knight(pos(e,5),pos(c,2)).
:-knight(pos(a,3),pos(h,1)).
:-knight(pos(d,8),pos(a,1)).
:-knight(pos(a,4),pos(f,4)).
:-knight(pos(h,3),pos(b,4)).
:-knight(pos(c,4),pos(a,6)).
:-knight(pos(h,5),pos(h,6)).
:-knight(pos(h,7),pos(g,4)).
:-knight(pos(b,6),pos(c,7)).
:-knight(pos(h,2),pos(d,6)).
:-knight(pos(d,8),pos(g,2)).
:-knight(pos(e,2),pos(d,6)).
:-knight(pos(a,3),pos(e,8)).
:-knight(pos(b,7),pos(g,4)).
:-knight(pos(c,5),pos(g,1)).
:-knight(pos(c,6),pos(a,3)).
:-knight(pos(g,1),pos(f,8)).
:-knight(pos(a,7),pos(d,7)).
:-knight(pos(b,5),pos(c,6)).
:-knight(pos(d,7),pos(b,1)).
:-knight(pos(c,1),pos(a,1)).
:-knight(pos(g,7),pos(f,1)).
:-knight(pos(a,2),pos(b,2)).
:-knight(pos(g,3),pos(g,7)).
:-knight(pos(g,7),pos(e,5)).
:-knight(pos(b,4),pos(d,6)).
:-knight(pos(f,4),pos(g,1)).
:-knight(pos(c,2),pos(c,4)).
:-knight(pos(e,4),pos(b,5)).
:-knight(pos(f,8),pos(e,2)).
:-knight(pos(a,3),pos(h,3)).
:-knight(pos(e,1),pos(g,1)).
:-knight(pos(f,7),pos(h,5)).
:-knight(pos(b,3),pos(e,7)).
:-knight(pos(a,2),pos(e,6)).
:-knight(pos(e,8),pos(d,8)).
:-knight(pos(c,7),pos(c,3)).
:-knight(pos(e,6),pos(h,3)).
:-knight(pos(g,6),pos(g,2)).
:-knight(pos(f,7),pos(b,7)).
