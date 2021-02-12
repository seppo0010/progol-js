%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% List membership. Learns recursive clauses for member(Element,List)

:- set(posonly)?
:- set(i,2), set(c,2)?
:- set(h,1000)?
:- unset(cover)?

:- modeh(*,member(+const,+clist))?
:- modeb(1,+any = #any)?
:- modeb(1,+clist = [-const|-clist])?
:- modeb(*,member(+const,+clist))?

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Types

clist([X]) :- const(X).
clist([H|T]) :- const(H), clist(T).

const(0).  const(1).  const(2).  const(3).  const(4).  const(5).

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Positive examples

member(0,[5,0,0,3]).
member(0,[0]).
member(0,[0,0,2,0,1]).
member(4,[4,0]).
member(5,[5]).
member(2,[2]).
member(5,[4,5]).
member(2,[2,2]).
member(3,[2,4,3,3]).
member(5,[2,5,5,0]).
member(2,[2,2]).
member(1,[1,1,5]).
member(1,[1,4,4,1,1]).
member(2,[2]).
member(0,[4,0,2,0]).
member(3,[2,1,3,5]).
member(0,[4,3,1,5,0,2]).
member(0,[4,1,3,1,0]).
member(1,[1]).
member(4,[4]).
member(4,[4]).
member(4,[4]).
member(0,[2,2,1,0]).
member(4,[4]).
member(5,[5]).
member(2,[2]).
member(3,[3]).
member(1,[1,0,1,1,0,0,2,0]).
member(5,[1,5]).
member(5,[5,1,4,2,5]).
member(5,[5]).
member(0,[0,1]).
member(1,[0,1,0,2,3,4]).
member(2,[1,2]).
member(1,[1]).
member(0,[0,0]).
member(3,[3]).
member(1,[1,1]).
member(4,[5,4]).
member(3,[0,3,4]).
member(3,[5,4,3,0,3]).
member(0,[0,0,4,0]).
member(4,[4,4,2,1]).
member(4,[4]).
member(0,[0,2,3,4,1,2,0]).
member(5,[0,5]).
member(0,[1,0]).
member(4,[2,0,3,4]).
member(4,[4]).
% member(4,[4]).
% member(0,[2,2,1,0]).
% member(4,[4]).
% member(5,[5]).
% member(2,[2]).
% member(3,[3]).
% member(1,[1,0,1,1,0,0,2,0]).
% member(5,[1,5]).
% member(5,[5,1,4,2,5]).
% member(5,[5]).
% member(0,[0,1]).
% member(1,[0,1,0,2,3,4]).
% member(2,[1,2]).
% member(1,[1]).
% member(0,[0,0]).
% member(3,[3]).
% member(1,[1,1]).
% member(4,[5,4]).
% member(3,[0,3,4]).
% member(3,[5,4,3,0,3]).
% member(0,[0,0,4,0]).
% member(4,[4,4,2,1]).
% member(4,[4]).
% member(0,[0,2,3,4,1,2,0]).
% member(5,[0,5]).
% member(0,[1,0]).
% member(4,[2,0,3,4]).
% member(1,[2,5,1]).
% member(0,[2,2,0]).
% member(4,[2,4,0]).
% member(4,[4]).
% member(5,[5,3]).
% member(1,[0,1,1,1]).
% member(3,[3,2]).
% member(3,[0,3,3,2]).
% member(3,[3]).
% member(4,[4,1,4,0]).
% member(4,[4]).
% member(3,[3]).
% member(3,[3,0,3]).
% member(1,[1]).
% member(4,[4]).
% member(5,[5]).
% member(4,[5,4,0]).
% member(0,[0]).
% member(2,[0,2,1,5]).
% member(2,[2,2,2]).
% member(3,[0,3,3]).
% member(5,[1,5]).
% member(2,[5,2,4,2,5,4,5,4,4]).
% member(4,[2,4]).
% member(0,[0]).
% member(1,[1]).
% member(0,[0,0]).
% member(1,[1,1]).
% member(5,[5,4]).
% member(2,[1,2]).
% member(3,[4,4,5,3,0,3]).
% member(1,[2,1]).
% member(4,[4]).
% member(1,[1,5,3,1,4,0,3]).
% member(2,[2,2]).
% member(2,[2]).
% member(3,[3]).
% member(5,[5,5]).
% member(2,[0,2]).
% member(3,[3]).
% member(3,[0,3,2,1,3]).
% member(0,[0,4,3,1]).
% member(2,[2,0,2]).
% member(1,[1,3,5]).
% member(2,[4,2]).
% member(4,[4]).
% member(3,[3]).
% member(5,[5]).
% member(4,[4,3]).
% member(5,[5,3,5,5]).
% member(5,[0,2,5,1]).
% member(5,[5]).
