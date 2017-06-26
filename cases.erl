-module(cases).
-export([insert/2,
  beach/1,
  beachf/1]).

%%% case文について

%% 順列を持たないリストに対するinsert関数
%% 構文をわかりやすく示すためのものなので、効率は良くない。
insert(X,[]) ->
  [X];
insert(X, Set) ->
  case list:member(X,Set) of
    true -> Set;
    false -> [X|Set]
  end.

%% case文を使ったちょっと複雑なパターン。
%% ビーチに行くべきかを摂氏、絶対温度、華氏の３つの温度表現で答える。
beach(Temprature) ->
  case Temprature of
    {celsius, N} when N >= 20, N =< 45 ->
      'favorable';
    {kelvin, N} when N >= 293, N =< 318 ->
      'scientifically';
    {fahrenheit, N} when N >= 68, N =< 113 ->
      'favorable in the US';
    _ ->
      'avoid beach'
  end.

%% case ... of は関数のヘッドとガードを集めたものにほぼ該当する。
%% そのため、先ほどのbeachは次のように書くことも可能である。
beachf({celsius, N}) when N >= 20, N =< 45 ->
  'favorable';
beachf({kelvin, N}) when N >= 293, N =< 318 ->
  'scientifically favorable';
beachf({fahrenheit, N}) when N >= 68, N =< 113 ->
  'favorable in US';
beachf(_) ->
  'avoid beach'.
