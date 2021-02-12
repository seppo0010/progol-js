%%%%%%%%%%%%%%%%%%%%%%
% Family relationships example. This involves learning both
%	parent and grandfather. Owing to the fact that grandfather
%	is defined in terms of parent, the order in which these
%	predicates are learned is important.
%	Try generalising grandfather before parent.

:- set(i,2), set(c,2)?
:- set(posonly)?
:- set(condition)?
:- modeh(1,parent_of(+person,-person))?
:- modeh(1,grandfather_of(+person,-person))?
:- modeh(1,grandparent_of(+person,-person))?
:- modeb(*,father_of(+person,-person))?
:- modeb(*,mother_of(+person,-person))?
:- modeb(*,parent_of(+person,-person))?
:- op(40,xfx,father_of)?
:- op(40,xfx,mother_of)?
:- op(40,xfx,grandfather_of)?
:- op(40,xfx,grandparent_of)?
:- op(40,xfx,parent_of)?
:- determination(grandfather_of/2,parent_of/2)?
:- determination(grandfather_of/2,mother_of/2)?
:- determination(grandfather_of/2,father_of/2)?
:- determination(grandparent_of/2,parent_of/2)?
:- determination(grandparent_of/2,mother_of/2)?
:- determination(grandparent_of/2,parent_of/2)?
:- determination(parent_of/2,father_of/2)?
:- determination(parent_of/2,mother_of/2)?

%%%%%%%%%%%%%%%%%%%%%%
% Type information

person(andrew).  person(bernard).  person(cathleen).  person(daphne).
person(edith).  person(fred).  person(george).  person(john).
person(louis).  person(oscar).  person(paul).  person(robert).
person(stephen).  person(sylvia).  person(william). person(ada).


%%%%%%%%%%%%%%%%%%%%%%
% Background knowledge

william father_of sylvia.
oscar father_of louis.
oscar father_of daphne.
oscar father_of cathleen.
oscar father_of fred.
oscar father_of bernard.
louis father_of stephen.
louis father_of andrew.
louis father_of robert.
louis father_of john.
george father_of oscar.
paul father_of edith.

sylvia mother_of stephen.
sylvia mother_of andrew.
sylvia mother_of robert.
sylvia mother_of john.
edith mother_of louis.
edith mother_of daphne.
edith mother_of cathleen.
edith mother_of fred.
edith mother_of bernard.
ada mother_of sylvia.

%%%%%%%%%%%%%%%%%%%%%%
% Positive examples

louis parent_of stephen.
oscar parent_of daphne.
sylvia parent_of robert.
louis parent_of andrew.
ada parent_of sylvia.
oscar parent_of bernard.
sylvia parent_of john.
edith parent_of fred.
sylvia parent_of stephen.
ada parent_of sylvia.
william parent_of sylvia.
oscar parent_of cathleen.
edith parent_of bernard.
louis parent_of stephen.
oscar parent_of daphne.
sylvia parent_of stephen.
edith parent_of louis.
oscar parent_of louis.
william parent_of sylvia.
edith parent_of daphne.
sylvia parent_of robert.
sylvia parent_of john.
edith parent_of bernard.
edith parent_of bernard.
william parent_of sylvia.
sylvia parent_of john.
edith parent_of cathleen.
louis parent_of john.
edith parent_of louis.
sylvia parent_of john.
louis parent_of robert.
oscar parent_of bernard.
louis parent_of john.
edith parent_of fred.
louis parent_of andrew.
george parent_of oscar.
edith parent_of bernard.
sylvia parent_of robert.
louis parent_of john.
oscar parent_of fred.
edith parent_of bernard.
oscar parent_of fred.
sylvia parent_of stephen.
edith parent_of daphne.
oscar parent_of bernard.
louis parent_of john.
sylvia parent_of stephen.
ada parent_of sylvia.
louis parent_of john.
sylvia parent_of robert.
oscar parent_of bernard.
edith parent_of louis.
sylvia parent_of andrew.
louis parent_of andrew.
william parent_of sylvia.
edith parent_of cathleen.
ada parent_of sylvia.
louis parent_of andrew.
george parent_of oscar.
edith parent_of daphne.
sylvia parent_of robert.
sylvia parent_of stephen.
oscar parent_of bernard.
edith parent_of daphne.
louis parent_of stephen.
louis parent_of john.
edith parent_of fred.
sylvia parent_of stephen.
sylvia parent_of john.
edith parent_of cathleen.
paul parent_of edith.
oscar parent_of bernard.
paul parent_of edith.
oscar parent_of bernard.
paul parent_of edith.
george parent_of oscar.
oscar parent_of daphne.
sylvia parent_of stephen.
louis parent_of john.
sylvia parent_of andrew.
louis parent_of robert.
edith parent_of daphne.
william parent_of sylvia.
william parent_of sylvia.
louis parent_of andrew.
oscar parent_of cathleen.
louis parent_of andrew.
edith parent_of louis.
edith parent_of fred.
louis parent_of andrew.
edith parent_of louis.
ada parent_of sylvia.
louis parent_of andrew.
oscar parent_of louis.
sylvia parent_of robert.
sylvia parent_of john.
edith parent_of cathleen.
ada parent_of sylvia.
sylvia parent_of john.
ada parent_of sylvia.

william grandfather_of robert.
george grandfather_of louis.
william grandfather_of stephen.
william grandfather_of andrew.
paul grandfather_of fred.
george grandfather_of bernard.
george grandfather_of bernard.
william grandfather_of john.
oscar grandfather_of john.
george grandfather_of bernard.
william grandfather_of john.
paul grandfather_of louis.
william grandfather_of andrew.
paul grandfather_of cathleen.
william grandfather_of john.
paul grandfather_of louis.
george grandfather_of cathleen.
george grandfather_of louis.
william grandfather_of john.
george grandfather_of louis.
oscar grandfather_of andrew.
george grandfather_of cathleen.
paul grandfather_of bernard.
george grandfather_of louis.
william grandfather_of john.
paul grandfather_of daphne.
paul grandfather_of daphne.
william grandfather_of andrew.
paul grandfather_of daphne.
william grandfather_of stephen.
oscar grandfather_of stephen.
paul grandfather_of daphne.
william grandfather_of stephen.
paul grandfather_of daphne.
paul grandfather_of daphne.
paul grandfather_of cathleen.
william grandfather_of stephen.
oscar grandfather_of stephen.
oscar grandfather_of andrew.
george grandfather_of daphne.
oscar grandfather_of andrew.
william grandfather_of robert.
paul grandfather_of daphne.
george grandfather_of cathleen.
george grandfather_of cathleen.
william grandfather_of robert.
paul grandfather_of daphne.
william grandfather_of robert.
george grandfather_of daphne.
george grandfather_of louis.
george grandfather_of fred.
paul grandfather_of daphne.
paul grandfather_of daphne.
george grandfather_of fred.
george grandfather_of cathleen.
oscar grandfather_of andrew.
william grandfather_of john.
paul grandfather_of bernard.
paul grandfather_of louis.
paul grandfather_of cathleen.
william grandfather_of robert.
george grandfather_of fred.
paul grandfather_of daphne.
george grandfather_of daphne.
william grandfather_of andrew.
paul grandfather_of daphne.
paul grandfather_of cathleen.
william grandfather_of andrew.
george grandfather_of louis.
william grandfather_of andrew.
oscar grandfather_of john.
paul grandfather_of fred.
paul grandfather_of bernard.
oscar grandfather_of andrew.
paul grandfather_of daphne.
george grandfather_of louis.
william grandfather_of john.
paul grandfather_of fred.
paul grandfather_of fred.
william grandfather_of andrew.
oscar grandfather_of stephen.
george grandfather_of fred.

william grandparent_of andrew.
george grandparent_of daphne.
oscar grandparent_of stephen.
william grandparent_of john.
ada grandparent_of robert.
george grandparent_of bernard.
ada grandparent_of robert.
edith grandparent_of john.
ada grandparent_of stephen.
edith grandparent_of robert.
william grandparent_of stephen.
william grandparent_of john.
oscar grandparent_of robert.
george grandparent_of cathleen.
edith grandparent_of robert.
paul grandparent_of daphne.
george grandparent_of fred.
paul grandparent_of cathleen.
william grandparent_of andrew.
paul grandparent_of fred.
william grandparent_of stephen.
edith grandparent_of andrew.
edith grandparent_of stephen.
oscar grandparent_of john.
paul grandparent_of cathleen.
paul grandparent_of fred.
oscar grandparent_of stephen.
william grandparent_of john.
ada grandparent_of john.
oscar grandparent_of robert.
ada grandparent_of john.
edith grandparent_of john.
george grandparent_of bernard.
oscar grandparent_of stephen.
george grandparent_of fred.
edith grandparent_of stephen.
george grandparent_of fred.
oscar grandparent_of stephen.
edith grandparent_of john.
george grandparent_of fred.
edith grandparent_of andrew.
paul grandparent_of bernard.
william grandparent_of andrew.
oscar grandparent_of andrew.
paul grandparent_of daphne.
paul grandparent_of louis.
paul grandparent_of fred.
edith grandparent_of john.
george grandparent_of bernard.
paul grandparent_of daphne.
george grandparent_of fred.
william grandparent_of andrew.
oscar grandparent_of john.
paul grandparent_of fred.
edith grandparent_of stephen.
oscar grandparent_of andrew.
ada grandparent_of robert.
paul grandparent_of louis.
ada grandparent_of john.
edith grandparent_of robert.
william grandparent_of robert.
edith grandparent_of stephen.
paul grandparent_of daphne.
oscar grandparent_of john.
george grandparent_of bernard.
ada grandparent_of andrew.
paul grandparent_of daphne.
william grandparent_of andrew.
edith grandparent_of stephen.
paul grandparent_of fred.
paul grandparent_of fred.
paul grandparent_of cathleen.
william grandparent_of robert.
george grandparent_of cathleen.
george grandparent_of fred.
george grandparent_of louis.
william grandparent_of john.
paul grandparent_of fred.
george grandparent_of fred.
edith grandparent_of john.
william grandparent_of robert.
oscar grandparent_of stephen.
ada grandparent_of stephen.
paul grandparent_of louis.
paul grandparent_of bernard.
william grandparent_of andrew.
paul grandparent_of cathleen.
william grandparent_of john.
oscar grandparent_of andrew.
ada grandparent_of robert.
william grandparent_of andrew.
oscar grandparent_of andrew.
paul grandparent_of fred.
george grandparent_of cathleen.
oscar grandparent_of john.
ada grandparent_of andrew.
george grandparent_of bernard.
george grandparent_of daphne.
edith grandparent_of robert.
oscar grandparent_of stephen.
paul grandparent_of bernard.
ada grandparent_of john.
william grandparent_of andrew.
george grandparent_of cathleen.
oscar grandparent_of robert.
