%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Learning a recursive definition for appending lists.

%:- set(posonly), unset(cover), unset(condition)?
:- unset(cover)?
:- set(c,1)?
% :- set(h,15)?
:- modeh(1,append([+const|+clist],+clist,[-const|-clist]))?
:- modeh(1,append(+clist,+clist,-clist))?
:- modeb(1,+clist = [])?
:- modeb(1,append(+clist,+clist,-clist))?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Types

clist([]).
clist([H|T]) :- const(H), clist(T).

const(a).  const(b).  const(c).  const(d).  const(e).  const(f).
const(g).  const(h).  const(i).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Positive examples

append([],[d],[d]).
append([],[a,b],[a,b]).
append([a,b],[f,c],[a,b,f,c]).
append([],[c],[c]).
append([],[i,h],[i,h]).
append([],[h],[h]).
append([c,f],[c],[c,f,c]).
append([],[],[]).
append([g,e],[c,d,a,c],[g,e,c,d,a,c]).
append([h],[d,a,h,d,g],[h,d,a,h,d,g]).
append([b,a],[],[b,a]).
append([e,c,g],[g],[e,c,g,g]).
append([],[],[]).
append([],[g,h],[g,h]).
append([],[],[]).
append([],[e],[e]).
append([a,c],[i,e],[a,c,i,e]).
append([c],[],[c]).
append([],[],[]).
append([],[],[]).
append([],[b,a],[b,a]).
append([],[],[]).
append([],[d],[d]).
append([],[a,a],[a,a]).
append([],[i],[i]).
append([g,e],[g,g,g,c,f],[g,e,g,g,g,c,f]).
append([],[b],[b]).
append([a,a,c,d],[],[a,a,c,d]).
append([c],[],[c]).
append([b],[c,c,h,f],[b,c,c,h,f]).
append([c,h,d,a,f,d,d,i],[a,a],[c,h,d,a,f,d,d,i,a,a]).
append([c,f,e],[],[c,f,e]).
append([],[],[]).
append([],[],[]).
append([f],[b],[f,b]).
append([g,h],[],[g,h]).
append([],[],[]).
append([c],[a],[c,a]).
append([],[c,e],[c,e]).
append([],[i],[i]).
% append([c],[e,d,i],[c,e,d,i]).
% append([],[],[]).
% append([],[],[]).
% append([],[],[]).
% append([a,c],[a,g,b,g,f,e,a,a,d,c],[a,c,a,g,b,g,f,e,a,a,d,c]).
% append([g],[],[g]).
% append([],[f,d,a],[f,d,a]).
% append([i,d],[c],[i,d,c]).
% append([g],[g],[g,g]).
% append([],[],[]).
% append([],[],[]).
% append([g],[h,b],[g,h,b]).
% append([g],[d],[g,d]).
% append([a,b],[],[a,b]).
% append([b,g],[],[b,g]).
% append([e,d],[c],[e,d,c]).
% append([],[],[]).
% append([f,i],[a],[f,i,a]).
% append([],[b],[b]).
% append([],[],[]).
% append([h],[],[h]).
% append([h],[],[h]).
% append([],[e,b],[e,b]).
% append([a],[],[a]).
% append([h],[],[h]).
% append([],[],[]).
% append([b,d],[d],[b,d,d]).
% append([b],[],[b]).
% append([b],[a,d,c],[b,a,d,c]).
% append([g],[],[g]).
% append([],[],[]).
% append([c,h,a],[],[c,h,a]).
% append([b],[],[b]).
% append([f,e],[e,c,d],[f,e,e,c,d]).
% append([c,h],[],[c,h]).
% append([],[d,h],[d,h]).
% append([a],[g],[a,g]).
% append([i,i,i],[],[i,i,i]).
% append([h],[b,g],[h,b,g]).
% append([a],[],[a]).
% append([e,f],[],[e,f]).
% append([],[i],[i]).
% append([c,f],[e],[c,f,e]).
% append([b],[],[b]).
% append([],[b,f],[b,f]).
% append([],[d],[d]).
% append([g],[g],[g,g]).
% append([b],[i,h,i,f],[b,i,h,i,f]).
% append([b],[],[b]).
% append([],[h,f,b,g],[h,f,b,g]).
% append([],[],[]).
% append([c],[a,b,g],[c,a,b,g]).
% append([e],[],[e]).
% append([e],[i],[e,i]).
% append([a,f],[d,f],[a,f,d,f]).
% append([e],[h],[e,h]).
% append([f,d],[],[f,d]).
% append([h,a],[f,h,f,f],[h,a,f,h,f,f]).
% append([d,a],[i,a,c,a],[d,a,i,a,c,a]).
% append([],[],[]).
