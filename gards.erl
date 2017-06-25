-module(gards).

-export([old_enough/1]).

%% ガード条件を使用
old_enough(X) when X >= 16, X =< 104 -> true;
old_enough(_) -> false.
