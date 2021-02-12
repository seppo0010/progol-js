%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Progol4.4 demonstration example file.
% 
% Invented predicate from invrev.pl (equivalent to append1/3).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mode declarations

:- modeh(1,defn(#pn,[+list,+r,+list]))?
:- modeb(1,(+list= #list))?
:- modeb(1,(+list= [-r|-list]))?
:- modeb(1,defn(#pn,[+list,+r,+list]))?
:- set(posonly)?
:- unset(cover)?	% Learning recursive theories requires full implication
			% testing rather than cover testing.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Type definitions

list([]).
list([H|T]) :- r(H), list(T).

r(X) :- uniform(X,0,4).

pn(q1).

% Examples derived from reverse/2 in invrev.pl

defn(q1,[[],4,[4]]).
defn(q1,[[],3,[3]]).
defn(q1,[[],2,[2]]).
defn(q1,[[],1,[1]]).
defn(q1,[[3,2],1,[3,2,1]]).
defn(q1,[[2,1],0,[2,1,0]]).
defn(q1,[[4],2,[4,2]]).
defn(q1,[[4],1,[4,1]]).
defn(q1,[[3],2,[3,2]]).
defn(q1,[[3],1,[3,1]]).
defn(q1,[[2],2,[2,2]]).
defn(q1,[[2],1,[2,1]]).
defn(q1,[[2,3],1,[3,2,1]]).
defn(q1,[[1,2],0,[2,1,0]]).
