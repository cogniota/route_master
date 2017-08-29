-module(data_manager).

-include("request_for_connect_pb.hrl").

decode_binary(BinData) ->
	% Bin = addressbook_pb:encode_msg(#'person'{name="abc def", id=345, email="a@example.com"}),
    Dec =request_for_connect_pb:decode_msg(BinData, 'request'),

    % io:format("~nBinary~p~n",[Bin]),
    % io:format("~nBinary~w~n",[Dec]),
    % io:format("~nBinary~p~n",[Dec]),
	ok.
