%%%%%%%%%%%%%%%%%%%%
% Grammar learning problem. Learns s/2, a simple English language
%	phrase grammar.

:- modeh(1,s(+wlist,-wlist1))?
:- modeb(1,det(+wlist,-wlist))?
:- modeb(1,prep(+wlist,-wlist))?
:- modeb(1,noun(+wlist,-wlist))?
:- modeb(1,tverb(+wlist,-wlist))?
:- modeb(1,iverb(+wlist,-wlist))?
:- modeb(*,np(+wlist,-wlist))?
:- modeb(*,vp(+wlist,-wlist))?
:- set(i,5)?
:- set(c,5)?
:- set(h,10000000)?
:- set(posonly)?

%%%%%%%%%%%%%%%%%%%%
% Types

wlist([]).
wlist([W|Ws]) :- word(W), wlist(Ws).

wlist1([]).

word(a).  word(at).  word(ball). word(big).  word(dog). word(every).
word(happy).  word(hits).  word(house).  word(in).  word(man). word(nice).
word(on). word(small).  word(takes).  word(the).  word(to).  word(walks).

:- [wpair]?

%%%%%%%%%%%%%%%%%%%%%%%
% Background knowledge

np(S1,S2) :- det(S1,S3), noun(S3,S2).
np(S1,S2) :- det(S1,S3), adj(S3,S4), noun(S4,S2).

det([a|S],S).
det([the|S],S).
det([every|S],S).

vp(S1,S2) :- tverb(S1,S2).
vp(S1,S2) :- tverb(S1,S3), prep(S3,S2).

noun([man|S],S).
noun([dog|S],S).
noun([house|S],S).
noun([ball|S],S).

tverb([hits|S],S).
tverb([takes|S],S).
tverb([walks|S],S).

iverb([barks|S],S).
iverb([hits|S],S).
iverb([takes|S],S).
iverb([walks|S],S).

prep([at|S],S).
prep([to|S],S).
prep([on|S],S).
prep([in|S],S).
prep([from|S],S).

adj([big|S],S).
adj([small|S],S).
adj([nice|S],S).
adj([happy|S],S).

%%%%%%%%%%%%%%%%%%%%
% Positive examples


% More complex positive examples.

s([a,man,hits,the,ball,at,the,dog],[]).
s([the,man,hits,the,ball,at,the,house],[]).
s([the,man,takes,the,dog,to,the,ball],[]).
s([a,man,takes,the,ball,to,the,house],[]).
s([the,dog,takes,the,ball,to,the,house],[]).
s([the,dog,takes,the,ball,to,the,man],[]).
s([the,man,hits,the,ball,to,the,dog],[]).
s([the,man,walks,the,dog,to,the,house],[]).

s([the,man,walks,the,dog],[]).
s([the,dog,walks,to,the,man],[]).
s([a,dog,hits,a,ball],[]).
s([the,man,walks,in,the,house],[]).
s([the,man,hits,the,dog],[]).
s([a,ball,hits,the,dog],[]).

s([the,man,walks],[]).
s([a,ball,hits],[]).
s([every,ball,hits],[]).
s([every,dog,walks],[]).
s([every,man,walks],[]).
s([a,man,walks],[]).
s([a,small,man,walks],[]).
s([every,nice,dog,barks],[]).
