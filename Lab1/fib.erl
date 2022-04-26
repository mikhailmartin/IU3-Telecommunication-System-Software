-module(fib).
-export([fib_p/1, fib_g/1, tail_fib/1, start/0]).

% Функция, использующая сравнением аргумента с образцом.
fib_p(0) -> 0;
fib_p(1) -> 1;
fib_p(N) -> fib_p(N - 1) + fib_p(N - 2).

% Функция, использующая сторожевые последовательности.
fib_g(N) when N == 0 -> 0;
fib_g(N) when N == 1 -> 1;
fib_g(N) when N > 1 -> fib_p(N - 1) + fib_p(N - 2).

% Функция, использующая хвостовую рекурсию.
tail_fib(N) -> tail_fib_helper(N, 0, 1).
tail_fib_helper(0, Res, _) -> Res;
tail_fib_helper(1, _, Res) -> Res;
tail_fib_helper(N, Prev, Res) when N >= 2 ->
	tail_fib_helper(N-1, Res, Res+Prev).
