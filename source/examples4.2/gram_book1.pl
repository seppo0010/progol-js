%%%%%%%%%%%%%%%%%%%%
% Grammar learning problem: attempt to learn a grammar for Book 1 of
% Ladybird's "Read with me" series.

:- modeh(1,s(+wlist,-wlist1))?
:- modeb(1,det(+wlist,-wlist))?
:- modeb(1,prep(+wlist,-wlist))?
:- modeb(1,noun(+wlist,-wlist))?
:- modeb(1,tverb(+wlist,-wlist))?
:- modeb(1,iverb(+wlist,-wlist))?
:- modeb(1,adj(+wlist,-wlist))?
:- modeb(1,adv(+wlist,-wlist))?
:- modeb(1,pron(+wlist,-wlist))?
:- modeb(1,conj(+wlist,-wlist))?
:- modeb(1,snp(+wlist,-wlist))?
:- modeb(1,propname(+wlist,-wlist))?
:- modeb(*,np(+wlist,-wlist))?
:- modeb(*,vp(+wlist,-wlist))?
:- modeb(*,s(+wlist,-wlist1))?
:- set(i,3)?
:- set(c,3)?
:- set(h,50)?
:- set(posonly)?

%%%%%%%%%%%%%%%%%%%%
% Types

wlist([]).
wlist([W|Rest]) :- word(W), wlist(Rest).

wlist1([]).

word(tom).  word(kate).  word(here). word(is).  word(sam). word(a).
word(dog).  word(and).  word(no).  word(in).  word(the). word(likes).
word(i). word(shop).  word(toy).  word(has).  word(ball).  word(tree).
word(like).

%%%%%%%%%%%%%%%%%%%%%%%
% Background knowledge

np(S1,S2) :- snp(S1,S2).
np(S1,S2) :- det(S1,S3), noun(S3,S2).
np(S1,S2) :- adjp(S1,S3), noun(S3,S2).
np(S1,S2) :- det(S1,S3), adjp(S3,S4), noun(S4,S2).
np(S1,S2) :- snp(S1,S3), conj(S3,S4), snp(S4,S2).

snp(S1,S2) :- noun(S1,S2).
snp(S1,S2) :- pron(S1,S2).
snp(S1,S2) :- propname(S1,S2).

det([a|S],S).
det([the|S],S).

vp(S1,S2) :- avp(S1,S2).
vp(S1,S2) :- avp(S1,S3), prep(S3,S2).

avp(S1,S2) :- tverb(S1,S2).
avp(S1,S2) :- tverb(S1,S3), adv(S3,S2).
avp(S1,S2) :- adv(S1,S3), tverb(S3,S2).

adjp(S1,S2) :- adj(S1,S2).
adjp(S1,S2) :- adv(S1,S3), adj(S3,S2).
adjp(S1,S2) :- adj(S1,S3), adj(S3,S2).

propname([tom|S],S).
propname([kate|S],S).
propname([sam|S],S).

noun([dog|S],S).
noun([shop|S],S).
noun([toy|S],S).
noun([ball|S],S).
noun([tree|S],S).
noun([here|S],S).

adj([no|S],S).
adj(S1,S2) :- noun(S1,S2).

pron([i|S],S).

tverb([like|S],S).
tverb([likes|S],S).
tverb([has|S],S).
tverb([is|S],S).

prep([in|S],S).

conj([and|S],S).


%%%%%%%%%%%%%%%%%%%%
% Positive examples

s([here,is,kate],[]).
s([here,is,tom],[]).
s([here,is,sam],[]).
s([sam,is,a,dog],[]).
s([here,is,kate,and,here,is,sam],[]).
s([no,no],[]).
s([tom,is,in,here,and,sam,is,in,here],[]).
s([kate,likes,the,dog,and,tom,likes,the,dog],[]).
s([sam,likes,tom,and,sam,likes,kate],[]).
s([no,sam,no],[]).
s([i,like,tom],[]).
s([i,like,kate],[]).
s([i,like,the,dog],[]).
s([here,is,tom,and,here,is,kate],[]).
s([no,sam,no],[]).
s([the,dog,is,in,the,shop],[]).
s([tom,is,in,the,toy,shop],[]).
s([kate,is,in,the,toy,shop],[]).
s([sam,is,in,the,toy,shop],[]).
s([sam,has,a,toy],[]).
s([sam,likes,the,toy],[]).
s([no,sam,no],[]).
s([kate,and,tom,like,the,ball],[]).
s([sam,likes,the,ball],[]).
s([the,dog,has,the,ball],[]).
s([the,dog,likes,the,ball],[]).
s([here,is,a,tree],[]).
s([the,ball,is,in,the,tree,and,tom,is,in,the,tree],[]).
s([tom,has,the,ball],[]).
s([tom,and,kate,like,the,ball],[]).
s([sam,has,the,ball],[]).
s([no,sam,no],[]).
s([sam,has,no,toy],[]).
s([sam,has,the,toy],[]).
s([sam,likes,the,toy],[]).
s([i,like,kate,and,i,like,tom,and,i,like,sam],[]).
