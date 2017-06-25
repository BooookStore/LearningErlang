-module(useless).

-export([add/2,
 hello/0,
 greet_and_add_two/1,
 greet/2,
 head/1,
 second/1]).

add(A, B) ->
  A + B.

%% 挨拶を表示します。
%% io:format/1 は文字列を出力するための標準関数です
hello() ->
  io:format("Hello, world!~n").

greet_and_add_two(X) ->
  hello(),
  add(X,2).

%%パターンマッチングの例。
greet(male, Name) ->
  io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
  io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
  io:format("Hello, ~s!", [Name]).

%% リストにパターンマッチングを適用。
head([H|_]) ->
  H.

second([_,S|_]) ->
  S.

%% ２つのパラメータが同じかどうかを判断する
same(X,X) ->
  true.

same(_,_) ->
  false.

valid_time({Date = {Y, M, D}, Time = {H, Min, S}}) ->
  io:format("The Date touple (~p) says today is: ~p/~p/~p,~n", [Date,Y,M,D]),
  io:format("The time touple (~p) indicates: ~p:~p:~p.~n",[Time,H,Min,S]).
