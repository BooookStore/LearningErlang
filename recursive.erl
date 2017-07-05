-module(recursive).
-export([fac/1]).

%% 再帰呼出しを利用してNの階乗を求めます。
%% 「自分自身を呼び出している関数」が再帰を定義する方法の１つ。
fac(N) when N == 0 -> 1;
fac(N) when N > 0 -> N*fac(N-1).
