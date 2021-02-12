%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Learning legal chess moves. The moves of the chess pieces
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
% The only background predicate used is symmetric difference, i.e.
%
%	diff(X,Y) = absolute difference between X and Y
%
% Symmetric difference is defined separately on Rank and File.


:- fixedseed?
:- set(c,2), set(i,1), set(posonly)?
:- modeh(1,move(#piece,pos(+file,+rank),pos(+file,+rank)))?
:- modeb(1,rdiff(+rank,+rank,-nat))?
:- modeb(1,fdiff(+file,+file,-nat))?
:- modeb(1,rdiff(+rank,+rank,#nat))?
:- modeb(1,fdiff(+file,+file,#nat))?

:- commutative(rdiff/3)?
:- commutative(fdiff/3)?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Types

piece(king).  piece(queen).  piece(bishop).
piece(knight).  piece(rook).  piece(pawn).

rank(1).  rank(2).  rank(3).  rank(4).
rank(5).  rank(6).  rank(7).  rank(8).

file(a).  file(b).  file(c).  file(d).
file(e).  file(f).  file(g).  file(h).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Background knowledge

rdiff(Rank1,Rank2,Diff) :-
	rank(Rank1), rank(Rank2),
	Diff1 is Rank1-Rank2,
	abs(Diff1,Diff).

fdiff(File1,File2,Diff) :-
	file(File1), file(File2),
	project(File1,Rank1),
	project(File2,Rank2),
	Diff1 is Rank1-Rank2,
	abs(Diff1,Diff).

abs(X,X) :- X>=0.
abs(X,Y) :- X<0, Y is -X.

project(a,1).  project(b,2).  project(c,3).  project(d,4).
project(e,5).  project(f,6).  project(g,7).  project(h,8).

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Positive examples

move(rook,pos(a,2),pos(f,2)).
move(rook,pos(g,8),pos(f,8)).
move(rook,pos(h,8),pos(h,6)).
move(rook,pos(c,1),pos(c,3)).
move(rook,pos(h,6),pos(b,6)).
move(rook,pos(b,1),pos(b,5)).


move(bishop,pos(f,6),pos(g,7)).
move(bishop,pos(h,2),pos(g,1)).
move(bishop,pos(h,2),pos(g,1)).
move(bishop,pos(e,6),pos(d,5)).
move(bishop,pos(d,8),pos(e,7)).
move(bishop,pos(b,4),pos(b,4)).
move(bishop,pos(e,4),pos(d,5)).
move(bishop,pos(a,3),pos(b,2)).
move(bishop,pos(c,5),pos(a,3)).
move(bishop,pos(h,6),pos(f,8)).
move(bishop,pos(d,3),pos(f,5)).
move(bishop,pos(a,8),pos(a,8)).
move(bishop,pos(h,6),pos(c,1)).
move(bishop,pos(a,7),pos(g,1)).
move(bishop,pos(e,8),pos(a,4)).
move(bishop,pos(f,6),pos(g,7)).
move(bishop,pos(c,3),pos(b,4)).
move(bishop,pos(a,2),pos(c,4)).
move(bishop,pos(g,7),pos(f,8)).
move(bishop,pos(g,6),pos(b,1)).


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


move(queen,pos(c,7),pos(c,3)).
move(queen,pos(d,3),pos(c,3)).
move(queen,pos(e,8),pos(c,6)).
move(queen,pos(d,3),pos(f,3)).
move(queen,pos(d,2),pos(g,5)).
move(queen,pos(b,3),pos(b,5)).
move(queen,pos(h,1),pos(h,3)).
move(queen,pos(h,1),pos(e,4)).
move(queen,pos(f,1),pos(f,4)).
move(queen,pos(f,7),pos(a,7)).
move(queen,pos(f,5),pos(h,7)).
move(queen,pos(e,1),pos(b,4)).
move(queen,pos(h,4),pos(h,4)).
move(queen,pos(c,2),pos(b,1)).
move(queen,pos(h,8),pos(e,8)).
move(queen,pos(h,2),pos(e,2)).
move(queen,pos(b,7),pos(a,6)).
move(queen,pos(h,7),pos(a,7)).
move(queen,pos(d,4),pos(d,1)).
move(queen,pos(a,5),pos(e,1)).
move(queen,pos(a,7),pos(a,6)).
move(queen,pos(c,8),pos(c,5)).
move(queen,pos(a,2),pos(e,2)).
move(queen,pos(f,1),pos(f,7)).
move(queen,pos(b,5),pos(c,6)).
move(queen,pos(c,7),pos(e,7)).
move(queen,pos(h,5),pos(d,5)).
move(queen,pos(h,4),pos(h,7)).
move(queen,pos(g,5),pos(g,2)).
move(queen,pos(c,5),pos(e,5)).
move(queen,pos(e,8),pos(h,8)).
move(queen,pos(d,2),pos(b,4)).
move(queen,pos(e,4),pos(g,2)).
move(queen,pos(g,6),pos(c,2)).
move(queen,pos(a,4),pos(d,1)).
move(queen,pos(d,8),pos(c,7)).
move(queen,pos(d,1),pos(a,1)).
move(queen,pos(b,6),pos(d,8)).
move(queen,pos(g,3),pos(g,2)).
move(queen,pos(g,2),pos(f,3)).
move(queen,pos(b,1),pos(b,3)).
move(queen,pos(b,5),pos(b,6)).
move(queen,pos(f,2),pos(h,4)).
move(queen,pos(e,3),pos(c,3)).
move(queen,pos(h,1),pos(e,4)).
move(queen,pos(h,8),pos(e,5)).
move(queen,pos(e,1),pos(h,4)).
move(queen,pos(d,4),pos(d,8)).
move(queen,pos(e,5),pos(c,3)).
move(queen,pos(c,6),pos(h,1)).
move(queen,pos(e,6),pos(a,6)).
move(queen,pos(g,1),pos(e,1)).
move(queen,pos(c,8),pos(b,7)).
move(queen,pos(e,2),pos(d,1)).
move(queen,pos(h,3),pos(d,7)).
move(queen,pos(c,2),pos(b,3)).
move(queen,pos(h,8),pos(c,3)).
move(queen,pos(c,2),pos(c,6)).
move(queen,pos(d,8),pos(d,8)).
move(queen,pos(f,4),pos(f,4)).
move(queen,pos(a,3),pos(d,6)).
move(queen,pos(b,2),pos(d,2)).
move(queen,pos(f,3),pos(f,2)).
move(queen,pos(h,4),pos(h,5)).
move(queen,pos(d,4),pos(h,4)).
move(queen,pos(e,6),pos(d,6)).
move(queen,pos(a,4),pos(g,4)).
move(queen,pos(h,8),pos(h,4)).
move(queen,pos(d,7),pos(d,5)).
move(queen,pos(c,1),pos(h,1)).


move(king,pos(h,7),pos(g,8)).
move(king,pos(a,3),pos(a,2)).
move(king,pos(b,6),pos(c,7)).
move(king,pos(h,7),pos(h,6)).
move(king,pos(c,6),pos(d,6)).
move(king,pos(c,6),pos(b,6)).
move(king,pos(f,4),pos(e,5)).
move(king,pos(g,3),pos(f,4)).
move(king,pos(a,7),pos(a,8)).
move(king,pos(g,7),pos(g,8)).
move(king,pos(c,2),pos(c,3)).
move(king,pos(f,5),pos(g,4)).
move(king,pos(d,5),pos(c,5)).
move(king,pos(c,1),pos(c,2)).
move(king,pos(c,7),pos(d,7)).
move(king,pos(c,1),pos(d,1)).
move(king,pos(d,5),pos(c,6)).
move(king,pos(g,3),pos(h,4)).
move(king,pos(h,8),pos(g,8)).
move(king,pos(a,2),pos(b,3)).
move(king,pos(c,7),pos(d,7)).
move(king,pos(h,1),pos(g,1)).
move(king,pos(b,5),pos(b,6)).
move(king,pos(c,5),pos(d,6)).
move(king,pos(b,8),pos(b,7)).
move(king,pos(e,6),pos(d,6)).
move(king,pos(g,7),pos(g,6)).
move(king,pos(c,3),pos(d,3)).
move(king,pos(c,2),pos(b,1)).
move(king,pos(d,6),pos(e,6)).
move(king,pos(c,7),pos(c,6)).
move(king,pos(b,1),pos(c,2)).
move(king,pos(h,3),pos(h,4)).
move(king,pos(g,7),pos(g,8)).
move(king,pos(b,7),pos(c,8)).
move(king,pos(h,8),pos(h,7)).
move(king,pos(d,4),pos(d,3)).
move(king,pos(b,4),pos(a,3)).
move(king,pos(h,1),pos(h,2)).
move(king,pos(g,5),pos(h,4)).
move(king,pos(b,3),pos(a,2)).
move(king,pos(e,7),pos(f,8)).
move(king,pos(c,4),pos(c,3)).
move(king,pos(g,6),pos(h,7)).
move(king,pos(h,1),pos(g,2)).
move(king,pos(h,1),pos(h,2)).
move(king,pos(d,1),pos(c,2)).
move(king,pos(a,2),pos(b,2)).
move(king,pos(b,3),pos(c,3)).
move(king,pos(g,7),pos(g,6)).
move(king,pos(b,8),pos(c,8)).
move(king,pos(f,1),pos(g,1)).
move(king,pos(f,7),pos(g,8)).
move(king,pos(d,4),pos(c,4)).
move(king,pos(d,7),pos(c,6)).
move(king,pos(h,5),pos(h,6)).
move(king,pos(e,6),pos(d,6)).
move(king,pos(e,3),pos(d,3)).
move(king,pos(g,5),pos(h,4)).
move(king,pos(h,8),pos(g,7)).

% move1(P,pos(F1,R1),pos(F2,R2)) :-
%	move(P,pos(F1,R1),pos(F2,R2)),
%	file(F1), rank(R1),
%	file(F2), rank(R2),
%	pos(F1,R1)\=pos(F2,R2).
