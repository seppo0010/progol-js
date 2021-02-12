%%%%%%%%%%%%%%%%%%%%%%%%
% Eleusis parlour game. This is a guessing game involving cards and dice.
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

:- modeh(1,can_follow(+card,+suit,+card,+suit,+die,+die))?
:- modeb(1,nextsuit(+suit,+suit))?
:- modeb(1,nextcard(+card,+card))?
:- modeb(1,face(+card))?
:- modeb(1,not face(+card))?
:- modeb(1,odd(+card))?
:- modeb(1,odd(+die))?
:- modeb(1,samecolour(+suit,+suit))?
:- modeb(1,lower(+card,+card))?

:- set(posonly), set(c,1), set(i,1)?

% Types

card(a).  card(2).  card(3).  card(4).  card(5).  card(6).  card(7).
card(8).  card(9).  card(0).  card(j).  card(q).  card(k).

suit(c). suit(d). suit(h). suit(s).

die(1).  die(2).  die(3).  die(4).  die(5).  die(6).

% Background knowledge

mapcard(a,1).
mapcard(2,2).
mapcard(3,3).
mapcard(4,4).
mapcard(5,5).
mapcard(6,6).
mapcard(7,7).
mapcard(8,8).
mapcard(9,9).
mapcard(0,10).
mapcard(j,11).
mapcard(q,12).
mapcard(k,13).

% nextsuit(suit, suit)
nextsuit(s,c).
nextsuit(c,d).
nextsuit(d,h).
nextsuit(h,s).

% nextcard(card, card)
nextcard(a,2).
nextcard(2,3).
nextcard(3,4).
nextcard(4,5).
nextcard(5,6).
nextcard(6,7).
nextcard(7,8).
nextcard(8,9).
nextcard(9,0).
nextcard(0,j).
nextcard(j,q).
nextcard(q,k).

% face(card)
face(a).
face(k).
face(q).
face(j).

% odd(card/die)
odd(a).
odd(1).
odd(3).
odd(5).
odd(7).
odd(9).
odd(j).
odd(k).

% samecolour(suit, suit)
samecolour(S,S).
samecolour(d,h).
samecolour(h,d).
samecolour(c,s).
samecolour(s,c).

% lower(card, card)

lower(C1,C2) :- mapcard(C1,N1), mapcard(C2,N2), N1<N2.
