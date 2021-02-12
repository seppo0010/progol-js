:- set(posonly)?
:- set(c,2)?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% class/2 learns the class (mammal/fish/reptile/bird) of various animals.
%	This has been extended due to a suggestion by James Cussens
%	on the use of probailistic information (see use of prob/4).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mode declarations

:- modeh(1,class(+animal,#class))?
:- modeb(1,has_gills(+animal))?
:- modeb(1,has_covering(+animal,#covering))?
:- modeb(1,has_legs(+animal,#nat))?
:- modeb(1,homeothermic(+animal))?
:- modeb(1,has_eggs(+animal))?
%:- modeb(1,not has_milk(+animal))?
:- modeb(1,not(has_gills(+animal)))?
:- modeb(1,nhas_gills(+animal))?
:- modeb(*,habitat(+animal,#habitat))?
:- modeb(1,has_milk(+animal))?
:- modeh(1,false)?
:- modeb(1,class(+animal,#class))?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Types

animal(dog).  animal(dolphin).  animal(platypus).  animal(bat).
animal(trout).  animal(herring).  animal(shark). animal(eel).
animal(lizard).  animal(crocodile).  animal(t_rex).  animal(turtle).
animal(snake).  animal(eagle).  animal(ostrich).  animal(penguin).

class(mammal).  class(fish).  class(reptile).  class(bird).

covering(hair).  covering(none).  covering(scales).  covering(feathers).

habitat(land).  habitat(water).  habitat(air).  habitat(caves).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Positive examples

class(eagle,bird).
class(bat,mammal).
class(dog,mammal).
class(bat,mammal).
class(eagle,bird).
class(ostrich,bird).
class(shark,fish).
class(crocodile,reptile).
class(bat,mammal).
class(shark,fish).
class(penguin,bird).
class(shark,fish).
class(crocodile,reptile).
class(crocodile,reptile).
class(shark,fish).
class(dog,mammal).
class(snake,reptile).
class(platypus,mammal).
class(t_rex,reptile).
class(crocodile,reptile).
% class(eagle,bird).
% class(shark,fish).
% class(t_rex,reptile).
% class(lizard,reptile).
% class(trout,fish).
% class(dolphin,mammal).
% class(eagle,bird).
% class(eagle,bird).
% class(dog,mammal).
% class(crocodile,reptile).
% class(cat,mammal).
% class(snake,reptile).
% class(eagle,bird).
% class(turtle,reptile).
% class(turtle,reptile).
% class(crocodile,reptile).
% class(eagle,bird).
% class(t_rex,reptile).
% class(shark,fish).
% class(crocodile,reptile).
% class(trout,fish).
% class(penguin,bird).
% class(bat,mammal).
% class(turtle,reptile).
% class(shark,fish).
% class(platypus,mammal).
% class(bat,mammal).
% class(shark,fish).
% class(eel,fish).
% class(eagle,bird).
% class(snake,reptile).
% class(ostrich,bird).
% class(ostrich,bird).
% class(turtle,reptile).
% class(ostrich,bird).
% class(snake,reptile).
% class(cat,mammal).
% class(snake,reptile).
% class(ostrich,bird).
% class(ostrich,bird).
% class(shark,fish).
% class(t_rex,reptile).
% class(t_rex,reptile).
% class(shark,fish).
% class(cat,mammal).
% class(eagle,bird).
% class(cat,mammal).
% class(lizard,reptile).
% class(eel,fish).
% class(herring,fish).
% class(eagle,bird).
% class(dolphin,mammal).
% class(t_rex,reptile).
% class(cat,mammal).
% class(cat,mammal).
% class(platypus,mammal).
% class(eel,fish).
% class(cat,mammal).
% class(trout,fish).
% class(penguin,bird).
% class(dolphin,mammal).
% class(platypus,mammal).
% class(herring,fish).
% class(penguin,bird).
% class(shark,fish).
% class(bat,mammal).
% class(herring,fish).
% class(trout,fish).
% class(lizard,reptile).
% class(dolphin,mammal).
% class(platypus,mammal).
% class(shark,fish).
% class(lizard,reptile).
% class(trout,fish).
% class(eagle,bird).
% class(herring,fish).
% class(bat,mammal).
% class(snake,reptile).
% class(herring,fish).
% class(snake,reptile).
% class(dog,mammal).
% class(herring,fish).
% class(eagle,bird).
% class(eel,fish).
% class(dog,mammal).
% class(eel,fish).
% class(lizard,reptile).
% class(cat,mammal).
% class(crocodile,reptile).
% class(t_rex,reptile).
% class(snake,reptile).
% class(snake,reptile).
% class(eagle,bird).
% class(shark,fish).
% class(herring,fish).
% class(t_rex,reptile).
% class(dolphin,mammal).
% class(t_rex,reptile).
% class(shark,fish).
% class(cat,mammal).
% class(ostrich,bird).
% class(turtle,reptile).
% class(eagle,bird).
% class(platypus,mammal).
% class(eagle,bird).
% class(turtle,reptile).
% class(platypus,mammal).
% class(cat,mammal).
% class(dolphin,mammal).
% class(shark,fish).
% class(cat,mammal).
% class(ostrich,bird).
% class(eagle,bird).
% class(dog,mammal).
% class(cat,mammal).
% class(shark,fish).
% class(lizard,reptile).
% class(penguin,bird).
% class(platypus,mammal).
% class(cat,mammal).
% class(platypus,mammal).
% class(dolphin,mammal).
% class(bat,mammal).
% class(dog,mammal).
% class(ostrich,bird).
% class(lizard,reptile).
% class(penguin,bird).
% class(ostrich,bird).
% class(lizard,reptile).
% class(herring,fish).
% class(penguin,bird).
% class(lizard,reptile).
% class(platypus,mammal).
% class(dog,mammal).
% class(turtle,reptile).
% class(eagle,bird).
% class(penguin,bird).
% class(snake,reptile).
% class(dolphin,mammal).
% class(shark,fish).
% class(cat,mammal).
% class(shark,fish).
% class(lizard,reptile).
% class(trout,fish).
% class(lizard,reptile).
% class(herring,fish).
% class(snake,reptile).
% class(shark,fish).
% class(bat,mammal).
% class(dolphin,mammal).
% class(turtle,reptile).
% class(trout,fish).
% class(ostrich,bird).
% class(eel,fish).
% class(bat,mammal).
% class(crocodile,reptile).
% class(trout,fish).
% class(penguin,bird).
% class(t_rex,reptile).
% class(penguin,bird).
% class(t_rex,reptile).
% class(ostrich,bird).
% class(bat,mammal).
% class(platypus,mammal).
% class(turtle,reptile).
% class(crocodile,reptile).
% class(crocodile,reptile).
% class(herring,fish).
% class(shark,fish).
% class(dog,mammal).
% class(bat,mammal).
% class(herring,fish).
% class(crocodile,reptile).
% class(turtle,reptile).
% class(cat,mammal).
% class(bat,mammal).
% class(eagle,bird).
% class(penguin,bird).
% class(cat,mammal).
% class(penguin,bird).
% class(trout,fish).
% class(dolphin,mammal).
% class(cat,mammal).
% class(turtle,reptile).
% class(penguin,bird).
% class(dog,mammal).
% class(bat,mammal).
% class(trout,fish).
% class(crocodile,reptile).
% class(ostrich,bird).
% class(turtle,reptile).
% class(eagle,bird).
% class(platypus,mammal).
% class(crocodile,reptile).
% class(platypus,mammal).
% class(penguin,bird).
% class(shark,fish).
% class(cat,mammal).
% class(shark,fish).
% class(ostrich,bird).
% class(dolphin,mammal).
% class(herring,fish).
% class(lizard,reptile).
% class(ostrich,bird).
% class(crocodile,reptile).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Background knowledge

has_covering(dog,hair).
has_covering(dolphin,none).
has_covering(platypus,hair).
has_covering(bat,hair).
has_covering(trout,scales).
has_covering(herring,scales).
has_covering(shark,none).
has_covering(eel,none).
has_covering(lizard,scales).
has_covering(crocodile,scales).
has_covering(t_rex,scales).
has_covering(snake,scales).
has_covering(turtle,scales).
has_covering(eagle,feathers).
has_covering(ostrich,feathers).
has_covering(penguin,feathers).

has_legs(dog,4).
has_legs(dolphin,0).
has_legs(platypus,2).
has_legs(bat,2).
has_legs(trout,0).
has_legs(herring,0).
has_legs(shark,0).
has_legs(eel,0).
has_legs(lizard,4).
has_legs(crocodile,4).
has_legs(t_rex,4).
has_legs(snake,0).
has_legs(turtle,4).
has_legs(eagle,2).
has_legs(ostrich,2).
has_legs(penguin,2).

has_milk(dog).
has_milk(dolphin).
has_milk(bat).
has_milk(platypus).


homeothermic(dog).
homeothermic(dolphin).
homeothermic(platypus).
homeothermic(bat).
homeothermic(eagle).
homeothermic(ostrich).
homeothermic(penguin).


habitat(dog,land).
habitat(dolphin,water).
habitat(platypus,water).
habitat(bat,air).
habitat(bat,caves).
habitat(trout,water).
habitat(herring,water).
habitat(shark,water).
habitat(eel,water).
habitat(lizard,land).
habitat(crocodile,water).
habitat(crocodile,land).
habitat(t_rex,land).
habitat(snake,land).
habitat(turtle,water).
habitat(eagle,air).
habitat(eagle,land).
habitat(ostrich,land).
habitat(penguin,water).

has_eggs(platypus).
has_eggs(trout).
has_eggs(herring).
has_eggs(shark).
has_eggs(eel).
has_eggs(lizard).
has_eggs(crocodile).
has_eggs(t_rex).
has_eggs(snake).
has_eggs(turtle).
has_eggs(eagle).
has_eggs(ostrich).
has_eggs(penguin).

has_gills(trout).
has_gills(herring).
has_gills(shark).
has_gills(eel).

nhas_gills(X) :- animal(X), not(has_gills(X)).

%%%%%%%%%%%%%%%%%%%%%%
% Definition of conditional probability.
%
% prob(Var,Pred,Cond,Prob)
%
% is true if Prob is the probability that Var satisfies
% Pred given that it satifies Cond.


prob(Var,Pred,Cond,undefined) :-
	not(Cond).

prob(Var,Pred,Cond,Prob) :-
	num(Var,(Pred,Cond),Int1),
	num(Var,Cond,Int2),
	Prob is (Int1+0.0)/(Int2+0.0).

num(Var,Pred,Num) :-
	setof(Var,Pred,L),
	length(L,Num).

% we can state P(mammal|animal) \in [0.1,0.2], as follows:

% :- prob(X,class(X,mammal),animal(X),P), (P<0.1 ; P>0.2).

animal(cat). animal(dragon).

animal(girl).
animal(boy).

has_milk(cat).
homeothermic(cat).

% :- [query]?
