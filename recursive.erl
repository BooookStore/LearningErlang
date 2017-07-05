-module(recursive).
-export([fac/1,
  len/1,
  tail_fac/1,
  tail_len/1]).

%% 再帰呼出しを利用してNの階乗を求めます。
%% 「自分自身を呼び出している関数」が再帰を定義する方法の１つ。
fac(N) when N == 0 -> 1;
fac(N) when N > 0 -> N*fac(N-1).

%% 配列の長さを返す。
%% 処理は引数の配列要素数に対して比例し、オーダーNとなってしまう。
len([]) -> 0;
len([_|T]) -> 1 + len(T). % この計算を終わらせるためには、再帰呼出しの結果が必要になる。
                          % つまり、演算結果がスタックに溜まってしまう。

%% 末端再帰を利用してNの階乗を求めます。
%% 末端再帰なので、メモリの使用料は一定になる。
tail_fac(N) -> tail_fac(N,1).

tail_fac(0,Acc) -> Acc; %% Accはアキュムレータとも呼ばれ計算途中の値を保持する。
tail_fac(N,Acc) when N > 0 -> tail_fac(N-1,N*Acc).

%% 末端再帰を利用して配列の長さを求めます。
tail_len(L) -> tail_len(L,0).

tail_len([],Acc) -> Acc;
tail_len([_|T],Acc) -> tail_len(T,Acc + 1).
