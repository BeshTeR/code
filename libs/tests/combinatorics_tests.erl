-export([tests/2]).

%% -----------------------------------------------------------------------------
%% @doc Данные для тестов модуля combinatorics
%% @end
%% -----------------------------------------------------------------------------
-spec tests(Fun, Arity) -> Return when
    Fun    :: atom(),
    Arity  :: non_neg_integer(),
    Return :: [{[any()], any()}].

tests(placements, 2) ->
    [
    {[0, 0],   1},
    {[1, 0],   1},
    {[10, 3],  720},
    {[15, 15], lib:fac(15)},
    {[15, 14], lib:fac(15)}
    ];

tests(placements_rep, 2) ->
    [
    {[1, 1],   1},
    {[4, 2],   16},
    {[10, 3],  1000},
    {[10, 10], 10_000_000_000},
    {[15, 2],  225}
    ];

tests(permutations, 1) ->
    [
    {[1],  1},
    {[2],  2},
    {[3],  6},
    {[5],  120},
    {[20], lib:fac(20)}
    ];

tests(combinations, 2) ->
    [
    {[2, 2],     1},
    {[10, 7],    120},
    {[10, 10],   1},
    {[14, 5],    2002},
    {[16, 9],    11_440},
    {[400, 200], 102952500135414432972975880320401986757210925381077648234849059575923332372651958598336595518976492951564048597506774120}
    ];

tests(combinations_rep, 2) ->
    [
    {[2, 2],     3},
    {[10, 7],    11_440},
    {[10, 10],   92_378},
    {[14, 5],    8_568},
    {[16, 9],    1_307_504}
    ];

tests(bin, 2) ->
    [
    {[2, 3],     0},
    {[2, 2],     1},
    {[10, 7],    120},
    {[10, 10],   1},
    {[14, 5],    2002},
    {[16, 9],    11440},
    {[400, 200], 102952500135414432972975880320401986757210925381077648234849059575923332372651958598336595518976492951564048597506774120}
    ];

tests(perms, 1) ->
    [
    {[[]],      [[]]},
    {[[1]],     [[1]]},
    {["a"],     ["a"]},
    {["ab"],    ["ab","ba"]},
    {["aa"],    ["aa","aa"]},
    {["123"],   ["123","132","213","231","312","321"]},
    {[[1,2,3]], [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]}
    ];

tests(_, _) ->
    [].
