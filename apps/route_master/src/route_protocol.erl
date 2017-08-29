-module(route_protocol).
-behaviour(ranch_protocol).

-export([start_link/4]).
-export([init/4]).

start_link(Ref, Socket, Transport, Opts) ->
	Pid = spawn_link(?MODULE, init, [Ref, Socket, Transport, Opts]),
	{ok, Pid}.

init(Ref, Socket, Transport, _Opts = []) ->
	ok = ranch:accept_ack(Ref),
	loop(Socket, Transport).

loop(Socket, Transport) ->
	case Transport:recv(Socket, 0, 5000) of
		{ok, Data} when Data =/= <<4>> ->
			%% parsing and verifying the data

			io:format("The Data ~w~n",[Data]),
			io:format("The Data ~p~n",[Data]),
			io:format("The Data ~s~n",[Data]),
			
			%% add the data to queue
			%% sent queue header to client
			% Transport:send(Socket, Data),
			loop(Socket, Transport);
		_ ->
			ok = Transport:close(Socket)
end.
