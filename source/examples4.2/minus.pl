:- modeh(1,minus(+int1,+int1,-int1))?
% Minus head template - accepts two int1s and returns int1.

:- modeb(1,minus(+int1,+int1,-int1))?
% Minus body template - as above.

:- modeb(1,dec(+int1,-int1))?
%decrement required to carry out recursive subtraction.


% :- determination(minus/3,minus/3), determination(minus/3,dec/2)?
% determinations added after first attempt at the code, think the determination
% is used to tell the progol system about what can be used within the head 
% literals in order to complete the predicates.

:- set(c,3), set(i,2), set(posonly)?
:- set(verbose,5)?

%%%%%%%%%%%%%%%%
% Types

int1(1).
int1(X) :- fail.
int1(2).

% int1(0).  int1(1).  int1(2).  int1(3).  int1(4).  int1(5).  int1(6).

%%%%%%%%%%%%%%%%
% Positive examples

minus(A,0,A).
minus(A,1,B) :- dec(A,B).
minus(A,2,B) :- dec(A,C),dec(C,B).
minus(A,3,B) :- dec(A,C),dec(C,D),dec(D,B).
minus(A,4,B) :- dec(A,C),dec(C,D),dec(D,E),dec(E,B).

%%%%%%%%%%%%%%%%
% Background Knowledge

dec(X,Y) :- Y is X-1, 0=<Y.
