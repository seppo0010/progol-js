%%%%%%%%%%%%%%%%%%
% KRK illegal problem. This involves deciding whether a chess ending
%	with White King, White Rook and Black King is illegal
%	when White is to move. Example positions are defined as
%
%	    illegal(WKRank,WKFile,WRRank,WRFile,BKRank,BKFile)
%
%	Thus the following illegal position is defined as follows:
%
%	      File
%	|~~~~~~~~~~~~~~~~| 7
%	|  WK            | 6
%	|                | 5
% Rank  |                | 4    =  illegal(6,1,3,2,3,7)
%	|    WR        BK| 3
%	|                | 2
%	|                | 1
%	|________________| 0
%	  0 1 2 3 4 5 6 7

%%%%%%%%%%%%%%%%%%
:- set(i,1)?
:- set(c,2)?
:- set(posonly)?
:- set(noise,100)?
:- modeh(1,illegal(+rf,+rf,+rf,+rf,+rf,+rf))?
% :- modeb(1,lt(+rf,+rf))?
:- modeb(1,adj(+rf,+rf))?
:- commutative(adj/2)?

%%%%%%%%%%%%%%%%%%
% Type definition for rank or file

% rf(X) :- nat(X), 0=<X, X=<7.
rf(0).  rf(1).  rf(2).  rf(3).  rf(4).  rf(5).  rf(6).  rf(7).

%%%%%%%%%%%%%%%%%%
% Background knowledge

lt(0,1).
lt(0,2).
lt(0,3).
lt(0,4).
lt(0,5).
lt(0,6).
lt(0,7).
lt(1,2).
lt(1,3).
lt(1,4).
lt(1,5).
lt(1,6).
lt(1,7).
lt(2,3).
lt(2,4).
lt(2,5).
lt(2,6).
lt(2,7).
lt(3,4).
lt(3,5).
lt(3,6).
lt(3,7).
lt(4,5).
lt(4,6).
lt(4,7).
lt(5,6).
lt(5,7).
lt(6,7).

% adj(R/C,R/C)
adj(0,0).
adj(1,1).
adj(2,2).
adj(3,3).
adj(4,4).
adj(5,5).
adj(6,6).
adj(7,7).
adj(0,1).
adj(1,2).
adj(2,3).
adj(3,4).
adj(4,5).
adj(5,6).
adj(6,7).
adj(7,6).
adj(6,5).
adj(5,4).
adj(4,3).
adj(3,2).
adj(2,1).
adj(1,0).

%%%%%%%%%%%%%%%%%%
% Positive examples


illegal(5,5,4,6,4,1).
illegal(5,6,7,5,7,5).
illegal(3,2,4,6,6,6).
illegal(2,1,6,1,2,0).
illegal(3,0,2,3,4,0).
illegal(6,2,5,1,6,1).
illegal(0,3,2,5,2,6).
illegal(2,6,4,1,1,7).
illegal(7,0,7,0,3,6).
illegal(7,6,3,3,6,6).
illegal(4,2,1,7,3,2).
illegal(5,1,2,3,2,2).
illegal(0,3,1,6,5,6).
illegal(2,0,0,7,0,5).
illegal(2,4,0,7,3,7).
illegal(4,5,2,4,5,6).
illegal(5,2,2,3,6,2).
illegal(4,0,5,6,7,6).
illegal(2,1,4,0,6,0).
illegal(5,6,4,7,6,7).
illegal(6,7,6,1,4,1).
illegal(5,3,5,2,3,2).
illegal(6,3,3,7,3,2).
illegal(2,6,7,4,5,4).
illegal(2,1,3,0,4,0).
illegal(4,7,2,1,0,1).
illegal(3,5,0,5,0,6).
illegal(5,0,3,5,5,1).
illegal(2,2,1,3,0,3).
illegal(1,3,2,1,2,6).
illegal(6,6,0,3,6,6).
illegal(6,6,3,6,5,5).
illegal(5,0,6,0,5,0).
illegal(3,2,7,6,7,0).
illegal(5,6,5,0,1,0).
illegal(1,2,6,6,5,6).
illegal(0,5,1,4,4,4).
illegal(2,3,4,6,1,3).
illegal(1,4,6,6,6,0).
illegal(7,1,3,3,3,0).
illegal(2,5,6,2,6,3).
illegal(1,7,0,5,6,5).
illegal(1,7,1,1,0,7).
illegal(3,3,3,3,3,3).
illegal(4,4,4,2,0,2).
illegal(2,1,3,4,6,4).
illegal(4,7,4,1,6,1).
illegal(4,6,2,2,2,0).
illegal(2,2,4,6,4,2).
illegal(4,7,6,6,6,2).
illegal(5,6,5,4,4,4).
illegal(7,1,3,4,3,5).
illegal(3,3,5,7,2,3).
illegal(2,5,0,4,0,1).
illegal(0,0,6,7,7,7).
illegal(7,6,7,4,5,4).
illegal(2,6,6,3,2,7).
illegal(4,3,2,2,4,4).
illegal(1,6,3,7,3,5).
illegal(3,6,0,7,0,0).
illegal(2,6,0,5,1,7).
illegal(6,3,3,4,3,4).
illegal(2,7,5,5,3,5).
illegal(0,1,0,1,6,2).
illegal(6,5,3,6,7,5).
illegal(6,7,1,5,6,5).
illegal(4,0,3,5,5,0).
illegal(4,7,7,6,3,7).
illegal(6,2,3,7,3,4).
illegal(3,6,7,6,7,4).
illegal(5,1,1,4,1,2).
illegal(4,6,7,5,3,6).
illegal(2,2,5,1,5,3).
illegal(6,0,0,1,0,7).
illegal(7,2,7,7,2,7).
illegal(1,6,2,6,4,6).
illegal(7,0,4,6,7,6).
illegal(1,1,3,0,2,0).
illegal(3,5,0,7,6,7).
illegal(2,6,1,4,3,7).
illegal(6,5,1,0,7,5).
illegal(2,1,4,4,4,6).
illegal(0,7,0,5,0,3).
illegal(6,1,5,3,5,1).
illegal(0,6,6,3,6,7).
illegal(0,3,6,4,1,2).
illegal(0,0,4,5,1,5).
illegal(7,2,6,5,6,4).
illegal(7,6,7,0,7,5).
illegal(4,6,3,7,3,6).
illegal(4,2,4,5,5,3).
illegal(3,1,4,3,2,3).
illegal(1,0,4,5,0,0).
illegal(7,5,5,3,5,7).
illegal(3,1,5,0,5,7).
illegal(4,1,4,4,4,6).
illegal(5,5,6,7,7,7).
illegal(1,2,1,5,1,4).
illegal(0,4,0,1,1,1).
illegal(0,7,1,0,1,0).
illegal(7,2,3,6,4,6).
illegal(6,0,0,1,0,5).
illegal(0,0,5,0,5,1).
illegal(7,0,5,1,5,7).
illegal(1,1,0,0,0,1).
illegal(6,5,0,4,7,4).
illegal(2,2,2,6,2,4).
illegal(7,7,0,5,0,5).
illegal(4,2,6,6,5,6).
illegal(5,3,6,0,6,7).
illegal(2,1,6,7,6,3).
illegal(5,3,1,4,0,4).
illegal(3,0,2,1,2,4).
illegal(4,7,1,4,5,4).
illegal(4,7,2,2,5,7).
illegal(4,5,3,6,0,6).
illegal(5,0,3,3,7,3).
illegal(0,1,6,5,1,0).
illegal(2,6,6,1,4,1).
illegal(7,2,1,4,6,4).
illegal(5,7,6,5,4,6).
illegal(5,4,2,2,4,5).
illegal(0,3,2,1,2,4).
illegal(3,6,4,2,4,5).
illegal(6,1,2,1,7,2).
illegal(6,0,3,4,7,1).
illegal(1,4,0,6,3,6).
illegal(5,2,3,2,4,2).
illegal(7,1,7,0,6,0).
illegal(5,6,3,3,0,3).
illegal(6,6,6,7,5,7).
illegal(0,5,0,4,0,1).
illegal(6,3,1,7,5,2).
illegal(4,2,7,6,7,0).
illegal(4,0,4,0,3,0).
illegal(1,3,3,7,0,7).
illegal(5,4,5,3,2,3).
illegal(7,0,5,7,6,0).
illegal(2,2,6,7,5,7).
illegal(3,1,0,3,2,2).
illegal(6,0,4,3,7,3).
illegal(7,1,5,2,3,2).
illegal(7,4,7,4,0,3).
illegal(7,4,7,0,7,2).
illegal(7,6,3,1,6,1).
illegal(1,1,7,3,0,1).
illegal(7,7,1,7,1,6).
illegal(4,3,3,6,5,2).
illegal(6,4,2,5,2,7).
illegal(0,0,3,2,3,7).
illegal(6,4,3,7,5,7).
illegal(0,6,0,6,3,5).
illegal(4,0,2,4,2,5).
illegal(2,4,6,6,1,5).
illegal(4,6,3,1,3,5).
illegal(1,0,2,6,2,6).
illegal(4,5,6,1,6,4).
illegal(0,5,4,3,2,3).
illegal(6,3,5,7,7,7).
illegal(6,3,3,0,3,6).
illegal(0,3,6,4,3,4).
illegal(5,0,2,7,2,3).
illegal(2,6,2,5,0,5).
illegal(7,3,2,6,6,2).
illegal(0,6,0,5,7,5).
illegal(3,7,1,0,2,7).
illegal(6,3,3,5,3,6).
illegal(3,7,6,3,3,6).
illegal(2,4,4,4,4,1).
illegal(2,3,2,5,2,4).
illegal(3,2,3,2,3,4).
illegal(7,0,2,5,1,5).
illegal(4,7,1,4,6,4).
illegal(7,3,2,5,6,5).
illegal(0,2,7,2,7,2).
illegal(0,7,5,4,5,4).
illegal(0,1,4,3,6,3).
illegal(5,0,3,6,3,3).
illegal(6,4,0,3,0,4).
illegal(6,0,6,6,5,6).
illegal(5,3,4,2,4,1).
illegal(1,2,2,7,1,3).
illegal(0,5,0,5,7,3).
illegal(0,1,6,4,6,6).
illegal(6,1,5,1,5,7).
illegal(2,6,5,1,2,6).
illegal(1,1,2,6,4,6).
illegal(5,6,7,7,6,7).
illegal(4,3,7,6,7,3).
illegal(2,6,2,1,2,7).
illegal(6,4,7,3,5,5).
illegal(6,5,1,0,1,1).
illegal(7,7,6,5,1,5).
illegal(6,5,1,0,1,0).
illegal(4,7,2,3,2,5).
illegal(6,3,1,2,2,2).
illegal(2,6,3,0,4,0).
illegal(3,0,7,2,0,2).
illegal(4,7,5,2,7,2).
illegal(5,4,0,7,2,7).
illegal(3,4,1,6,1,7).
illegal(3,1,7,2,4,1).
illegal(4,1,7,1,7,5).
illegal(6,5,1,7,1,2).
illegal(4,0,3,7,6,7).
illegal(3,4,7,5,7,1).
illegal(4,3,3,1,0,1).
illegal(6,2,7,6,6,1).
illegal(2,5,7,1,3,6).
illegal(3,6,2,2,4,7).
illegal(7,1,5,0,5,3).
illegal(1,1,3,4,3,5).
illegal(3,7,5,3,3,3).
illegal(7,3,7,3,3,4).
illegal(4,1,2,6,3,1).
illegal(5,5,4,1,5,5).
illegal(1,7,3,1,3,1).
illegal(7,7,5,1,5,5).
illegal(4,4,0,0,6,0).
illegal(3,6,7,3,7,3).
illegal(5,0,2,0,2,1).
illegal(0,6,2,3,1,5).
illegal(4,0,5,0,4,0).
illegal(3,1,3,3,7,3).
illegal(6,6,0,0,0,3).
illegal(2,0,7,0,3,0).
illegal(0,1,6,2,6,0).
illegal(0,4,2,3,2,4).
illegal(6,2,4,3,3,3).
illegal(1,6,6,3,6,2).
illegal(5,6,4,6,1,6).
illegal(1,6,1,3,2,3).
illegal(6,2,0,3,5,2).
illegal(1,4,1,4,1,3).
illegal(5,0,0,7,5,1).
illegal(1,3,6,3,4,3).
illegal(4,7,1,0,1,1).
illegal(2,5,6,4,6,6).
illegal(2,1,2,1,4,6).
illegal(0,6,0,6,6,5).
illegal(5,5,2,0,2,7).
illegal(3,7,4,3,4,4).
illegal(1,3,6,6,6,2).
illegal(0,0,7,2,1,0).
illegal(1,5,0,6,2,4).
illegal(6,1,7,5,0,5).
illegal(6,0,1,7,0,7).
illegal(0,0,6,3,6,3).
illegal(4,7,0,1,0,4).
illegal(0,3,4,0,2,0).
illegal(7,1,1,3,1,1).
illegal(0,6,2,3,2,2).
illegal(5,0,0,5,0,0).
illegal(3,2,5,4,2,1).
illegal(1,4,7,5,7,6).
illegal(5,5,5,3,2,3).
illegal(6,5,7,3,3,3).
illegal(6,7,4,1,1,1).
illegal(6,1,1,4,6,1).
illegal(4,2,6,0,6,3).
illegal(5,0,5,3,6,0).
illegal(1,5,1,0,4,0).
illegal(6,4,3,0,1,0).
illegal(6,5,5,1,6,4).
illegal(0,7,5,4,2,4).
illegal(4,2,4,1,3,3).
illegal(2,6,2,4,2,1).
illegal(3,2,4,2,6,2).
illegal(4,3,3,2,5,2).
illegal(3,0,2,3,4,1).
illegal(0,2,4,5,0,1).
illegal(2,6,4,5,1,6).
illegal(3,7,6,4,2,4).
illegal(6,2,0,3,7,1).
illegal(2,3,5,1,6,1).
illegal(1,5,6,3,2,4).
illegal(1,3,3,5,6,5).
illegal(3,4,7,4,7,2).
illegal(0,0,5,3,5,6).
illegal(4,4,4,4,3,3).
illegal(2,1,7,6,1,1).
illegal(0,7,6,3,4,3).
illegal(4,1,4,4,5,1).
illegal(2,1,1,7,3,1).
illegal(6,0,5,1,7,1).
illegal(0,1,2,1,6,1).
illegal(2,1,3,5,4,5).
illegal(2,3,0,7,0,1).
illegal(3,0,7,6,7,6).
illegal(7,0,2,7,7,1).
illegal(7,6,1,1,1,2).
illegal(6,5,3,3,0,3).
illegal(2,7,7,7,7,2).
illegal(2,5,5,3,1,6).
illegal(0,7,7,7,7,4).
illegal(1,5,6,1,0,5).
illegal(4,0,5,2,5,3).
illegal(5,7,7,0,4,7).
illegal(3,4,5,2,4,2).
illegal(2,1,4,7,1,2).
illegal(1,4,4,3,6,3).
illegal(5,1,6,6,6,5).
illegal(2,5,2,5,0,6).
illegal(1,4,2,4,2,3).
illegal(3,4,2,1,4,4).
illegal(5,2,4,1,6,1).
illegal(2,5,2,5,6,4).
illegal(6,1,1,0,5,2).
illegal(6,3,1,6,1,5).
illegal(7,1,6,3,0,3).
illegal(7,0,0,6,0,3).
illegal(0,7,5,6,5,5).
illegal(4,5,5,7,4,5).
illegal(3,6,6,0,7,0).
illegal(4,4,7,0,5,3).
illegal(3,2,3,6,2,2).
illegal(1,6,1,6,5,5).
illegal(7,3,5,7,6,4).
illegal(0,3,3,3,3,4).
illegal(2,4,3,7,3,0).
illegal(1,3,5,7,3,7).
illegal(2,1,1,2,0,2).
illegal(2,6,3,1,2,1).
illegal(2,1,5,7,5,7).
illegal(5,4,4,4,5,4).
illegal(5,6,1,3,4,7).
illegal(2,7,4,7,1,7).
illegal(6,3,6,7,5,7).
illegal(3,6,4,2,3,2).
illegal(1,6,1,4,4,4).
illegal(7,7,4,5,4,5).
illegal(5,6,1,0,2,0).
illegal(6,1,4,5,7,5).
illegal(5,6,0,3,5,7).
illegal(1,1,5,0,4,0).
illegal(2,1,7,5,3,1).
illegal(7,5,4,7,4,0).
illegal(3,0,4,2,3,2).
illegal(2,1,5,4,1,0).
illegal(4,7,0,1,5,6).
illegal(2,4,6,1,2,4).
illegal(6,5,5,0,5,7).
illegal(4,3,0,3,0,0).
illegal(4,3,2,4,3,2).
illegal(4,5,5,3,5,2).
illegal(6,7,2,4,7,6).
illegal(6,7,3,4,3,2).
illegal(2,2,7,5,2,5).
illegal(7,0,1,6,6,1).
illegal(7,5,4,2,4,5).
illegal(5,1,5,5,6,2).
illegal(7,0,5,2,3,2).
illegal(6,6,5,2,6,6).
illegal(1,0,3,3,3,5).
illegal(3,7,1,2,1,5).
illegal(3,3,3,4,3,3).
illegal(0,4,0,1,0,3).
illegal(6,5,5,7,5,7).
illegal(1,2,2,6,4,6).
illegal(3,7,3,3,3,7).
illegal(3,2,2,4,6,4).
illegal(1,5,7,2,7,7).
illegal(3,1,0,6,4,1).
illegal(0,1,5,4,1,0).
illegal(2,2,3,5,1,2).
illegal(7,0,6,5,1,5).
illegal(4,3,0,1,3,1).
illegal(7,5,2,3,2,5).
illegal(6,6,6,7,1,7).
illegal(6,2,0,6,5,1).
illegal(4,5,7,4,5,4).
illegal(5,0,6,6,6,1).
illegal(1,5,5,0,5,6).
illegal(1,6,4,0,5,0).
illegal(2,2,2,6,2,1).
illegal(1,0,5,5,1,1).
illegal(7,4,5,4,5,7).
illegal(5,0,5,7,5,2).
illegal(2,1,4,3,2,2).
illegal(7,4,7,6,4,6).
illegal(7,1,6,7,6,0).
illegal(4,7,2,6,2,4).
illegal(6,3,4,3,6,4).
illegal(5,6,4,7,1,7).
illegal(3,3,4,7,2,4).
illegal(1,7,7,3,1,3).
illegal(5,2,1,6,2,6).
illegal(5,1,0,2,5,1).
illegal(3,7,2,6,4,7).
illegal(0,2,4,6,7,6).
illegal(0,7,7,0,7,6).
illegal(3,4,2,5,7,5).
illegal(6,4,6,3,7,4).
illegal(2,0,3,1,3,1).
illegal(3,2,0,1,1,1).
illegal(1,3,6,1,2,3).
illegal(4,5,0,7,5,6).
illegal(0,0,0,5,2,5).
illegal(2,2,2,6,1,1).
illegal(4,7,6,0,4,0).
illegal(4,4,6,2,2,2).
illegal(4,3,2,6,5,6).
illegal(3,7,4,6,2,6).
illegal(7,5,3,2,3,7).
illegal(5,7,7,5,7,0).
illegal(1,2,3,6,5,6).
illegal(1,3,3,3,2,2).
illegal(3,7,3,7,6,0).
illegal(2,3,4,1,2,2).
illegal(6,6,4,2,3,2).
illegal(6,1,5,2,7,1).
illegal(7,0,4,7,0,7).
illegal(6,1,2,1,2,0).
illegal(1,7,5,3,1,6).
illegal(3,2,3,0,1,0).
illegal(1,4,7,0,2,0).
illegal(6,0,0,6,6,6).
illegal(5,6,2,5,4,7).
illegal(3,3,1,3,3,3).
illegal(5,6,2,4,4,5).
illegal(4,2,1,5,1,4).
illegal(4,0,5,0,3,0).
illegal(0,7,3,4,3,3).
illegal(1,2,5,1,1,3).
illegal(6,4,1,1,7,3).
illegal(3,6,4,2,5,2).
illegal(6,3,5,5,5,5).
illegal(6,5,6,2,5,4).
illegal(6,7,5,6,1,6).
illegal(0,3,6,0,2,0).
illegal(7,2,1,2,0,2).
illegal(5,7,7,0,5,6).
illegal(3,7,0,2,5,2).
illegal(4,0,0,5,3,1).
illegal(4,1,5,1,5,5).
illegal(2,7,2,7,2,3).
illegal(7,6,2,5,4,5).
illegal(5,2,7,5,7,0).
illegal(1,2,1,4,6,4).
illegal(7,6,3,6,2,6).
illegal(0,7,7,6,5,6).
illegal(5,4,3,2,4,3).
illegal(2,1,3,3,1,1).
illegal(7,0,1,5,6,5).
illegal(2,3,0,5,7,5).
illegal(6,5,4,0,6,5).
illegal(4,2,6,7,7,7).
illegal(6,5,7,7,7,0).
illegal(7,2,0,4,0,1).
illegal(3,0,5,7,2,0).
illegal(6,4,6,5,2,5).
illegal(3,1,7,7,7,6).
illegal(4,5,5,3,4,5).
illegal(6,0,0,1,7,1).
illegal(1,5,0,2,5,2).
illegal(6,6,1,1,5,5).
illegal(6,3,1,5,1,7).
illegal(2,6,3,6,6,6).
illegal(1,7,2,2,1,2).
illegal(6,0,2,5,5,1).
illegal(4,4,6,3,3,3).
illegal(2,4,5,7,3,3).
illegal(5,0,7,3,7,6).
illegal(6,3,7,6,6,2).
illegal(6,4,4,3,4,1).
illegal(2,4,2,5,3,4).
illegal(6,5,4,4,4,2).
illegal(5,5,6,7,3,7).
illegal(2,5,0,0,1,4).
illegal(2,1,2,1,1,5).
illegal(7,7,7,3,2,3).
illegal(5,7,5,6,5,3).
illegal(2,2,3,3,1,2).
illegal(0,7,0,7,7,7).
illegal(4,0,7,2,7,2).
illegal(0,0,1,3,1,6).
illegal(7,3,1,7,7,2).
illegal(5,5,4,5,5,6).
illegal(6,6,4,1,6,5).
illegal(5,4,1,3,1,6).
illegal(1,5,3,0,1,5).
illegal(7,7,2,1,2,7).
illegal(4,4,5,2,3,5).
illegal(4,3,6,4,6,1).
illegal(0,3,7,0,0,0).
illegal(7,7,2,1,6,6).
illegal(2,3,4,6,4,5).
illegal(1,4,3,6,2,3).
illegal(2,3,0,7,0,4).
illegal(7,0,1,6,7,1).
illegal(5,7,6,6,6,5).
illegal(3,6,6,5,3,5).
illegal(2,3,0,2,4,2).
illegal(6,4,7,7,6,7).
illegal(5,2,7,7,7,3).
illegal(7,0,4,7,4,1).
illegal(3,3,1,7,2,3).
illegal(4,4,4,3,2,3).
illegal(0,6,5,2,6,2).
illegal(7,6,2,2,6,2).
illegal(3,3,6,4,6,4).
% illegal(1,0,3,2,3,6).
% illegal(0,6,4,2,0,6).
% illegal(4,2,5,3,5,7).
% illegal(5,4,7,0,6,3).
% illegal(0,1,6,4,2,4).
% illegal(4,4,7,6,4,5).
% illegal(6,7,1,5,1,2).
% illegal(7,3,3,5,3,0).
% illegal(0,1,2,6,2,5).
% illegal(0,1,0,3,1,1).
% illegal(0,6,4,1,4,0).
% illegal(4,4,7,3,2,3).
% illegal(4,4,0,6,0,4).
% illegal(1,1,7,0,2,0).
% illegal(3,4,1,1,5,1).
% illegal(2,3,1,5,1,1).
% illegal(4,6,7,1,5,1).
% illegal(3,1,3,0,6,0).
% illegal(5,6,0,1,5,6).
% illegal(5,6,4,4,4,1).
% illegal(0,2,7,1,7,5).
% illegal(3,5,0,4,0,3).
% illegal(7,7,0,4,0,5).
% illegal(2,4,0,3,1,5).
% illegal(6,4,6,1,3,1).
% illegal(3,2,6,3,2,2).
% illegal(5,1,7,7,6,2).
% illegal(2,5,4,4,3,5).
% illegal(3,5,4,1,4,0).
% illegal(7,5,2,7,2,7).
% illegal(2,4,2,1,1,3).
% illegal(1,5,1,3,3,3).
% illegal(3,1,0,0,0,7).
% illegal(1,0,6,5,2,1).
% illegal(2,4,1,6,3,6).
% illegal(1,5,7,3,1,6).
% illegal(4,2,2,2,0,2).
% illegal(7,1,0,3,0,2).
% illegal(5,6,7,3,7,4).
% illegal(2,2,4,1,1,3).
% illegal(4,1,2,6,2,2).
% illegal(5,7,0,3,5,3).
% illegal(5,0,2,7,2,4).
% illegal(1,5,6,6,6,3).
% illegal(4,6,6,5,6,0).
% illegal(5,2,4,4,7,4).
% illegal(6,5,3,4,6,6).
% illegal(7,6,1,2,1,4).
% illegal(3,0,1,2,6,2).
% illegal(6,5,2,3,3,3).
% illegal(3,3,1,0,5,0).
% illegal(1,4,6,7,6,2).
% illegal(2,1,1,0,5,0).
% illegal(4,2,3,0,4,2).
% illegal(1,5,0,4,3,4).
% illegal(0,3,2,1,2,7).
% illegal(2,7,1,6,1,0).
% illegal(1,2,2,4,0,1).
% illegal(5,6,5,7,6,5).
% illegal(6,1,7,0,7,4).
% illegal(4,0,5,6,7,6).
% illegal(5,1,3,0,4,1).
% illegal(6,1,2,5,5,1).
% illegal(7,4,6,7,6,0).
% illegal(0,6,2,1,1,1).
% illegal(4,0,5,1,5,7).
% illegal(5,4,1,7,6,7).
% illegal(3,7,6,3,6,4).
% illegal(5,3,4,4,4,0).
% illegal(4,3,4,0,3,3).
% illegal(4,1,7,0,6,0).
% illegal(4,3,3,3,4,4).
% illegal(4,3,2,0,2,1).
% illegal(2,2,6,4,1,3).
% illegal(6,7,6,7,7,0).
% illegal(6,6,3,0,6,5).
% illegal(1,5,5,4,6,4).
% illegal(7,5,0,1,5,1).
% illegal(6,6,3,3,5,6).
% illegal(1,6,2,2,2,0).
% illegal(4,4,6,3,6,4).
% illegal(4,4,1,2,5,2).
% illegal(1,4,5,0,0,3).
% illegal(6,4,7,0,5,3).
% illegal(0,2,3,2,0,2).
% illegal(4,1,1,2,3,2).
% illegal(5,2,4,1,4,6).
% illegal(1,6,3,7,3,1).
% illegal(3,0,6,7,6,7).
% illegal(0,5,7,2,7,5).
% illegal(6,2,3,4,3,5).
% illegal(5,4,6,7,5,7).
% illegal(5,2,1,1,5,2).
% illegal(0,3,7,3,1,2).
% illegal(7,5,7,5,6,0).
% illegal(7,6,4,0,6,5).
% illegal(6,4,7,2,6,4).
% illegal(0,4,1,5,1,4).
% illegal(4,2,4,2,6,2).
% illegal(2,1,5,2,4,2).
% illegal(1,1,2,0,2,6).
% illegal(6,0,5,1,4,1).
% illegal(2,5,6,4,1,4).
% illegal(0,0,0,0,3,6).
% illegal(2,4,6,7,7,7).
% illegal(7,6,5,3,5,2).
% illegal(1,0,3,3,1,0).
% illegal(7,4,7,1,0,1).
% illegal(2,6,0,3,0,3).
% illegal(0,5,7,3,7,2).
% illegal(1,4,7,3,7,0).
% illegal(0,3,2,0,7,0).
% illegal(1,2,2,7,1,2).
% illegal(5,3,0,2,1,2).
% illegal(0,1,2,7,2,6).
% illegal(2,6,6,3,4,3).
% illegal(4,0,0,2,3,0).
% illegal(0,4,7,4,0,5).
% illegal(4,7,2,2,2,4).
% illegal(4,7,3,1,1,1).
% illegal(5,4,3,5,3,6).
% illegal(7,7,1,7,1,6).
% illegal(6,3,5,5,6,2).
% illegal(2,0,7,2,1,2).
% illegal(5,3,4,4,0,4).
% illegal(1,7,1,3,1,4).
% illegal(6,2,5,6,1,6).
% illegal(5,2,3,0,5,0).
% illegal(5,2,2,1,2,6).
% illegal(1,7,3,5,3,1).
% illegal(1,1,0,2,2,0).
% illegal(5,6,0,4,2,4).
% illegal(6,3,3,0,7,3).
% illegal(7,3,2,1,4,1).
% illegal(5,5,4,1,7,1).
% illegal(3,3,7,3,7,6).
% illegal(1,5,5,3,1,3).
% illegal(6,1,5,1,5,3).
% illegal(7,4,4,6,5,6).
% illegal(4,1,1,5,1,2).
% illegal(1,7,2,1,2,4).
% illegal(5,2,4,4,5,3).
% illegal(5,7,7,3,6,7).
% illegal(1,4,3,1,3,5).
% illegal(0,2,5,7,5,2).
% illegal(0,2,4,7,2,7).
% illegal(6,1,1,4,1,4).
% illegal(3,7,2,6,2,7).
% illegal(6,5,2,3,5,3).
% illegal(3,5,1,7,1,1).
% illegal(6,6,2,3,5,3).
% illegal(2,4,6,0,6,4).
% illegal(6,1,6,6,4,6).
% illegal(7,6,3,7,5,7).
% illegal(3,1,2,0,2,4).
% illegal(2,3,4,5,4,3).
% illegal(5,1,0,6,4,1).
% illegal(4,4,6,0,6,5).
% illegal(5,7,5,7,2,7).
% illegal(3,2,5,1,5,5).
% illegal(2,1,3,7,5,7).
% illegal(3,2,5,6,1,6).
% illegal(7,3,6,0,6,0).
% illegal(3,7,1,3,1,0).
% illegal(5,4,7,0,6,5).
% illegal(3,6,7,1,0,1).
% illegal(4,0,7,6,4,0).
% illegal(3,5,3,0,3,2).
% illegal(0,6,0,6,2,3).
% illegal(7,5,4,7,3,7).
% illegal(5,1,3,0,3,5).
% illegal(7,1,0,4,1,4).
% illegal(1,1,7,3,7,3).
% illegal(5,5,4,1,4,4).
% illegal(4,2,6,3,0,3).
% illegal(2,2,5,7,1,2).
% illegal(4,0,5,5,5,2).
% illegal(3,7,3,1,2,6).
% illegal(0,5,1,6,0,5).
% illegal(2,3,3,3,1,3).
% illegal(5,1,5,0,5,2).
% illegal(4,2,4,4,4,7).
% illegal(1,3,1,5,1,3).
% illegal(0,3,5,1,5,2).
% illegal(1,1,7,7,7,3).
% illegal(5,7,4,1,7,1).
% illegal(3,3,5,4,5,6).
% illegal(0,4,1,6,0,6).
% illegal(3,1,6,3,3,3).
% illegal(6,0,0,0,6,0).
% illegal(0,2,0,6,1,3).
% illegal(2,5,7,5,6,5).
% illegal(0,6,5,6,6,6).
% illegal(5,0,5,7,5,7).
% illegal(4,4,6,4,5,5).
% illegal(4,3,1,3,5,2).
% illegal(4,0,2,1,5,0).
% illegal(1,1,0,7,4,7).
% illegal(2,7,3,5,0,5).
% illegal(7,5,7,1,7,0).
% illegal(3,1,3,7,3,2).
% illegal(3,3,4,1,4,0).
% illegal(6,6,3,1,1,1).
% illegal(1,7,5,0,0,6).
% illegal(6,5,6,2,5,5).
% illegal(2,0,2,3,2,6).
% illegal(4,7,4,5,6,5).
% illegal(2,5,5,6,1,6).
% illegal(5,7,6,0,4,6).
% illegal(2,6,5,5,2,7).
% illegal(7,5,2,4,0,4).
% illegal(1,3,7,6,5,6).
% illegal(0,5,2,5,2,6).
% illegal(5,2,7,0,7,4).
% illegal(4,4,2,3,4,3).
% illegal(4,4,3,0,5,5).
% illegal(0,7,3,5,2,5).
% illegal(7,0,5,2,5,7).
% illegal(2,3,6,0,6,6).
% illegal(3,5,0,2,3,5).
% illegal(3,3,6,2,2,2).
% illegal(1,5,7,0,2,6).
% illegal(2,4,4,2,1,2).
% illegal(3,2,4,4,4,1).
% illegal(7,6,2,5,2,2).
% illegal(2,1,6,1,6,3).
% illegal(2,0,3,4,3,5).
% illegal(6,3,3,4,7,4).
% illegal(5,1,1,3,1,6).
% illegal(7,6,4,6,4,5).
% illegal(1,7,7,7,7,5).
% illegal(7,5,5,2,2,2).
% illegal(4,0,5,4,4,0).
% illegal(6,7,3,2,3,1).
% illegal(7,7,0,2,2,2).
% illegal(0,5,7,3,7,2).
% illegal(3,2,0,4,2,2).
% illegal(2,2,7,3,2,1).
% illegal(4,3,4,3,0,5).
% illegal(0,0,7,2,7,1).
% illegal(5,5,4,1,5,5).
% illegal(4,6,5,7,7,7).
% illegal(3,5,3,3,5,3).
% illegal(6,4,1,3,1,0).
% illegal(3,1,1,4,4,0).
% illegal(6,5,7,2,6,5).
% illegal(1,6,2,2,2,2).
% illegal(5,1,0,3,5,1).
% illegal(1,3,3,3,1,2).
% illegal(4,1,7,2,5,0).
% illegal(4,4,0,5,4,5).
% illegal(6,6,7,7,3,7).
% illegal(5,0,0,4,0,7).
% illegal(4,3,4,5,4,5).
% illegal(4,0,6,3,6,3).
% illegal(2,7,1,6,7,6).
% illegal(5,6,7,3,6,6).
% illegal(4,6,5,2,3,2).
% illegal(2,4,7,3,7,0).
% illegal(1,4,2,3,0,3).
% illegal(0,2,7,3,6,3).
% illegal(1,3,6,3,6,1).
% illegal(4,4,5,1,3,1).
% illegal(7,5,0,7,5,7).
% illegal(4,3,7,7,7,7).
% illegal(2,0,6,5,1,5).
% illegal(6,0,4,4,4,5).
% illegal(3,1,4,4,4,7).
% illegal(4,1,5,0,7,0).
% illegal(5,2,4,7,6,2).
% illegal(0,7,0,7,1,1).
% illegal(1,0,5,3,1,0).
% illegal(7,2,5,4,5,4).
% illegal(0,3,0,1,7,1).
% illegal(5,4,0,0,6,0).
% illegal(0,0,2,6,2,0).
% illegal(5,6,3,2,7,2).
% illegal(0,4,5,1,3,1).
% illegal(1,7,2,3,0,3).
% illegal(2,7,3,2,6,2).
% illegal(0,3,6,6,6,5).
% illegal(6,3,7,3,7,7).
% illegal(0,1,6,5,1,5).
% illegal(4,4,5,3,5,1).
% illegal(1,4,5,0,2,4).
% illegal(4,0,5,2,6,2).
% illegal(1,0,6,0,6,4).
% illegal(2,0,3,6,3,5).
% illegal(3,5,2,3,1,3).
% illegal(0,3,2,0,2,7).
% illegal(1,1,7,6,4,6).
% illegal(6,5,3,3,3,0).
% illegal(2,4,5,6,5,5).
% illegal(5,2,5,7,2,7).
% illegal(2,6,2,2,3,5).
% illegal(0,6,7,7,1,5).
% illegal(0,6,1,2,1,4).
% illegal(6,1,0,2,0,2).
% illegal(4,3,3,3,3,2).
% illegal(3,3,3,3,2,2).
% illegal(4,1,6,5,6,7).
% illegal(0,3,3,6,2,6).
% illegal(0,3,5,0,6,0).
% illegal(2,6,3,4,2,5).
% illegal(6,7,1,2,7,6).
% illegal(2,5,6,3,2,6).
% illegal(4,6,6,6,6,4).
% illegal(2,2,3,0,3,6).
% illegal(1,3,1,6,6,6).
% illegal(3,7,3,3,6,3).
% illegal(3,0,5,5,5,3).
% illegal(7,7,5,1,6,6).
% illegal(6,7,4,2,6,2).
% illegal(7,5,7,5,5,3).
% illegal(0,5,0,5,6,2).
% illegal(2,4,1,2,2,2).
% illegal(3,1,1,5,4,5).
% illegal(7,1,4,7,7,2).
% illegal(5,4,6,2,2,2).
% illegal(2,6,4,0,7,0).
% illegal(2,7,2,3,2,2).
% illegal(3,1,0,3,6,3).
% illegal(7,4,5,4,6,4).
% illegal(0,7,3,0,2,0).
% illegal(6,6,7,1,7,1).
% illegal(7,2,3,0,3,4).
% illegal(7,5,5,5,7,5).
% illegal(0,6,6,7,6,0).
% illegal(2,3,6,6,1,2).
% illegal(1,2,6,7,1,7).
% illegal(6,7,1,1,2,1).
% illegal(5,2,4,4,4,7).
% illegal(2,1,0,1,1,1).
% illegal(5,4,1,0,6,3).
% illegal(3,7,1,7,2,6).
% illegal(1,1,7,1,3,1).
% illegal(6,5,1,3,5,3).
% illegal(4,2,4,1,0,1).
% illegal(3,6,0,7,7,7).
% illegal(7,3,3,2,6,3).
% illegal(5,6,0,2,6,2).
% illegal(5,5,5,1,6,4).
% illegal(4,4,0,2,5,2).
% illegal(1,3,1,3,0,0).
% illegal(2,0,3,0,3,2).
% illegal(1,0,2,6,2,6).
% illegal(6,4,1,3,1,6).
% illegal(5,2,2,7,5,2).
% illegal(7,6,7,7,6,5).
% illegal(4,5,2,1,2,3).
% illegal(2,1,6,4,3,1).
% illegal(1,3,3,1,2,1).
% illegal(5,1,0,0,5,2).
% illegal(5,0,3,6,3,1).
% illegal(4,4,0,6,4,6).
% illegal(3,0,2,5,3,5).
% illegal(5,2,1,1,7,1).
% illegal(4,2,3,6,3,4).
% illegal(5,1,0,0,1,0).
% illegal(2,5,3,2,3,4).
% illegal(0,3,7,4,7,1).
% illegal(1,1,1,6,0,1).
% illegal(4,0,4,1,3,0).
% illegal(7,2,7,2,3,4).
% illegal(0,6,1,4,1,2).
% illegal(0,5,6,3,6,7).
% illegal(7,1,2,5,2,5).
% illegal(5,3,3,7,6,7).
% illegal(4,6,0,0,5,6).
% illegal(6,7,6,7,4,7).
% illegal(7,0,7,4,7,7).
% illegal(6,7,1,2,3,2).
% illegal(0,3,0,3,3,0).
% illegal(4,6,4,6,6,0).
% illegal(0,0,0,7,4,7).
% illegal(6,3,3,6,3,1).
% illegal(0,5,6,6,1,6).
% illegal(3,3,7,2,3,2).
% illegal(7,6,7,2,0,2).
% illegal(4,5,0,0,4,6).
% illegal(5,5,4,6,4,4).
% illegal(4,7,4,0,3,7).
% illegal(4,0,2,1,5,1).
% illegal(2,6,6,0,0,0).
% illegal(5,1,1,7,1,5).
% illegal(1,5,3,4,3,4).
% illegal(3,4,2,1,2,0).
% illegal(6,7,2,0,2,2).
% illegal(1,4,0,0,7,0).
% illegal(6,4,3,7,5,4).
% illegal(2,7,6,7,6,7).
% illegal(5,6,7,5,7,4).
% illegal(5,3,7,0,6,2).
% illegal(7,0,3,3,3,4).
% illegal(3,7,1,2,2,2).
% illegal(3,0,0,3,0,7).
% illegal(2,0,6,6,6,4).
% illegal(1,1,4,7,0,0).
% illegal(1,2,0,6,0,7).
% illegal(6,2,6,6,5,6).
% illegal(0,1,2,4,2,0).
% illegal(3,5,7,1,0,1).
% illegal(3,5,4,0,1,0).
% illegal(4,0,0,0,0,6).
% illegal(4,5,0,7,0,4).
% illegal(0,5,2,6,0,6).
% illegal(3,6,5,7,0,7).
% illegal(0,6,1,3,0,7).
% illegal(1,1,3,6,1,1).
% illegal(3,1,2,1,3,1).
% illegal(4,5,6,3,4,3).
% illegal(3,1,7,3,7,3).
% illegal(7,7,1,4,1,1).
% illegal(1,1,7,5,6,5).
% illegal(0,0,5,6,1,6).
% illegal(6,2,6,6,6,5).
% illegal(2,3,1,0,7,0).
% illegal(5,1,6,2,0,2).
% illegal(5,6,5,1,5,4).
% illegal(5,3,4,0,4,2).
% illegal(1,2,5,5,0,3).
% illegal(7,5,7,2,7,1).
% illegal(6,5,7,0,7,7).
% illegal(6,2,3,6,4,6).
% illegal(5,5,5,4,1,4).
% illegal(5,1,4,2,6,0).
% illegal(1,0,5,4,2,1).
% illegal(4,1,6,2,5,0).
% illegal(1,0,2,4,3,4).
% illegal(1,2,2,4,7,4).
% illegal(5,4,5,1,5,3).
% illegal(1,3,0,2,0,6).
% illegal(2,2,5,3,4,3).
% illegal(4,5,1,0,1,5).
% illegal(0,0,4,6,5,6).
% illegal(3,2,1,3,3,3).
% illegal(1,3,5,5,4,5).
% illegal(3,6,4,0,2,0).
% illegal(5,0,5,0,7,4).
% illegal(5,3,3,0,3,2).
% illegal(2,1,0,0,2,1).
% illegal(2,6,5,1,5,7).
% illegal(1,6,0,0,2,6).
% illegal(5,6,1,2,3,2).
% illegal(0,0,0,0,3,6).
% illegal(1,5,3,2,3,7).
% illegal(0,0,6,6,3,6).
% illegal(6,2,5,0,7,2).
% illegal(0,0,7,4,7,0).
% illegal(7,2,7,5,0,5).
% illegal(7,6,7,3,1,3).
% illegal(0,2,6,6,6,5).
% illegal(5,3,2,4,0,4).
% illegal(3,1,3,3,2,2).
% illegal(0,1,4,3,4,0).
% illegal(6,0,1,4,1,2).
% illegal(2,1,0,3,7,3).
% illegal(4,3,4,3,2,1).
% illegal(1,5,3,0,3,5).
% illegal(2,2,0,5,3,2).
% illegal(1,6,6,1,1,5).
% illegal(6,7,0,7,5,7).
% illegal(6,2,2,0,5,1).
% illegal(6,3,3,7,3,6).
% illegal(1,7,7,1,7,3).
% illegal(3,2,7,2,3,3).
% illegal(5,0,5,0,6,0).
% illegal(4,6,2,7,4,5).
% illegal(4,0,5,2,5,5).
% illegal(7,1,7,1,0,1).
% illegal(4,2,2,5,5,5).
% illegal(4,3,1,6,7,6).
% illegal(2,5,1,2,2,5).
% illegal(2,7,4,4,5,4).
% illegal(0,2,7,3,2,3).
% illegal(2,4,2,1,5,1).
% illegal(7,2,0,7,5,7).
% illegal(3,2,1,7,6,7).
% illegal(6,0,4,5,4,7).
% illegal(6,1,0,3,7,2).
% illegal(2,0,0,1,0,6).
% illegal(4,1,2,3,6,3).
% illegal(4,7,1,6,5,7).
% illegal(6,7,0,3,7,6).
% illegal(3,6,0,1,0,1).
% illegal(6,7,5,6,1,6).
% illegal(0,6,4,5,4,5).
% illegal(1,0,6,3,1,1).
% illegal(4,4,6,4,6,4).
% illegal(4,4,4,4,4,0).
% illegal(3,3,4,6,3,6).
% illegal(1,7,7,4,0,7).
% illegal(5,4,0,7,1,7).
% illegal(2,6,6,3,1,3).
% illegal(6,6,3,7,1,7).
% illegal(7,6,6,4,6,4).
% illegal(4,4,2,2,2,0).
% illegal(4,0,1,0,2,0).
% illegal(5,4,3,2,6,3).
