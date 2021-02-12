%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Learning aunt_of from parent_of and sister_of.

% Settings

:- set(posonly)?

% Mode declarations

:- modeh(1,aunt_of(+person,+person))?
:- modeb(*,parent_of(-person,+person))?
:- modeb(*,parent_of(+person,-person))?
:- modeb(*,sister_of(+person,-person))?

% Types

person(jane).
person(henry).
person(sally).
person(jim).
person(sam).
person(sarah).
person(judy).

% Background knowledge

parent_of(Parent,Child) :- father_of(Parent,Child).
parent_of(Parent,Child) :- mother_of(Parent,Child).

father_of(sam,henry).

mother_of(sarah,jim).

sister_of(jane,sam).
sister_of(sally,sarah).
sister_of(judy,sarah).

% Examples

aunt_of(jane,henry).
aunt_of(sally,jim).
aunt_of(judy,jim).
