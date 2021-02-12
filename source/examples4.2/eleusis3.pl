%%%%%%%%%%%%%%%%%%%%%%%%
% Eleusis parlour game 3. This is a guessing game involving cards and dice.
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

% can_follow(card, suit, card, suit, number, number)

% can_follow(A,B,C,D,E,F) :- nextsuit(B,D), lower(C,A).
% can_follow(A,B,C,D,E,F) :- nextsuit(D,B), lower(A,C).

can_follow(q,d,j,h,2,6).
can_follow(6,c,8,s,6,4).
can_follow(6,s,7,h,3,3).
can_follow(3,h,0,d,5,2).
can_follow(0,s,j,h,5,5).
can_follow(6,c,8,s,2,2).
can_follow(q,h,a,s,5,2).
can_follow(8,s,4,c,3,6).
can_follow(9,c,q,s,1,3).
can_follow(0,s,q,h,6,4).
can_follow(7,s,5,c,3,6).
can_follow(j,s,k,h,6,3).
can_follow(a,h,j,d,2,6).
can_follow(7,d,6,h,6,1).
can_follow(3,c,q,s,3,6).
can_follow(3,c,j,s,6,3).
can_follow(9,c,0,s,1,3).
can_follow(a,h,4,d,6,3).
can_follow(4,s,a,c,6,4).
can_follow(8,c,j,s,3,4).
can_follow(j,h,8,s,1,4).
can_follow(5,h,7,d,6,5).
can_follow(4,h,5,d,2,4).
can_follow(k,s,6,c,2,3).
can_follow(6,h,4,s,2,2).
can_follow(q,c,4,d,4,6).
can_follow(8,c,j,s,3,3).
can_follow(k,h,9,s,2,5).
can_follow(5,d,k,c,6,2).
can_follow(8,h,q,d,3,6).
can_follow(2,s,4,h,2,3).
can_follow(q,s,9,c,6,1).
can_follow(2,h,7,d,3,6).
can_follow(5,s,6,h,1,5).
can_follow(0,s,2,c,2,3).
can_follow(q,d,2,h,2,2).
can_follow(a,h,3,d,4,1).
can_follow(8,d,2,h,6,6).
can_follow(q,s,9,c,2,6).
can_follow(6,c,5,d,2,1).
