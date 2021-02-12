%%%%%%%%%%%%%%%%%%%%%%%%
% Eleusis parlour game 2. This is a guessing game involving cards and dice.
% One player (the rule-maker) makes up game rules and presents the other
% player (the guesser) with a pair of cards and a pair of dice.
% The guesser is then told whether the game rules are true or not of the
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
:- set(c,2)?

% Positive examples

% can_follow(card, suit, card, suit, number, number).

% can_follow(A,B,C,D,E,F) :- face(A), not face(C).
% can_follow(A,B,C,D,E,F) :- face(C), not face(A).

can_follow(0,s,j,c,1,6).
can_follow(4,d,j,d,3,2).
can_follow(3,c,a,h,1,1).
can_follow(7,d,k,h,1,5).
can_follow(5,s,k,h,4,4).
can_follow(2,c,q,h,3,5).
can_follow(a,c,6,h,4,1).
can_follow(6,h,k,s,6,3).
can_follow(9,s,a,d,4,6).
can_follow(q,c,0,d,1,1).
can_follow(8,h,q,c,6,1).
can_follow(3,d,j,d,5,3).
can_follow(7,d,a,c,4,1).
can_follow(5,c,k,c,3,6).
can_follow(7,s,q,c,3,5).
can_follow(q,c,6,d,3,6).
can_follow(k,h,2,h,3,3).
can_follow(j,d,0,c,4,5).
can_follow(k,h,8,d,6,5).
can_follow(2,s,q,d,4,2).
can_follow(k,s,4,s,6,3).
can_follow(a,d,2,s,1,5).
can_follow(6,h,a,h,4,3).
can_follow(9,d,j,s,5,1).
can_follow(j,d,6,h,3,3).
can_follow(a,s,3,h,1,1).
can_follow(2,h,a,h,5,4).
can_follow(6,c,q,h,2,6).
can_follow(k,h,3,d,4,6).
can_follow(7,d,q,c,5,2).
% can_follow(3,c,k,h,4,2).
% can_follow(q,c,3,h,1,3).
% can_follow(j,h,4,h,4,4).
% can_follow(6,h,k,d,6,6).
% can_follow(q,h,5,c,1,3).
% can_follow(7,h,j,d,4,6).
% can_follow(q,s,8,s,5,1).
% can_follow(7,h,k,s,5,3).
% can_follow(q,s,5,d,6,6).
% can_follow(j,d,2,s,3,5).
% can_follow(k,d,9,c,6,2).
% can_follow(4,s,a,d,2,4).
% can_follow(2,d,j,d,4,6).
% can_follow(2,d,j,s,3,5).
% can_follow(5,c,j,h,5,6).
% can_follow(k,d,4,c,1,6).
% can_follow(9,c,a,h,1,3).
% can_follow(2,c,k,c,1,1).
% can_follow(8,c,j,h,4,6).
% can_follow(a,h,5,d,4,2).
% can_follow(j,s,3,s,3,4).
% can_follow(a,s,6,c,6,1).
% can_follow(3,d,q,c,2,4).
% can_follow(k,s,9,s,5,5).
% can_follow(2,c,q,h,2,4).
% can_follow(2,s,k,h,5,1).
% can_follow(4,s,a,s,6,2).
% can_follow(a,h,5,h,4,4).
% can_follow(j,d,0,c,6,1).
% can_follow(3,h,a,h,1,3).
% can_follow(j,c,3,s,5,2).
% can_follow(7,c,j,h,4,4).
% can_follow(5,s,j,s,1,2).
% can_follow(3,h,k,d,2,4).
% can_follow(8,s,q,h,5,5).
% can_follow(2,c,k,d,5,5).
% can_follow(8,d,a,d,1,5).
% can_follow(2,h,k,c,6,4).
% can_follow(7,d,a,c,5,2).
% can_follow(7,h,a,c,3,3).
% can_follow(j,s,8,h,5,6).
% can_follow(a,c,5,d,5,2).
% can_follow(j,c,7,c,6,5).
% can_follow(6,c,j,s,6,1).
% can_follow(8,d,a,h,4,1).
% can_follow(6,h,q,s,3,1).
% can_follow(4,d,k,c,6,6).
% can_follow(4,h,q,h,5,1).
% can_follow(a,c,4,d,5,5).
% can_follow(8,c,j,s,4,4).
% can_follow(4,h,k,d,6,5).
% can_follow(3,c,q,d,3,6).
% can_follow(j,h,2,h,1,2).
% can_follow(j,s,7,h,2,5).
% can_follow(a,h,6,d,5,6).
% can_follow(q,h,9,s,2,4).
% can_follow(5,d,k,s,1,4).
% can_follow(9,c,j,d,3,5).
% can_follow(9,h,a,d,6,4).
% can_follow(a,c,6,h,6,1).
% can_follow(5,s,q,c,5,6).
% can_follow(a,c,5,h,5,5).
% can_follow(a,h,4,c,3,1).
% can_follow(j,d,8,h,3,5).
% can_follow(k,c,5,s,3,5).
% can_follow(8,d,q,c,6,4).
% can_follow(a,d,4,h,1,4).
% can_follow(j,d,3,d,2,2).
% can_follow(j,d,8,h,1,5).
% can_follow(4,d,j,h,4,2).
% can_follow(q,h,3,c,3,6).
% can_follow(k,s,2,s,4,1).
% can_follow(9,h,q,s,3,1).
% can_follow(a,h,4,d,6,2).
% can_follow(j,h,9,c,5,2).
% can_follow(q,h,9,c,6,4).
% can_follow(6,s,q,c,6,2).
% can_follow(3,s,j,c,6,5).
% can_follow(9,h,k,c,2,6).
% can_follow(q,c,0,d,6,5).
% can_follow(k,h,2,c,1,4).
% can_follow(3,c,q,d,6,5).
% can_follow(9,h,q,c,4,1).
% can_follow(6,s,j,c,6,2).
% can_follow(8,c,k,c,4,1).
% can_follow(k,h,9,d,1,4).
% can_follow(5,h,j,h,4,1).
% can_follow(k,s,5,c,5,5).
% can_follow(2,d,a,d,1,5).
% can_follow(2,d,a,d,3,5).
% can_follow(k,h,6,d,2,5).
% can_follow(3,h,j,h,5,1).
% can_follow(k,s,5,s,6,6).
% can_follow(3,s,j,c,6,4).
% can_follow(9,c,q,d,3,1).
% can_follow(k,c,8,d,4,2).
% can_follow(j,c,8,h,1,3).
% can_follow(9,s,j,c,1,1).
% can_follow(j,h,3,d,5,6).
% can_follow(5,h,j,s,3,3).
% can_follow(k,c,9,s,5,2).
% can_follow(k,c,3,h,4,1).
% can_follow(9,h,j,c,4,4).
% can_follow(q,d,6,s,3,5).
% can_follow(8,c,k,d,2,3).
% can_follow(j,h,9,d,1,4).
% can_follow(0,d,q,c,3,1).
% can_follow(3,h,j,c,4,3).
% can_follow(q,h,6,c,2,5).
% can_follow(7,h,j,h,3,6).
% can_follow(8,c,a,s,3,6).
% can_follow(8,s,j,d,6,3).
% can_follow(k,s,4,s,4,2).
% can_follow(q,s,5,d,3,1).
% can_follow(0,s,k,h,5,5).
% can_follow(q,h,4,s,6,1).
% can_follow(7,d,j,s,6,6).
% can_follow(j,c,2,c,1,5).
% can_follow(j,h,2,s,3,1).
% can_follow(q,h,5,s,5,5).
% can_follow(8,c,k,s,1,2).
% can_follow(a,c,8,c,2,5).
% can_follow(0,h,j,d,6,3).
% can_follow(6,d,q,d,6,6).
% can_follow(5,s,k,d,6,3).
% can_follow(6,s,k,c,5,4).
% can_follow(j,s,0,d,5,2).
% can_follow(k,h,3,s,6,3).
% can_follow(5,c,a,s,6,2).
% can_follow(0,d,k,s,4,6).
% can_follow(5,d,q,d,1,5).
% can_follow(0,s,q,c,5,6).
% can_follow(j,d,9,s,3,6).
% can_follow(k,d,5,s,3,1).
% can_follow(q,h,7,h,4,3).
% can_follow(j,s,2,h,1,1).
% can_follow(9,s,k,c,1,3).
% can_follow(3,d,k,d,2,1).
% can_follow(a,s,0,s,5,3).
% can_follow(a,h,0,s,2,3).
% can_follow(q,d,9,d,1,5).
% can_follow(q,c,0,d,6,4).
% can_follow(4,s,j,h,5,4).
% can_follow(3,c,k,s,6,2).
% can_follow(j,d,0,c,4,4).
% can_follow(q,h,7,s,6,4).
% can_follow(0,d,a,s,4,2).
% can_follow(a,c,0,c,4,2).
% can_follow(4,h,q,c,2,3).
% can_follow(j,h,2,d,5,3).
% can_follow(a,c,4,c,6,4).
% can_follow(4,h,a,s,1,1).
% can_follow(7,s,k,h,4,3).
% can_follow(3,c,k,c,4,2).
% can_follow(q,d,8,d,4,6).
% can_follow(j,h,5,h,4,6).
% can_follow(j,d,5,h,2,1).
% can_follow(j,c,0,c,1,3).
% can_follow(0,h,a,c,4,1).
% can_follow(a,s,9,h,6,5).
% can_follow(4,h,k,h,2,5).
% can_follow(q,d,8,d,1,2).
% can_follow(8,c,j,c,1,1).
% can_follow(j,d,7,c,1,2).
% can_follow(a,d,9,d,4,3).
% can_follow(3,d,q,c,5,6).
% can_follow(a,d,2,h,1,5).
% can_follow(k,c,2,h,3,4).
% can_follow(0,c,k,s,2,3).
% can_follow(q,d,5,h,3,5).
% can_follow(a,d,8,d,6,6).
% can_follow(7,s,a,h,3,2).
% can_follow(7,s,q,c,6,5).
% can_follow(5,c,q,s,4,5).
% can_follow(j,h,0,h,2,4).
% can_follow(a,d,0,s,6,2).
% can_follow(j,d,2,s,3,5).
% can_follow(k,c,0,d,6,4).
% can_follow(6,d,k,d,4,5).
% can_follow(a,d,8,h,4,2).
% can_follow(j,d,0,d,1,1).
% can_follow(j,d,0,c,3,1).
% can_follow(a,c,9,s,6,6).
% can_follow(5,c,a,s,4,2).
% can_follow(5,s,k,c,6,5).
% can_follow(a,s,7,h,4,3).
% can_follow(5,h,a,d,2,6).
% can_follow(9,d,q,s,2,1).
% can_follow(4,h,k,d,4,2).
% can_follow(a,d,9,c,2,2).
% can_follow(8,h,q,h,4,4).
% can_follow(3,c,a,c,4,6).
% can_follow(7,s,q,c,3,1).
% can_follow(2,c,a,c,5,1).
% can_follow(q,h,5,d,1,2).
% can_follow(k,s,8,h,4,3).
% can_follow(q,c,8,d,5,1).
% can_follow(a,d,0,d,3,3).
% can_follow(6,d,k,c,4,1).
% can_follow(k,h,8,h,3,6).
% can_follow(q,d,0,h,4,6).
% can_follow(k,h,3,c,1,6).
% can_follow(j,c,4,c,4,1).
% can_follow(k,h,6,c,4,5).
% can_follow(a,c,5,d,1,1).
% can_follow(2,s,j,s,5,5).
% can_follow(a,s,9,h,2,6).
% can_follow(a,s,3,d,2,4).
% can_follow(q,h,2,d,1,6).
% can_follow(j,c,5,h,3,5).
% can_follow(q,s,9,h,3,3).
% can_follow(a,s,6,d,1,2).
% can_follow(j,c,3,c,1,5).
% can_follow(7,h,a,d,5,4).
% can_follow(4,c,j,s,4,5).
% can_follow(3,c,a,h,4,6).
% can_follow(8,h,k,c,5,4).
% can_follow(j,s,8,s,4,5).
% can_follow(6,s,k,c,5,6).
% can_follow(5,c,q,c,5,6).
% can_follow(j,c,7,h,5,3).
% can_follow(j,h,8,c,3,3).
% can_follow(j,c,4,s,1,5).
% can_follow(j,c,6,s,1,5).
% can_follow(a,c,3,h,4,2).
% can_follow(5,d,q,h,4,5).
% can_follow(5,c,a,c,4,3).
% can_follow(0,h,k,d,2,5).
% can_follow(7,h,q,s,5,5).
% can_follow(j,d,6,c,6,2).
% can_follow(9,s,q,s,3,4).
% can_follow(9,h,k,h,3,2).
% can_follow(7,c,q,s,2,3).
% can_follow(9,c,a,h,5,1).
% can_follow(0,s,q,h,1,1).
% can_follow(3,c,k,h,2,4).
% can_follow(j,c,6,d,4,3).
% can_follow(2,c,k,h,2,5).
% can_follow(q,c,6,s,6,1).
% can_follow(a,d,2,s,1,1).
% can_follow(j,c,5,s,1,2).
% can_follow(q,d,0,h,2,5).
% can_follow(8,d,a,d,2,3).
% can_follow(a,d,2,d,4,5).
% can_follow(4,d,q,s,1,5).
% can_follow(4,c,q,c,2,3).
% can_follow(6,h,j,c,4,3).
% can_follow(k,d,0,c,1,4).
% can_follow(9,c,j,s,6,3).
% can_follow(2,h,a,h,2,3).
% can_follow(k,d,6,c,6,2).
% can_follow(a,d,0,h,5,6).
% can_follow(a,c,7,s,1,6).
% can_follow(j,c,0,c,3,3).
% can_follow(7,d,j,d,2,6).
% can_follow(5,d,j,c,6,5).
% can_follow(9,c,a,d,4,3).
% can_follow(7,d,a,c,4,5).
% can_follow(5,c,k,s,6,2).
% can_follow(5,h,j,c,6,1).
% can_follow(k,d,5,h,3,5).
% can_follow(q,d,3,s,2,2).
% can_follow(6,c,j,d,3,2).
% can_follow(8,s,k,d,4,2).
% can_follow(k,d,2,d,3,2).
% can_follow(a,s,4,s,5,6).
% can_follow(k,s,5,h,5,4).
% can_follow(a,c,7,s,4,4).
% can_follow(5,d,k,c,2,6).
% can_follow(q,h,2,d,2,5).
% can_follow(0,h,q,s,1,2).
% can_follow(8,s,q,h,5,6).
% can_follow(2,h,q,c,2,1).
% can_follow(j,s,4,s,1,6).
% can_follow(k,s,2,s,5,2).
% can_follow(a,h,7,c,4,1).
% can_follow(4,s,q,h,2,5).
% can_follow(2,s,q,d,1,1).
% can_follow(j,h,2,h,1,5).
% can_follow(0,c,a,h,3,5).
% can_follow(j,h,9,d,6,6).
% can_follow(6,h,k,c,6,4).
% can_follow(a,c,9,d,4,5).
% can_follow(j,s,6,s,3,3).
% can_follow(7,h,q,s,1,3).
% can_follow(6,h,j,c,2,6).
% can_follow(j,d,2,s,2,4).
% can_follow(j,d,6,s,2,6).
% can_follow(5,c,q,d,6,4).
% can_follow(j,h,6,d,6,1).
% can_follow(9,h,j,s,3,1).
% can_follow(7,d,q,h,3,6).
% can_follow(k,h,7,h,6,5).
% can_follow(9,c,q,c,6,4).
% can_follow(k,s,9,d,6,1).
% can_follow(9,c,j,c,4,4).
% can_follow(a,d,3,h,1,2).
% can_follow(2,s,j,c,6,4).
% can_follow(q,d,0,d,4,5).
% can_follow(9,c,k,h,4,6).
% can_follow(a,s,2,c,1,6).
% can_follow(6,d,a,h,2,6).
% can_follow(j,c,2,d,1,4).
% can_follow(q,h,4,h,4,3).
% can_follow(q,c,8,s,6,2).
% can_follow(0,h,j,c,1,1).
% can_follow(j,c,8,h,1,1).
% can_follow(5,h,a,s,1,6).
% can_follow(7,d,a,d,2,3).
% can_follow(5,s,q,d,4,5).
% can_follow(8,h,j,c,5,4).
% can_follow(k,d,4,h,6,1).
% can_follow(3,s,q,s,6,5).
% can_follow(a,s,8,s,3,3).
% can_follow(9,c,j,s,5,4).
% can_follow(j,h,7,c,6,2).
% can_follow(a,d,5,c,6,2).
% can_follow(k,c,0,d,6,4).
% can_follow(0,c,k,d,3,5).
% can_follow(j,s,9,d,1,3).
% can_follow(a,h,4,d,1,6).
% can_follow(2,h,j,c,1,2).
% can_follow(a,d,3,d,6,4).
% can_follow(k,c,0,s,6,2).
% can_follow(0,c,j,s,2,2).
% can_follow(k,c,5,d,5,2).
% can_follow(2,d,a,c,1,2).
% can_follow(j,s,3,c,4,4).
% can_follow(2,h,k,s,6,2).
% can_follow(q,s,6,d,1,1).
% can_follow(7,d,j,d,1,5).
% can_follow(3,d,q,h,2,5).
% can_follow(q,h,4,s,6,2).
% can_follow(6,c,q,h,5,2).
% can_follow(5,s,q,s,2,1).
% can_follow(k,d,9,c,2,4).
% can_follow(j,d,8,h,5,1).
% can_follow(2,d,a,c,3,6).
% can_follow(7,c,q,h,2,6).
% can_follow(5,c,j,h,5,5).
% can_follow(7,h,q,d,1,1).
% can_follow(6,c,a,h,5,4).
% can_follow(8,s,k,h,1,5).
% can_follow(3,c,j,d,3,4).
% can_follow(6,d,q,c,3,5).
% can_follow(6,s,q,d,1,6).
% can_follow(3,d,a,c,3,4).
% can_follow(7,c,j,s,6,5).
% can_follow(k,h,2,h,6,6).
% can_follow(k,s,4,h,6,1).
% can_follow(3,d,j,s,1,2).
% can_follow(j,h,4,c,5,4).
% can_follow(4,d,j,c,5,6).
% can_follow(k,c,8,s,5,3).
% can_follow(a,c,0,s,4,2).
% can_follow(q,h,0,h,1,1).
% can_follow(q,s,2,d,6,6).
% can_follow(7,h,j,d,5,2).
% can_follow(9,d,j,h,1,1).
% can_follow(q,h,2,d,1,2).
% can_follow(9,d,j,s,4,2).
% can_follow(q,d,5,s,6,2).
% can_follow(7,s,j,d,4,5).
% can_follow(0,s,j,d,2,3).
% can_follow(7,c,q,d,1,2).
% can_follow(q,h,3,c,4,1).
% can_follow(a,c,7,h,3,1).
% can_follow(2,c,k,h,3,5).
% can_follow(2,s,j,c,2,2).
% can_follow(9,c,j,s,5,4).
% can_follow(j,c,4,c,2,6).
% can_follow(0,h,j,d,3,3).
% can_follow(q,d,5,c,6,1).
% can_follow(6,c,q,c,6,4).
% can_follow(j,d,2,d,5,1).
% can_follow(j,c,8,c,2,1).
% can_follow(0,c,j,h,2,2).
% can_follow(q,c,8,s,2,4).
% can_follow(9,s,a,h,1,5).
% can_follow(8,s,q,d,3,6).
% can_follow(0,h,q,c,1,5).
% can_follow(a,c,9,h,6,5).
% can_follow(j,s,2,d,2,3).
% can_follow(k,d,7,s,6,5).
% can_follow(3,c,k,d,4,3).
% can_follow(k,d,4,c,1,1).
% can_follow(4,h,j,d,3,6).
% can_follow(2,d,q,s,5,4).
% can_follow(0,h,a,s,3,1).
% can_follow(0,s,k,d,6,2).
% can_follow(q,h,6,h,3,3).
% can_follow(a,h,9,h,1,2).
