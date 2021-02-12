% Qualitative regression using logs. Regression here is for polynomial function.
% The underlying function is
%
%	y=2x^2+3
%
% This is learned as
%
%	log(2)-delta <= loglog(y)-loglog(x) <= log(2)+delta

:- [order]?

f(4.0,35.0).
f(8.0,131.0).
f(7.0,101.0).
f(6.0,75.0).
f(5.0,53.0).
f(3.0,21.0).
f(2.0,11.0).
f(1.0,5.0).
