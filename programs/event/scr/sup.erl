%%% ----------------------------------------------------------------------------
%%% @doc Монитор
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup).

%% API -------------------------------------------------------------------------
-export([start/2, start_link/2, init/1, loop/1]).

%% Реализация функций ----------------------------------------------------------
start(Mod, Args) ->
    spawn(?MODULE, init, [{Mod, Args}]).

start_link(Mod, Args) ->
    spawn_link(?MODULE, init, [{Mod, Args}]).

init({Mod, Args}) ->
    process_flag(trap_exit, true),
    loop({Mod, start_link, Args}).

loop({M, F, A}) ->
    Pid = apply(M, F, A),
    receive
        {'EXIT', _From, shutdown} ->
            exit(shutdown);  % так же убьет дочерний процесс
        {'EXIT', Pid, Reason} ->
            io:format("Процесс ~p вышел по причине ~p~n", [Pid, Reason]),
            loop({M, F, A})
    end.
