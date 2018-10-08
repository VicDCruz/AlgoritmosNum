n = 10;
format('RAT')
tk = (2 * (0:n-1) + 1) / (2 * n);
format('LONG')
sum(cos(tk*pi)); % DA 0
%% Con 2pi
r = 2;
format('RAT')
r * tk;
%% Con 3pi
r = 3;
format('RAT')
r * tk