-module(jaws3_sup).

-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

%% admin api
-spec start_link() -> any().
start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, {}).


%% behaviour callbacks
-spec init(tuple()) -> tuple().
init({}) ->
    {ok,
     {
       {one_for_one, 5, 10},
       [
        %% {ChildId, StartFunc, Restart, Shutdown, Type, Modules}
       ]
     }
    }.
