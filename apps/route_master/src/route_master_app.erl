%%%-------------------------------------------------------------------
%% @doc route_master public API
%% @end
%%%-------------------------------------------------------------------

-module(route_master_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
	ok = application:start(ranch),
	{ok, _} = ranch:start_listener(route_master, 
			ranch_tcp, [{port, 5555}, {max_connections, 8192}], route_protocol, []),
    route_master_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
