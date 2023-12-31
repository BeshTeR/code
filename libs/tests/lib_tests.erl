-export([tests/2]).

%% -----------------------------------------------------------------------------
%% @doc Данные для тестов модуля lib
%% @end
%% -----------------------------------------------------------------------------
-spec tests(Fun, Arity) -> Return when
    Fun    :: atom(),
    Arity  :: non_neg_integer(),
    Return :: [{[any()], any()}].

tests(gcd, 2) ->
    [
    {[0, 0],              0},
    {[1, 12],             1},
    {[-4, 6],             2},
    {[11, -7],            1},
    {[24, 30],            6},
    {[123, 54],           3},
    {[54, 246],           6},
    {[14, 78],            2},
    {[156, 28],           4},
    {[6, 6],              6},
    {[3, 1],              1},
    {[0, 9],              9},
    {[12, 12],            12},
    {[-10, 0],            10},
    {[107, 41],           1},
    {[987654321, 123],    3},
    {[99990001, 5882353], 1}
    ];

tests(sign, 1) ->
    [
    {[1],     1},
    {[0],     0},
    {[0.0],   0},
    {[0.1],   1},
    {[-3],    -1},
    {[-12.9], -1}
    ];

tests(pow, 2) ->
    [
    {[2, 10],   1024},
    {[9, 2],    81},
    {[0, 5],    0},
    {[5, 1],    5},
    {[0, -0],   1},
    {[1, -1],   1.0},
    {[10, -3],  0.001},
    {[1, 50],   1},
    {[2.0, 3],  8.0},
    {[2.0, -1], 0.5},
    {[1, -1],   1.0},
    {[5, 20],   95367431640625},
    {[6, 30],   221073919720733357899776},
    {[2, 400],  2582249878086908589655919172003011874329705792829223512830659356540647622016841194629645353280137831435903171972747493376}
    ];

tests(fac, 1) ->
    [
    {[0],  1},
    {[1],  1},
    {[2],  2},
    {[6],  720},
    {[20], 2432902008176640000},
    {[35], 10333147966386144929666651337523200000000},
    {[85], 281710411438055027694947944226061159480056634330574206405101912752560026159795933451040286452340924018275123200000000000000000000}
    ];

tests(mul, 2) ->
    [
    {[1, 6],  720},
    {[3, 5],  60},
    {[4, 20], 405483668029440000}
    ];

tests(id, 1) ->
    [
    {[123],               123},
    {[[res,{ok,"test"}]], [res,{ok,"test"}]},
    {[{<<12345>>,name}],  {<<12345>>,name}},
    {[atom],              atom}
    ];

tests(pmap, 2) ->
    [
    {[fun id/1, [1,2,3]],            [1,2,3]},
    {[fun id/1, []],                 []},
    {[fun(_) -> 1 end, [1,2,3]],     [1,1,1]},
    {[fun(_) -> false end, [1,2,3]], [false,false,false]},
    {[fun(X) -> X*X end, []],        []},
    {[fun(X) -> X*X end, [5]],       [25]},
    {[fun(X) -> X*X end, [1,2,3]],   [1,4,9]}
    ];

tests(pcall, 1) ->
    [
    {[[]],                                                         []},
    {[[{lib, pow, [2, 10]}]],                                      [1024]},
    {[[{lib, fac, [5]}, {lib, id, [erlang]}, {lib, pow, [3, 4]}]], [120, erlang, 81]}
    ];

tests(type_of, 1) ->
    [
    {[true],                                      boolean},
    {[false],                                     boolean},
    {[erlang],                                    atom},
    {['Erlang lang'],                             atom},
    {[0],                                         integer},
    {[-10],                                       integer},
    {[10],                                        integer},
    {[0.0],                                       real},
    {[-10.1e-2],                                  real},
    {[[]],                                        list},
    {[[1, {}]],                                   list},
    {[[{1,2}]],                                   list},
    {[{}],                                        tuple},
    {[{[]}],                                      tuple},
    {[#{key => value}],                           map},
    {[#{}],                                       map},
    {[self()],                                    pid},
    {[fun lib:id/0],                              function},
    {[fun() -> ok end],                           function},
    {[make_ref()],                                reference},
    {[list_to_binary("erlang")],                  binary},
    {[<<"">>],                                    binary},
    {[<<123, 321, 213>>],                         binary},
    {[<<>>],                                      binary},
    {[begin {_, X} = gen_udp:open(0, []), X end], port}
    ];

tests(depth, 1) ->
    [
    {[erlang],                       0},
    {[[]],                           1},
    {[{[1]}],                        0},
    {[[1,2,3, [erlang], 4, 5]],      2},
    {[[1,2,3, [[[]]], [4],  [[5]]]], 4}
    ];

tests(map_all, 2) ->
    [
    {[fun(X)-> X*2 end, []],                                    []},
    {[fun(X)-> X*2 end, 5],                                     10},
    {[fun(X)-> X*2 end, [1,2,3,[4,5,0], [[6, 11]], [], [7],8]], [2,4,6,[8,10,0],[[12,22]],[],[14],16]}
    ];

tests(pmap_all, 2) ->
    [
    {[fun(X)-> X*2 end, []],                                    []},
    {[fun(X)-> X*2 end, 5],                                     10},
    {[fun(X)-> X*2 end, [1,2,3,[4,5,0], [[6, 11]], [], [7],8]], [2,4,6,[8,10,0],[[12,22]],[],[14],16]}
    ];

tests(_, _) ->
    [].
