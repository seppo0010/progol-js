:- randomseed?
:- set(h,1000000)?

% testset(File,P/A,N) - randomly generates a size N testset of predicate
%	P/A in File. Done by using generator predicate (eg. '*class'/2)
%	stochastically and testing on P (eg. class/2).

testset(File,P/A,N) :-
	getname(P,P1),
	sample(P1/A,N,S),
	tell(File),
	testclass(S,P),
	told.

testclass(S,P) :-
	element(A1,S),
	A1=..[_|Args],
	A=..[P|Args],
	dotest(A), write(A), write('.'), nl,
	fail.
testclass(_,_).

dotest(Atom) :- Atom, !.
dotest(_) :- write(':- ').

getname(P,P1) :-
	name('*',[Star]),
	name(P,Pname),
	name(P1,[Star|Pname]), !.

% posonly(File,P/A,N) - randomly generates a size N testset by stochastically
%	executing predicate P/A and writing results to File.

posonly(File,P/A,N) :-
	sample(P/A,N,S),
	tell(File),
	writeout(S),
	told.

writeout(S) :-
	element(A,S),
	write(A), write('.'), nl, fail.
writeout(_).

writes([]).
writes([H|T]) :- write1(H), writes(T), !.

write1(nl) :- nl.
write1(tab(N)) :- tab(N).
write1(X) :- write(X).

append([],L,L).
append([H|T],L,[H|T1]) :- append(T,L,T1).

mksh(Root,Size) :-
	name(Root,Rlist),
	name(Size,Slist),
	append(Rlist,Slist,Shlist),
	name(ShFile,Shlist),
	tell(ShFile),
	Size5 is 5*Size,
	writes([head,' -',Size5,' ',Root,'.pos > ',Root,Size,'.pos',nl]),
	writes([split,' -',Size,' ',Root,Size,'.pos',nl]),
	told.
