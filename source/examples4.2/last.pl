%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Last element of list. Learns recursive clauses for last(Element,List)

:- set(posonly)?
:- set(i,2), set(c,2)?
:- set(h,1000)?

:- modeh(1,last(-const,+clist))?
:- modeb(1,+any = #any)?
:- modeb(1,+clist = [-const|-clist])?
:- modeb(1,last(-const,+clist))?

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Types

clist([X]) :- const(X).
clist([H|T]) :- const(H), clist(T).

const(0).  const(1).  const(2).  const(3).  const(4).  const(5).

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Positive examples

last(3,[3]).
last(5,[2,5]).
last(2,[2,0,2]).
last(0,[0]).
last(5,[4,5]).
last(0,[3,0]).
last(0,[1,0]).
last(2,[2]).
last(3,[3]).
last(0,[0]).
last(1,[0,1,1]).
last(0,[2,0]).
last(1,[1]).
last(5,[4,5]).
last(3,[3]).
last(4,[4]).
last(4,[4,1,4]).
last(1,[1]).
last(5,[5]).
last(0,[0]).
last(1,[4,1]).
last(0,[0]).
last(2,[3,2]).
last(4,[4]).
last(0,[0]).
last(4,[4]).
last(1,[1]).
last(5,[4,5,5]).
last(4,[1,4]).
last(0,[0]).
last(0,[5,0]).
last(0,[4,5,2,0]).
last(0,[3,0]).
last(5,[5]).
last(2,[5,2]).
last(3,[4,3]).
last(1,[1,1]).
last(0,[0]).
last(3,[3]).
last(4,[4]).
last(1,[5,0,1,5,4,4,1]).
% last(1,[1]).
% last(4,[4]).
% last(3,[3]).
% last(2,[2]).
% last(4,[4]).
% last(5,[5,3,1,0,3,5]).
% last(1,[4,1]).
% last(0,[0]).
% last(2,[4,1,2]).
% last(1,[1]).
% last(2,[4,2,0,2]).
% last(5,[5]).
% last(5,[4,5,5,1,5]).
% last(2,[4,2]).
% last(0,[0]).
% last(3,[3]).
% last(2,[2]).
% last(0,[0]).
% last(2,[5,2,2]).
% last(3,[3]).
% last(4,[2,4]).
% last(1,[3,0,0,1]).
% last(0,[0,0]).
% last(0,[0]).
% last(1,[1]).
% last(3,[3]).
% last(1,[5,3,1]).
% last(5,[3,4,5]).
% last(5,[5,5]).
% last(5,[5,5]).
% last(0,[1,0]).
% last(2,[5,0,2]).
% last(0,[0]).
% last(0,[2,0]).
% last(4,[4]).
% last(5,[5,2,5]).
% last(2,[5,2]).
% last(2,[2]).
% last(3,[3]).
% last(4,[4]).
% last(2,[1,2]).
% last(2,[2,2]).
% last(5,[3,4,2,4,5]).
% last(4,[2,4]).
% last(2,[2]).
% last(1,[3,1]).
% last(2,[2]).
% last(3,[3]).
% last(3,[3]).
% last(2,[2]).
% last(2,[1,1,2]).
% last(5,[5]).
% last(1,[5,1]).
% last(4,[1,4,4]).
% last(0,[0]).
% last(4,[4]).
% last(4,[4]).
% last(1,[1]).
% last(2,[2]).
