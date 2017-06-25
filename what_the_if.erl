-module(what_the_if).
-export([heh_fine/0,
  oh_god/1,
  help_me/1]).

%%% Erlangにおけるifはガード(when)のような振る舞いをする。
%%% 実際、ガードパターンと呼ばれている。

%% ガードパターンを使った単純な例。
heh_fine() ->
  if 1 =:= 1 ->
    works
  end,
  if 1 =:= 2; 1 =:= 1 ->
    works
  end,
  if 1 =:= 2, 1 =:= 1 ->
    fails
  end.

%% ガードパターンは、すべてのパターンを網羅しなければならない事を示す例。
%% そのため、必ずいづれかのパターンでtrueになる必要がある。
%% 最も単純な方法は true -> ... と書くこと。これは他の言語のelse文と同等の意味を持つ。
oh_god(N) ->
  if N =:= 2 -> might_succeed;
  true -> always_does %% これがErlangでのelse
end.

%% ファードパターンにおいて複数のガードを使う例。
%% 関数のヘッドでパターンマッチングするほうが好ましいが、あくまで例として以下のようなコードになっている。
help_me(Animal) ->
  Talk = if Animal == cat -> "meow";
            Animal == beef -> "mooo";
            Animal == dog -> "bark";
            Animal == tree -> "bark";
            true -> "fgdadfgna"
          end,
        {Animal, "says" ++ Talk ++ "!"}.
