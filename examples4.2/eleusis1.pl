%%%%%%%%%%%%%%%%%%%%%%%%
% Eleusis parlour game 1. This is a guessing game involving cards and dice.
% One player (the rule-maker) makes up game rules and presents the other
% player (the guesser) with a pair of cards and a pair of dice.
% The guesser is then told whether the hidden rule is true or not of the
% cards and dice. eg. positive examples might look as follows
%
%		 ___    ___
%		|7  |  |A  |   _   _
%		| C |  | H |  |1| |1|
%		|  7|  |  A|   ~   ~
%		 ~~~    ~~~
%		 ___    ___
%		|2  |  |K  |   _   _
%		| C |  | S |  |1| |4|
%		|  2|  |  K|   ~   ~
%		 ~~~    ~~~
% and the rule might be that either the second dice is odd or the
% suits must have the same colour.
%
% The 3 different eleusis (eleusis1,eleusis2,eleusis3) games were
% obtained from J.R. Quinlan (University of Sydney). This file contains
% common background knowledge for all three games.

:- [eleusis]?	% Common background knowledge


% Positive examples

% can_follow(card, suit, card, suit, number, number)

% can_follow(A,B,C,D,E,F) :- odd(F).
% can_follow(A,B,C,D,E,F) :- samecolour(B,D).

can_follow(j,h,7,d,4,2).
can_follow(a,c,6,h,1,5).
can_follow(j,d,j,d,1,2).
can_follow(4,d,a,s,5,1).
can_follow(0,c,0,c,2,3).
can_follow(0,h,8,d,3,5).
can_follow(0,c,4,s,4,1).
can_follow(7,s,6,s,4,2).
can_follow(8,h,j,h,4,5).
can_follow(0,h,9,h,3,1).
can_follow(5,h,k,h,1,5).
can_follow(a,s,k,c,1,2).
can_follow(4,s,8,c,4,4).
can_follow(7,d,8,d,6,4).
can_follow(5,s,3,d,3,3).
can_follow(j,d,7,h,3,3).
can_follow(8,s,4,c,6,6).
can_follow(8,c,5,c,1,6).
can_follow(9,d,2,d,2,1).
can_follow(6,s,3,c,2,4).
can_follow(a,s,k,c,1,1).
can_follow(8,h,j,h,5,1).
can_follow(9,h,3,h,3,4).
can_follow(j,d,5,h,5,3).
can_follow(5,s,a,c,6,5).
can_follow(3,s,6,d,1,5).
can_follow(0,h,j,h,1,1).
can_follow(4,h,7,c,4,1).
can_follow(k,h,k,c,4,1).
can_follow(q,s,3,c,3,6).
can_follow(3,c,9,d,4,3).
can_follow(3,h,9,d,3,2).
can_follow(q,d,9,d,4,1).
can_follow(6,h,0,h,3,5).
can_follow(9,s,j,c,4,3).
can_follow(4,c,a,h,5,1).
can_follow(q,h,8,h,6,4).
can_follow(5,s,6,s,4,3).
can_follow(7,s,0,c,2,3).
can_follow(8,d,j,d,1,4).
can_follow(6,c,8,c,6,3).
can_follow(8,c,4,s,6,5).
can_follow(7,d,2,h,4,1).
can_follow(5,s,7,s,1,4).
can_follow(5,d,j,h,2,5).
can_follow(k,s,8,s,6,3).
can_follow(3,d,4,h,3,1).
can_follow(q,c,4,s,3,4).
can_follow(6,s,6,c,3,4).
can_follow(5,c,3,s,2,5).
can_follow(3,d,j,d,2,1).
can_follow(7,s,2,s,5,5).
can_follow(6,h,7,s,1,5).
can_follow(6,d,a,d,3,2).
can_follow(k,s,k,h,5,1).
can_follow(5,s,9,s,5,3).
can_follow(q,s,j,d,3,3).
can_follow(3,s,4,s,2,2).
can_follow(0,c,a,h,5,3).
can_follow(4,d,k,d,6,5).
can_follow(8,d,2,h,5,3).
can_follow(6,d,2,d,4,3).
can_follow(6,c,a,c,4,4).
can_follow(8,c,8,c,5,1).
can_follow(q,h,6,d,6,1).
can_follow(9,c,q,h,4,1).
can_follow(8,s,0,s,4,4).
can_follow(7,s,5,s,3,6).
can_follow(0,s,9,s,6,2).
can_follow(7,d,9,d,1,4).
can_follow(3,h,3,d,2,6).
can_follow(8,h,0,c,3,5).
can_follow(9,s,0,c,4,3).
can_follow(0,c,q,c,6,2).
can_follow(4,s,9,h,4,5).
can_follow(a,c,9,s,1,1).
can_follow(k,c,0,c,5,3).
can_follow(5,s,5,s,4,6).
can_follow(k,c,6,c,2,6).
can_follow(j,c,3,c,1,3).
can_follow(6,s,6,d,2,5).
can_follow(j,c,9,d,6,1).
can_follow(3,c,k,s,4,3).
can_follow(2,d,2,d,3,2).
can_follow(a,h,8,d,5,5).
can_follow(6,d,8,d,1,2).
can_follow(8,s,4,c,1,1).
can_follow(0,h,7,h,4,2).
can_follow(0,c,4,s,5,6).
can_follow(a,c,5,d,3,3).
can_follow(8,s,2,d,4,1).
can_follow(8,h,7,c,1,5).
can_follow(4,h,a,d,2,1).
can_follow(0,s,4,h,5,3).
can_follow(a,h,k,c,1,1).
can_follow(9,c,j,c,4,4).
can_follow(j,s,8,s,6,6).
can_follow(q,c,k,d,3,5).
can_follow(j,d,4,s,2,5).
can_follow(3,d,q,h,2,4).
can_follow(k,d,7,d,5,6).
can_follow(3,s,a,s,2,3).
can_follow(4,c,j,d,5,5).
can_follow(0,c,2,d,6,1).
can_follow(k,d,j,h,4,5).
can_follow(5,s,j,s,2,4).
can_follow(9,d,q,h,1,4).
can_follow(3,s,8,h,3,3).
can_follow(k,c,3,d,5,5).
can_follow(k,h,0,h,4,6).
can_follow(9,s,0,h,5,1).
can_follow(a,s,2,s,2,5).
can_follow(3,h,8,c,2,1).
can_follow(5,s,2,c,4,2).
can_follow(4,d,a,s,5,3).
can_follow(7,d,3,h,6,6).
can_follow(9,s,0,d,5,1).
can_follow(a,d,3,d,2,2).
can_follow(8,c,0,h,6,3).
can_follow(0,s,j,s,5,3).
can_follow(5,h,9,s,3,3).
can_follow(k,h,k,d,6,2).
can_follow(3,c,3,s,5,3).
can_follow(2,d,q,h,3,3).
can_follow(2,d,8,h,1,3).
can_follow(j,d,8,d,5,2).
can_follow(j,c,8,s,5,3).
can_follow(5,h,q,d,2,4).
can_follow(0,d,9,d,2,4).
can_follow(k,s,4,h,6,1).
can_follow(4,s,j,s,6,2).
can_follow(4,s,4,c,3,1).
can_follow(j,d,5,d,2,3).
can_follow(4,d,q,s,5,5).
can_follow(q,h,4,d,1,1).
can_follow(0,c,6,c,2,6).
can_follow(6,c,3,h,4,5).
can_follow(4,d,0,s,4,5).
can_follow(0,s,a,d,6,3).
can_follow(k,s,k,c,4,5).
can_follow(0,s,3,s,1,2).
can_follow(2,h,2,h,1,3).
can_follow(j,d,a,d,4,1).
can_follow(k,s,4,d,5,1).
can_follow(8,s,5,s,3,2).
can_follow(3,d,9,h,5,2).
can_follow(7,s,j,d,6,5).
can_follow(2,h,k,h,2,6).
can_follow(0,c,3,s,5,4).
can_follow(4,h,6,h,4,4).
can_follow(9,d,3,h,6,3).
can_follow(5,c,4,s,6,5).
can_follow(6,h,9,h,4,1).
can_follow(j,s,0,c,3,5).
can_follow(0,d,0,h,3,1).
can_follow(2,c,q,c,6,2).
can_follow(j,s,3,c,4,3).
can_follow(j,c,5,d,1,3).
can_follow(k,c,j,s,6,3).
can_follow(k,s,k,c,3,2).
can_follow(8,c,3,c,1,1).
can_follow(q,d,k,s,6,1).
can_follow(3,d,q,h,1,2).
can_follow(0,c,8,s,2,3).
can_follow(7,c,8,c,1,4).
can_follow(2,c,9,c,4,3).
can_follow(j,s,j,c,1,4).
can_follow(6,c,2,s,2,6).
can_follow(9,d,a,h,6,2).
can_follow(j,s,6,s,6,1).
can_follow(4,d,4,d,4,6).
can_follow(0,d,k,s,6,3).
can_follow(9,c,8,h,4,5).
can_follow(q,d,8,d,1,4).
can_follow(2,d,j,c,2,1).
can_follow(6,d,q,d,6,3).
can_follow(q,s,q,h,4,5).
can_follow(9,s,k,d,5,3).
can_follow(6,c,5,s,2,2).
can_follow(9,h,4,c,6,5).
can_follow(9,c,2,s,4,1).
can_follow(6,c,2,c,1,3).
can_follow(4,s,a,c,2,1).
can_follow(8,h,j,c,3,5).
can_follow(9,s,3,d,5,3).
can_follow(5,c,8,h,3,5).
can_follow(2,s,9,h,6,1).
can_follow(8,h,q,s,4,1).
can_follow(5,c,j,h,2,3).
can_follow(0,h,6,c,6,3).
can_follow(a,d,2,c,3,5).
can_follow(8,c,q,s,5,4).
can_follow(j,h,a,c,4,3).
can_follow(a,h,7,d,2,5).
can_follow(2,d,2,h,3,4).
can_follow(5,d,0,h,5,3).
can_follow(8,c,5,c,2,1).
can_follow(3,d,2,d,1,2).
can_follow(j,s,0,s,6,2).
can_follow(6,d,2,d,4,3).
% can_follow(2,c,8,d,3,3).
% can_follow(j,c,k,s,5,6).
% can_follow(8,h,6,d,2,6).
% can_follow(2,c,2,c,3,1).
% can_follow(a,c,q,d,2,5).
% can_follow(6,d,7,d,4,6).
% can_follow(k,d,j,d,2,5).
% can_follow(k,h,9,s,2,5).
% can_follow(8,h,5,d,2,1).
% can_follow(2,s,a,d,1,5).
% can_follow(5,c,8,c,5,3).
% can_follow(j,c,7,c,3,3).
% can_follow(4,c,5,h,4,1).
% can_follow(0,h,6,h,1,2).
% can_follow(4,d,0,h,4,5).
% can_follow(j,d,k,d,6,2).
% can_follow(8,h,6,d,6,5).
% can_follow(0,s,7,s,2,4).
% can_follow(2,c,9,c,1,1).
% can_follow(9,c,3,s,6,2).
% can_follow(2,c,6,c,1,6).
% can_follow(a,s,4,c,5,5).
% can_follow(6,h,j,s,5,1).
% can_follow(3,h,2,s,5,1).
% can_follow(5,s,4,c,2,4).
% can_follow(5,d,5,h,3,5).
% can_follow(3,h,k,s,2,1).
% can_follow(4,h,6,c,4,3).
% can_follow(q,d,5,s,4,1).
% can_follow(0,d,5,s,3,5).
% can_follow(j,h,2,d,1,5).
% can_follow(9,s,9,h,1,1).
% can_follow(7,d,q,c,2,1).
% can_follow(6,s,a,c,3,3).
% can_follow(6,h,j,h,3,2).
% can_follow(8,h,4,d,4,2).
% can_follow(j,d,5,d,4,2).
% can_follow(7,h,k,d,5,6).
% can_follow(3,s,9,c,6,2).
% can_follow(8,d,0,d,2,3).
% can_follow(a,s,4,h,6,1).
% can_follow(5,s,5,c,1,1).
% can_follow(7,h,9,h,4,1).
% can_follow(0,h,2,s,6,1).
% can_follow(a,h,5,h,4,3).
% can_follow(8,h,5,s,4,3).
% can_follow(j,h,9,h,3,3).
% can_follow(5,d,4,d,5,6).
% can_follow(9,s,k,h,6,3).
% can_follow(9,c,0,s,6,2).
% can_follow(k,s,k,s,2,6).
% can_follow(4,c,8,d,3,1).
% can_follow(9,c,q,d,2,1).
% can_follow(8,s,9,c,5,2).
% can_follow(2,s,5,c,6,4).
% can_follow(2,s,7,s,4,2).
% can_follow(7,s,2,h,2,5).
% can_follow(7,d,6,d,6,4).
% can_follow(j,h,9,h,3,1).
% can_follow(8,h,0,h,1,3).
% can_follow(8,c,9,d,4,5).
% can_follow(3,h,q,h,3,5).
% can_follow(2,c,3,s,6,2).
% can_follow(k,h,0,d,1,1).
% can_follow(9,s,7,h,6,5).
% can_follow(q,c,9,s,1,4).
% can_follow(0,h,6,s,3,1).
% can_follow(9,c,k,c,5,4).
% can_follow(k,s,8,s,1,4).
% can_follow(8,d,a,h,6,6).
% can_follow(2,d,7,s,2,3).
% can_follow(7,d,4,d,1,5).
% can_follow(q,h,3,s,4,1).
% can_follow(5,h,j,h,6,6).
% can_follow(3,h,3,h,6,1).
% can_follow(k,c,7,h,4,5).
% can_follow(8,d,q,h,4,4).
% can_follow(k,d,q,d,2,6).
% can_follow(6,s,a,c,3,2).
% can_follow(3,s,9,c,3,3).
% can_follow(5,c,9,d,3,1).
% can_follow(8,s,j,s,4,2).
% can_follow(0,d,9,d,6,3).
% can_follow(8,s,3,s,6,3).
% can_follow(4,d,6,d,2,2).
% can_follow(9,h,9,d,6,4).
% can_follow(8,d,k,c,1,5).
% can_follow(k,d,a,d,3,3).
% can_follow(9,c,7,s,1,2).
% can_follow(2,h,6,d,6,1).
% can_follow(5,d,j,s,1,1).
% can_follow(6,h,3,d,1,1).
% can_follow(8,d,7,d,2,2).
% can_follow(7,s,k,s,1,5).
% can_follow(2,d,7,h,2,6).
% can_follow(k,c,7,d,4,3).
% can_follow(5,s,2,d,2,3).
% can_follow(4,c,3,c,3,3).
% can_follow(3,s,q,d,6,5).
% can_follow(2,d,3,c,4,3).
% can_follow(2,d,a,h,1,4).
% can_follow(3,c,2,h,1,5).
% can_follow(q,c,j,d,1,5).
% can_follow(5,h,k,s,6,3).
% can_follow(a,h,a,h,3,2).
% can_follow(q,s,q,c,4,1).
% can_follow(j,c,8,h,5,3).
% can_follow(q,s,5,d,5,1).
% can_follow(0,d,2,d,1,4).
% can_follow(q,h,6,h,4,5).
% can_follow(k,d,5,d,6,3).
% can_follow(5,d,2,s,3,5).
% can_follow(j,d,a,h,1,1).
% can_follow(k,s,j,h,1,5).
% can_follow(0,h,9,h,5,5).
% can_follow(5,h,2,s,3,3).
% can_follow(4,c,6,s,1,1).
% can_follow(7,s,6,c,4,1).
% can_follow(6,s,0,c,6,1).
% can_follow(2,c,6,c,2,5).
% can_follow(5,s,j,c,4,1).
% can_follow(9,s,3,s,5,1).
% can_follow(7,s,q,c,2,3).
% can_follow(5,c,9,s,2,1).
% can_follow(8,c,9,d,3,3).
% can_follow(9,s,0,s,1,5).
% can_follow(8,s,5,h,2,3).
% can_follow(4,s,6,d,4,5).
% can_follow(0,c,6,d,3,5).
% can_follow(8,s,6,d,5,3).
% can_follow(2,h,3,h,4,6).
% can_follow(q,d,3,s,3,3).
% can_follow(9,d,9,h,5,3).
% can_follow(q,d,k,h,5,4).
% can_follow(2,d,0,h,2,5).
% can_follow(a,c,5,s,4,1).
% can_follow(4,c,8,s,1,3).
% can_follow(5,d,a,d,3,6).
% can_follow(a,s,q,h,5,1).
% can_follow(9,s,k,c,4,1).
% can_follow(j,d,0,d,2,3).
% can_follow(5,c,5,c,5,6).
% can_follow(5,h,a,d,1,5).
% can_follow(5,c,8,c,4,3).
% can_follow(3,h,k,s,6,1).
% can_follow(9,d,9,d,4,5).
% can_follow(4,d,8,s,2,5).
% can_follow(j,d,3,h,1,6).
% can_follow(9,s,7,s,4,4).
% can_follow(6,h,7,c,2,3).
% can_follow(j,c,9,d,5,1).
% can_follow(5,h,6,d,4,2).
% can_follow(7,h,4,h,6,5).
% can_follow(9,s,7,s,2,3).
% can_follow(6,h,0,h,2,6).
% can_follow(9,c,q,d,1,5).
% can_follow(j,d,k,d,6,2).
% can_follow(8,s,q,c,3,3).
% can_follow(k,d,7,d,3,6).
% can_follow(9,h,7,h,5,6).
% can_follow(q,d,a,d,6,6).
% can_follow(q,s,7,c,4,2).
% can_follow(8,h,3,h,3,4).
% can_follow(5,h,3,s,1,3).
% can_follow(9,c,9,h,2,5).
% can_follow(9,d,3,d,4,3).
% can_follow(4,s,2,c,1,2).
% can_follow(q,d,5,d,1,4).
% can_follow(3,h,0,d,3,5).
% can_follow(7,c,7,d,1,1).
% can_follow(3,c,k,s,5,2).
% can_follow(8,s,q,h,4,3).
% can_follow(7,h,j,d,4,4).
% can_follow(2,h,4,c,3,1).
% can_follow(6,d,9,h,6,4).
% can_follow(0,h,q,h,3,2).
% can_follow(9,h,a,h,1,5).
% can_follow(k,h,4,d,4,1).
% can_follow(6,s,0,c,3,4).
% can_follow(4,s,9,s,5,5).
% can_follow(a,c,4,s,4,1).
% can_follow(0,h,2,h,3,2).
% can_follow(a,c,5,s,2,2).
% can_follow(j,c,2,h,4,3).
% can_follow(7,c,q,h,6,1).
% can_follow(4,c,2,s,6,1).
% can_follow(q,h,0,d,6,5).
% can_follow(5,d,a,d,2,3).
% can_follow(8,c,k,c,2,6).
% can_follow(k,c,8,s,5,1).
% can_follow(0,d,5,c,3,1).
% can_follow(5,h,5,s,1,5).
% can_follow(6,d,7,d,6,6).
% can_follow(8,s,j,h,2,3).
% can_follow(k,d,6,d,2,2).
% can_follow(a,s,3,s,1,5).
% can_follow(a,d,2,d,6,1).
% can_follow(a,s,7,c,3,1).
% can_follow(7,h,5,h,5,3).
% can_follow(3,c,a,d,3,5).
% can_follow(6,h,j,h,2,6).
% can_follow(4,d,3,d,5,1).
% can_follow(5,s,k,c,4,2).
% can_follow(8,d,3,h,4,6).
% can_follow(3,c,7,s,1,5).
% can_follow(q,d,q,d,4,6).
% can_follow(q,d,2,h,2,2).
% can_follow(a,h,5,h,5,4).
% can_follow(8,s,7,s,3,4).
% can_follow(4,d,k,h,3,3).
% can_follow(3,d,0,h,3,6).
% can_follow(7,h,9,h,4,6).
% can_follow(7,h,k,d,4,3).
% can_follow(8,s,a,h,1,3).
% can_follow(6,c,5,s,3,4).
% can_follow(j,s,2,s,2,2).
% can_follow(5,d,5,d,4,2).
% can_follow(9,s,j,c,4,4).
% can_follow(j,h,3,d,5,1).
% can_follow(k,d,4,d,2,1).
% can_follow(6,c,8,s,6,4).
% can_follow(5,c,4,s,3,1).
% can_follow(8,s,j,c,4,6).
% can_follow(k,h,4,h,6,5).
% can_follow(0,s,9,s,5,2).
% can_follow(9,s,7,h,2,1).
% can_follow(5,c,5,s,4,6).
% can_follow(9,c,8,s,5,5).
% can_follow(2,d,8,h,4,4).
% can_follow(0,s,6,h,6,5).
% can_follow(3,d,a,s,5,3).
% can_follow(a,h,4,h,4,3).
% can_follow(4,d,3,s,3,3).
% can_follow(2,d,q,c,5,3).
% can_follow(0,h,0,h,3,1).
% can_follow(k,d,4,s,3,1).
% can_follow(k,c,7,h,2,1).
% can_follow(2,s,9,s,5,4).
% can_follow(4,d,7,h,3,6).
% can_follow(0,c,q,h,2,1).
% can_follow(5,h,3,h,3,2).
% can_follow(6,d,6,h,4,5).
% can_follow(5,d,7,d,6,1).
% can_follow(7,s,5,s,2,6).
% can_follow(7,c,q,s,6,1).
% can_follow(8,h,4,s,3,5).
% can_follow(6,d,j,s,5,3).
% can_follow(7,c,0,s,6,4).
% can_follow(9,d,9,d,6,1).
% can_follow(4,d,2,c,2,3).
% can_follow(6,h,8,h,4,5).
% can_follow(2,c,j,s,1,1).
% can_follow(3,c,q,h,6,5).
% can_follow(0,h,q,d,3,4).
% can_follow(j,s,5,d,2,5).
% can_follow(a,h,8,d,5,6).
% can_follow(4,h,7,h,5,6).
% can_follow(6,s,2,c,6,2).
% can_follow(2,d,8,d,1,2).
% can_follow(q,s,2,s,5,5).
% can_follow(6,d,7,d,6,1).
% can_follow(2,h,7,h,1,2).
% can_follow(4,d,5,d,5,4).
% can_follow(q,s,8,d,3,1).
% can_follow(k,c,7,s,6,3).
% can_follow(q,h,6,c,3,3).
% can_follow(4,d,0,h,1,4).
% can_follow(0,h,7,d,4,1).
% can_follow(0,d,j,d,5,1).
% can_follow(9,s,6,s,6,1).
% can_follow(5,h,j,h,3,4).
% can_follow(6,s,7,h,6,5).
% can_follow(6,d,q,c,4,3).
% can_follow(7,d,4,d,3,6).
% can_follow(3,d,k,h,5,3).
% can_follow(3,s,5,c,3,6).
% can_follow(0,c,3,s,3,2).
% can_follow(j,s,j,c,2,2).
% can_follow(7,s,8,d,5,5).
% can_follow(k,h,q,d,4,1).
% can_follow(7,h,6,d,3,5).
% can_follow(4,h,k,c,4,1).
% can_follow(3,h,4,d,5,3).
% can_follow(5,s,j,c,5,3).
% can_follow(2,d,3,s,4,1).
% can_follow(q,s,7,s,4,2).
% can_follow(2,h,q,d,6,5).
% can_follow(6,c,6,c,5,3).
% can_follow(3,h,q,s,2,3).
% can_follow(j,s,5,d,2,3).
% can_follow(k,c,5,s,6,6).
% can_follow(a,d,2,h,2,5).
% can_follow(8,s,0,c,4,2).
% can_follow(2,c,8,h,6,5).
% can_follow(8,h,a,d,5,3).
% can_follow(7,s,6,s,6,2).
% can_follow(k,c,0,c,6,5).
% can_follow(6,s,7,d,5,1).
% can_follow(6,s,5,h,6,5).
% can_follow(6,s,8,h,2,1).
% can_follow(a,s,2,c,1,4).
% can_follow(0,c,5,c,6,5).
% can_follow(3,d,7,h,4,6).
% can_follow(j,d,a,h,4,3).
% can_follow(8,h,8,d,6,4).
% can_follow(a,h,5,d,6,2).
% can_follow(q,s,q,d,5,1).
% can_follow(a,c,6,h,5,1).
% can_follow(2,d,8,h,6,1).
% can_follow(0,h,k,h,2,6).
% can_follow(6,s,3,c,3,4).
% can_follow(5,h,a,d,6,3).
% can_follow(a,d,5,h,5,4).
% can_follow(k,h,j,d,2,4).
% can_follow(8,s,5,d,3,5).
% can_follow(k,c,2,h,2,3).
% can_follow(9,h,0,h,3,2).
% can_follow(9,d,2,c,6,5).
% can_follow(9,s,0,c,1,3).
% can_follow(5,s,9,c,1,2).
% can_follow(8,d,j,d,4,3).
% can_follow(3,h,2,c,5,5).
% can_follow(0,c,3,s,3,2).
% can_follow(a,d,k,h,6,1).
% can_follow(6,h,4,h,1,2).
% can_follow(8,s,3,h,1,5).
% can_follow(0,s,j,c,2,3).
% can_follow(j,s,k,s,6,6).
% can_follow(0,h,4,h,1,1).
% can_follow(6,c,7,d,2,1).
% can_follow(6,s,4,h,1,1).
% can_follow(7,h,4,h,3,3).
% can_follow(5,s,4,c,3,5).
% can_follow(0,h,5,d,5,4).
% can_follow(j,d,7,s,1,5).
% can_follow(0,c,q,c,2,2).
% can_follow(9,h,a,d,1,5).
% can_follow(0,c,9,c,1,2).
% can_follow(a,s,2,h,4,3).
% can_follow(j,c,q,s,2,6).
% can_follow(q,c,9,s,3,2).
% can_follow(5,h,6,d,4,6).
% can_follow(5,c,8,c,2,4).
% can_follow(5,c,0,h,4,3).
% can_follow(9,d,2,s,2,5).
% can_follow(k,h,4,d,5,4).
% can_follow(6,d,5,d,1,6).
% can_follow(q,c,j,s,5,5).
% can_follow(j,h,2,h,4,4).
% can_follow(6,c,5,c,5,5).
% can_follow(j,h,8,s,5,5).
% can_follow(q,s,2,c,1,2).
% can_follow(2,d,9,c,6,5).
% can_follow(7,d,2,d,1,5).
% can_follow(2,d,0,h,6,5).
% can_follow(5,c,q,d,6,5).
% can_follow(8,h,5,h,2,4).
% can_follow(j,d,q,d,6,3).
% can_follow(8,c,3,s,6,5).
% can_follow(5,d,3,d,1,6).
% can_follow(2,c,8,d,5,5).
% can_follow(6,h,4,d,3,6).
% can_follow(3,s,j,s,4,6).
% can_follow(0,h,5,s,1,3).
% can_follow(5,s,0,c,5,3).
% can_follow(a,d,j,d,2,3).
% can_follow(9,c,7,c,6,6).
% can_follow(q,d,2,c,1,3).
% can_follow(j,s,j,d,4,3).
% can_follow(0,c,6,c,2,4).
% can_follow(a,d,9,c,5,3).
% can_follow(2,d,2,d,4,3).
% can_follow(5,c,3,h,5,5).
% can_follow(5,d,6,h,1,4).
% can_follow(a,h,q,h,1,6).
% can_follow(q,s,6,c,5,5).
% can_follow(2,c,j,s,4,5).
% can_follow(2,s,q,d,6,5).
% can_follow(9,c,6,c,4,4).
% can_follow(6,d,5,c,2,1).
% can_follow(a,s,k,h,5,5).
% can_follow(9,c,5,c,3,4).
% can_follow(8,h,0,c,3,3).
% can_follow(a,d,a,d,6,6).
% can_follow(j,s,a,c,2,1).
% can_follow(a,s,j,c,2,6).
% can_follow(9,h,6,h,5,1).
% can_follow(8,h,8,c,5,3).
% can_follow(5,d,j,d,1,1).
% can_follow(4,h,k,c,5,3).
% can_follow(k,d,9,h,6,1).
% can_follow(0,h,k,h,3,4).
% can_follow(4,s,a,h,1,1).
% can_follow(7,s,2,c,1,5).
% can_follow(4,c,3,s,1,1).
% can_follow(3,s,q,s,5,4).
% can_follow(0,h,2,s,4,3).
% can_follow(j,h,8,h,4,5).
% can_follow(3,h,q,h,3,4).
% can_follow(q,s,3,h,6,1).
% can_follow(3,c,8,s,2,1).
% can_follow(k,h,q,c,3,3).
% can_follow(6,s,3,h,2,1).
% can_follow(q,d,q,s,3,5).
% can_follow(8,s,8,s,2,3).
% can_follow(2,s,4,s,2,4).
% can_follow(6,c,k,c,3,4).
% can_follow(6,h,k,c,3,1).
% can_follow(0,d,0,c,2,3).
% can_follow(5,h,9,d,5,4).
% can_follow(q,h,k,h,3,4).
% can_follow(6,s,9,h,4,1).
% can_follow(6,s,3,c,6,1).
% can_follow(7,d,a,d,3,6).
% can_follow(0,h,8,s,4,3).
% can_follow(7,s,7,s,3,3).
% can_follow(0,c,8,s,2,1).
% can_follow(2,c,8,h,1,3).
% can_follow(3,s,7,c,2,2).
% can_follow(k,c,2,h,3,1).
% can_follow(9,d,0,d,3,1).
% can_follow(7,c,k,d,6,3).
% can_follow(j,h,8,h,3,5).
% can_follow(8,h,5,c,6,1).
% can_follow(4,c,k,d,2,5).
% can_follow(k,s,0,s,1,5).
% can_follow(7,d,9,s,3,5).
% can_follow(0,c,q,s,5,5).
% can_follow(7,s,3,c,1,4).
% can_follow(8,h,q,s,5,5).
% can_follow(4,s,a,s,2,5).
% can_follow(4,h,4,h,5,3).
% can_follow(a,h,7,d,3,1).
% can_follow(9,d,a,c,6,5).
% can_follow(5,d,0,c,1,5).
% can_follow(4,c,9,c,5,3).
% can_follow(7,h,5,c,5,1).
% can_follow(k,h,6,d,1,2).
% can_follow(a,h,j,h,5,5).
% can_follow(2,s,a,h,2,5).
% can_follow(2,d,k,d,4,4).
% can_follow(q,h,q,d,5,5).
% can_follow(k,c,6,c,2,3).
% can_follow(3,h,0,h,3,2).
% can_follow(8,c,q,h,6,1).
% can_follow(9,s,j,c,2,2).
% can_follow(4,d,0,h,3,6).
% can_follow(4,s,5,c,6,3).
% can_follow(4,d,k,d,2,2).
% can_follow(k,d,6,d,6,3).
% can_follow(8,d,q,d,1,4).
% can_follow(0,h,9,h,4,5).
% can_follow(9,h,7,c,1,1).
% can_follow(6,h,a,h,2,6).
% can_follow(2,h,a,c,3,5).
% can_follow(a,d,k,d,1,3).
% can_follow(4,h,a,d,5,3).
% can_follow(q,d,k,s,6,3).
% can_follow(3,s,4,d,3,3).
% can_follow(5,d,8,h,5,2).
% can_follow(0,d,8,d,5,4).
% can_follow(6,d,5,s,1,1).
% can_follow(3,h,8,s,6,3).
% can_follow(q,d,0,h,2,6).
% can_follow(q,c,j,s,1,6).
% can_follow(3,d,0,h,1,2).
% can_follow(4,c,k,s,3,5).
% can_follow(9,s,4,c,1,2).
% can_follow(k,h,a,c,2,5).
% can_follow(4,d,3,h,1,2).
% can_follow(j,d,j,s,3,5).
% can_follow(4,h,5,d,2,5).
% can_follow(8,s,8,c,6,6).
% can_follow(q,s,7,c,1,6).
% can_follow(2,c,0,c,1,5).
% can_follow(k,d,8,d,5,2).
% can_follow(7,d,8,d,2,5).
% can_follow(k,h,k,d,6,1).
% can_follow(9,h,5,c,5,1).
% can_follow(5,c,a,c,1,3).
% can_follow(8,c,3,h,1,3).
% can_follow(2,c,6,d,6,3).
% can_follow(j,c,9,d,5,5).
% can_follow(2,h,8,h,4,5).
% can_follow(8,c,9,d,6,5).
% can_follow(8,d,q,h,6,4).
% can_follow(4,h,9,s,2,3).
% can_follow(j,h,0,h,2,2).
% can_follow(a,h,a,h,3,3).
% can_follow(k,d,5,d,1,4).
% can_follow(4,d,4,h,5,1).
% can_follow(j,h,5,d,1,1).
% can_follow(3,h,k,d,3,3).
% can_follow(2,c,7,c,3,4).
% can_follow(5,h,k,h,6,3).
% can_follow(9,s,8,s,4,2).
% can_follow(5,h,8,h,6,4).
% can_follow(6,d,8,d,1,4).
% can_follow(8,d,6,d,6,2).
% can_follow(7,h,9,h,1,5).
% can_follow(8,h,7,h,1,3).
% can_follow(0,s,3,c,2,4).
% can_follow(a,h,3,h,4,6).
% can_follow(2,d,3,s,6,1).
% can_follow(0,d,k,d,4,4).
% can_follow(8,s,2,c,1,5).
% can_follow(3,h,8,d,6,2).
% can_follow(7,d,5,d,5,3).
% can_follow(7,c,5,s,1,5).
% can_follow(7,h,a,h,3,3).
% can_follow(3,c,j,s,4,5).
% can_follow(5,s,3,s,1,5).
% can_follow(k,s,6,h,5,1).
% can_follow(6,d,4,h,6,2).
% can_follow(3,c,4,c,2,4).
% can_follow(q,d,2,d,4,1).
% can_follow(q,s,q,c,6,2).
% can_follow(4,d,8,s,5,1).
% can_follow(0,d,a,c,3,3).
% can_follow(4,d,3,h,6,1).
% can_follow(2,h,k,d,2,4).
% can_follow(4,s,9,d,5,3).
% can_follow(3,c,4,c,6,1).
% can_follow(5,d,a,s,3,3).
% can_follow(6,s,3,s,2,1).
% can_follow(a,s,8,h,6,5).
% can_follow(q,s,3,d,4,1).
% can_follow(8,h,2,d,4,6).
% can_follow(a,s,9,s,6,5).
% can_follow(0,d,q,s,6,3).
% can_follow(8,d,0,c,6,5).
% can_follow(2,d,j,c,4,3).
% can_follow(3,d,k,d,2,4).
% can_follow(j,c,a,c,4,6).
% can_follow(2,c,k,s,5,1).
% can_follow(a,s,q,h,4,5).
% can_follow(8,s,q,h,1,5).
% can_follow(0,s,0,c,6,4).
% can_follow(9,s,j,s,3,6).
% can_follow(2,c,7,d,1,5).
% can_follow(j,s,a,s,6,4).
% can_follow(9,s,9,s,2,2).
% can_follow(5,c,2,h,4,5).
% can_follow(3,d,a,h,3,6).
% can_follow(3,c,a,s,1,4).
% can_follow(a,c,3,c,4,1).
% can_follow(4,h,4,d,4,3).
