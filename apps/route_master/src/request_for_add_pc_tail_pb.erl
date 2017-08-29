%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 3.27.4
-module(request_for_add_pc_tail_pb).

-export([encode_msg/1, encode_msg/2]).
-export([decode_msg/2, decode_msg/3]).
-export([merge_msgs/2, merge_msgs/3]).
-export([verify_msg/1, verify_msg/2]).
-export([get_msg_defs/0]).
-export([get_msg_names/0]).
-export([get_group_names/0]).
-export([get_msg_or_group_names/0]).
-export([get_enum_names/0]).
-export([find_msg_def/1, fetch_msg_def/1]).
-export([find_enum_def/1, fetch_enum_def/1]).
-export([enum_symbol_by_value/2, enum_value_by_symbol/2]).
-export([get_service_names/0]).
-export([get_service_def/1]).
-export([get_rpc_names/1]).
-export([find_rpc_def/2, fetch_rpc_def/2]).
-export([get_package_name/0]).
-export([gpb_version_as_string/0, gpb_version_as_list/0]).

-include("request_for_add_pc_tail_pb.hrl").
-include("gpb.hrl").

%% enumerated types

-export_type([]).

%% message types
-type request_for_add_pc_tail() :: #request_for_add_pc_tail{}.
-export_type(['request_for_add_pc_tail'/0]).


-spec encode_msg(_) -> binary().
encode_msg(Msg) -> encode_msg(Msg, []).


-spec encode_msg(_, list()) -> binary().
encode_msg(Msg, Opts) ->
    case proplists:get_bool(verify, Opts) of
      true -> verify_msg(Msg, Opts);
      false -> ok
    end,
    TrUserData = proplists:get_value(user_data, Opts),
    case Msg of
      #request_for_add_pc_tail{} ->
	  e_msg_request_for_add_pc_tail(Msg, TrUserData)
    end.



e_msg_request_for_add_pc_tail(Msg, TrUserData) ->
    e_msg_request_for_add_pc_tail(Msg, <<>>, TrUserData).


e_msg_request_for_add_pc_tail(#request_for_add_pc_tail{ua
							   = F1,
						       encoded_pc_tail = F2},
			      Bin, TrUserData) ->
    B1 = if F1 == undefined -> Bin;
	    true ->
		begin
		  TrF1 = id(F1, TrUserData),
		  case is_empty_string(TrF1) of
		    true -> Bin;
		    false -> e_type_string(TrF1, <<Bin/binary, 10>>)
		  end
		end
	 end,
    if F2 == undefined -> B1;
       true ->
	   begin
	     TrF2 = id(F2, TrUserData),
	     case is_empty_string(TrF2) of
	       true -> B1;
	       false -> e_type_string(TrF2, <<B1/binary, 18>>)
	     end
	   end
    end.



e_type_string(S, Bin) ->
    Utf8 = unicode:characters_to_binary(S),
    Bin2 = e_varint(byte_size(Utf8), Bin),
    <<Bin2/binary, Utf8/binary>>.

e_varint(N, Bin) when N =< 127 -> <<Bin/binary, N>>;
e_varint(N, Bin) ->
    Bin2 = <<Bin/binary, (N band 127 bor 128)>>,
    e_varint(N bsr 7, Bin2).

is_empty_string("") -> true;
is_empty_string(<<>>) -> true;
is_empty_string(L) when is_list(L) ->
    not string_has_chars(L);
is_empty_string(B) when is_binary(B) -> false.

string_has_chars([C | _]) when is_integer(C) -> true;
string_has_chars([H | T]) ->
    case string_has_chars(H) of
      true -> true;
      false -> string_has_chars(T)
    end;
string_has_chars(B)
    when is_binary(B), byte_size(B) =/= 0 ->
    true;
string_has_chars(C) when is_integer(C) -> true;
string_has_chars(<<>>) -> false;
string_has_chars([]) -> false.



decode_msg(Bin, MsgName) when is_binary(Bin) ->
    decode_msg(Bin, MsgName, []).

decode_msg(Bin, MsgName, Opts) when is_binary(Bin) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case MsgName of
      request_for_add_pc_tail ->
	  d_msg_request_for_add_pc_tail(Bin, TrUserData)
    end.



d_msg_request_for_add_pc_tail(Bin, TrUserData) ->
    dfp_read_field_def_request_for_add_pc_tail(Bin, 0, 0,
					       id(<<>>, TrUserData),
					       id(<<>>, TrUserData),
					       TrUserData).

dfp_read_field_def_request_for_add_pc_tail(<<10,
					     Rest/binary>>,
					   Z1, Z2, F1, F2, TrUserData) ->
    d_field_request_for_add_pc_tail_ua(Rest, Z1, Z2, F1, F2,
				       TrUserData);
dfp_read_field_def_request_for_add_pc_tail(<<18,
					     Rest/binary>>,
					   Z1, Z2, F1, F2, TrUserData) ->
    d_field_request_for_add_pc_tail_encoded_pc_tail(Rest,
						    Z1, Z2, F1, F2, TrUserData);
dfp_read_field_def_request_for_add_pc_tail(<<>>, 0, 0,
					   F1, F2, _) ->
    #request_for_add_pc_tail{ua = F1, encoded_pc_tail = F2};
dfp_read_field_def_request_for_add_pc_tail(Other, Z1,
					   Z2, F1, F2, TrUserData) ->
    dg_read_field_def_request_for_add_pc_tail(Other, Z1, Z2,
					      F1, F2, TrUserData).

dg_read_field_def_request_for_add_pc_tail(<<1:1, X:7,
					    Rest/binary>>,
					  N, Acc, F1, F2, TrUserData)
    when N < 32 - 7 ->
    dg_read_field_def_request_for_add_pc_tail(Rest, N + 7,
					      X bsl N + Acc, F1, F2,
					      TrUserData);
dg_read_field_def_request_for_add_pc_tail(<<0:1, X:7,
					    Rest/binary>>,
					  N, Acc, F1, F2, TrUserData) ->
    Key = X bsl N + Acc,
    case Key of
      10 ->
	  d_field_request_for_add_pc_tail_ua(Rest, 0, 0, F1, F2,
					     TrUserData);
      18 ->
	  d_field_request_for_add_pc_tail_encoded_pc_tail(Rest, 0,
							  0, F1, F2,
							  TrUserData);
      _ ->
	  case Key band 7 of
	    0 ->
		skip_varint_request_for_add_pc_tail(Rest, 0, 0, F1, F2,
						    TrUserData);
	    1 ->
		skip_64_request_for_add_pc_tail(Rest, 0, 0, F1, F2,
						TrUserData);
	    2 ->
		skip_length_delimited_request_for_add_pc_tail(Rest, 0,
							      0, F1, F2,
							      TrUserData);
	    3 ->
		skip_group_request_for_add_pc_tail(Rest, Key bsr 3, 0,
						   F1, F2, TrUserData);
	    5 ->
		skip_32_request_for_add_pc_tail(Rest, 0, 0, F1, F2,
						TrUserData)
	  end
    end;
dg_read_field_def_request_for_add_pc_tail(<<>>, 0, 0,
					  F1, F2, _) ->
    #request_for_add_pc_tail{ua = F1, encoded_pc_tail = F2}.

d_field_request_for_add_pc_tail_ua(<<1:1, X:7,
				     Rest/binary>>,
				   N, Acc, F1, F2, TrUserData)
    when N < 57 ->
    d_field_request_for_add_pc_tail_ua(Rest, N + 7,
				       X bsl N + Acc, F1, F2, TrUserData);
d_field_request_for_add_pc_tail_ua(<<0:1, X:7,
				     Rest/binary>>,
				   N, Acc, _, F2, TrUserData) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_request_for_add_pc_tail(Rest2, 0, 0,
					       NewFValue, F2, TrUserData).


d_field_request_for_add_pc_tail_encoded_pc_tail(<<1:1,
						  X:7, Rest/binary>>,
						N, Acc, F1, F2, TrUserData)
    when N < 57 ->
    d_field_request_for_add_pc_tail_encoded_pc_tail(Rest,
						    N + 7, X bsl N + Acc, F1,
						    F2, TrUserData);
d_field_request_for_add_pc_tail_encoded_pc_tail(<<0:1,
						  X:7, Rest/binary>>,
						N, Acc, F1, _, TrUserData) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_request_for_add_pc_tail(Rest2, 0, 0,
					       F1, NewFValue, TrUserData).


skip_varint_request_for_add_pc_tail(<<1:1, _:7,
				      Rest/binary>>,
				    Z1, Z2, F1, F2, TrUserData) ->
    skip_varint_request_for_add_pc_tail(Rest, Z1, Z2, F1,
					F2, TrUserData);
skip_varint_request_for_add_pc_tail(<<0:1, _:7,
				      Rest/binary>>,
				    Z1, Z2, F1, F2, TrUserData) ->
    dfp_read_field_def_request_for_add_pc_tail(Rest, Z1, Z2,
					       F1, F2, TrUserData).


skip_length_delimited_request_for_add_pc_tail(<<1:1,
						X:7, Rest/binary>>,
					      N, Acc, F1, F2, TrUserData)
    when N < 57 ->
    skip_length_delimited_request_for_add_pc_tail(Rest,
						  N + 7, X bsl N + Acc, F1, F2,
						  TrUserData);
skip_length_delimited_request_for_add_pc_tail(<<0:1,
						X:7, Rest/binary>>,
					      N, Acc, F1, F2, TrUserData) ->
    Length = X bsl N + Acc,
    <<_:Length/binary, Rest2/binary>> = Rest,
    dfp_read_field_def_request_for_add_pc_tail(Rest2, 0, 0,
					       F1, F2, TrUserData).


skip_group_request_for_add_pc_tail(Bin, FNum, Z2, F1,
				   F2, TrUserData) ->
    {_, Rest} = read_group(Bin, FNum),
    dfp_read_field_def_request_for_add_pc_tail(Rest, 0, Z2,
					       F1, F2, TrUserData).


skip_32_request_for_add_pc_tail(<<_:32, Rest/binary>>,
				Z1, Z2, F1, F2, TrUserData) ->
    dfp_read_field_def_request_for_add_pc_tail(Rest, Z1, Z2,
					       F1, F2, TrUserData).


skip_64_request_for_add_pc_tail(<<_:64, Rest/binary>>,
				Z1, Z2, F1, F2, TrUserData) ->
    dfp_read_field_def_request_for_add_pc_tail(Rest, Z1, Z2,
					       F1, F2, TrUserData).




read_group(Bin, FieldNum) ->
    {NumBytes, EndTagLen} = read_gr_b(Bin, 0, 0, 0, 0, FieldNum),
    <<Group:NumBytes/binary, _:EndTagLen/binary, Rest/binary>> = Bin,
    {Group, Rest}.

%% Like skipping over fields, but record the total length,
%% Each field is <(FieldNum bsl 3) bor FieldType> ++ <FieldValue>
%% Record the length because varints may be non-optimally encoded.
%%
%% Groups can be nested, but assume the same FieldNum cannot be nested
%% because group field numbers are shared with the rest of the fields
%% numbers. Thus we can search just for an group-end with the same
%% field number.
%%
%% (The only time the same group field number could occur would
%% be in a nested sub message, but then it would be inside a
%% length-delimited entry, which we skip-read by length.)
read_gr_b(<<1:1, X:7, Tl/binary>>, N, Acc, NumBytes, TagLen, FieldNum)
  when N < (32-7) ->
    read_gr_b(Tl, N+7, X bsl N + Acc, NumBytes, TagLen+1, FieldNum);
read_gr_b(<<0:1, X:7, Tl/binary>>, N, Acc, NumBytes, TagLen,
          FieldNum) ->
    Key = X bsl N + Acc,
    TagLen1 = TagLen + 1,
    case {Key bsr 3, Key band 7} of
        {FieldNum, 4} -> % 4 = group_end
            {NumBytes, TagLen1};
        {_, 0} -> % 0 = varint
            read_gr_vi(Tl, 0, NumBytes + TagLen1, FieldNum);
        {_, 1} -> % 1 = bits64
            <<_:64, Tl2/binary>> = Tl,
            read_gr_b(Tl2, 0, 0, NumBytes + TagLen1 + 8, 0, FieldNum);
        {_, 2} -> % 2 = length_delimited
            read_gr_ld(Tl, 0, 0, NumBytes + TagLen1, FieldNum);
        {_, 3} -> % 3 = group_start
            read_gr_b(Tl, 0, 0, NumBytes + TagLen1, 0, FieldNum);
        {_, 4} -> % 4 = group_end
            read_gr_b(Tl, 0, 0, NumBytes + TagLen1, 0, FieldNum);
        {_, 5} -> % 5 = bits32
            <<_:32, Tl2/binary>> = Tl,
            read_gr_b(Tl2, 0, 0, NumBytes + TagLen1 + 4, 0, FieldNum)
    end.

read_gr_vi(<<1:1, _:7, Tl/binary>>, N, NumBytes, FieldNum)
  when N < (64-7) ->
    read_gr_vi(Tl, N+7, NumBytes+1, FieldNum);
read_gr_vi(<<0:1, _:7, Tl/binary>>, _, NumBytes, FieldNum) ->
    read_gr_b(Tl, 0, 0, NumBytes+1, 0, FieldNum).

read_gr_ld(<<1:1, X:7, Tl/binary>>, N, Acc, NumBytes, FieldNum)
  when N < (64-7) ->
    read_gr_ld(Tl, N+7, X bsl N + Acc, NumBytes+1, FieldNum);
read_gr_ld(<<0:1, X:7, Tl/binary>>, N, Acc, NumBytes, FieldNum) ->
    Len = X bsl N + Acc,
    NumBytes1 = NumBytes + 1,
    <<_:Len/binary, Tl2/binary>> = Tl,
    read_gr_b(Tl2, 0, 0, NumBytes1 + Len, 0, FieldNum).


merge_msgs(Prev, New) -> merge_msgs(Prev, New, []).

merge_msgs(Prev, New, Opts)
    when element(1, Prev) =:= element(1, New) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case Prev of
      #request_for_add_pc_tail{} ->
	  merge_msg_request_for_add_pc_tail(Prev, New, TrUserData)
    end.

merge_msg_request_for_add_pc_tail(#request_for_add_pc_tail{ua
							       = PFua,
							   encoded_pc_tail =
							       PFencoded_pc_tail},
				  #request_for_add_pc_tail{ua = NFua,
							   encoded_pc_tail =
							       NFencoded_pc_tail},
				  _) ->
    #request_for_add_pc_tail{ua =
				 if NFua =:= undefined -> PFua;
				    true -> NFua
				 end,
			     encoded_pc_tail =
				 if NFencoded_pc_tail =:= undefined ->
					PFencoded_pc_tail;
				    true -> NFencoded_pc_tail
				 end}.



verify_msg(Msg) -> verify_msg(Msg, []).

verify_msg(Msg, Opts) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case Msg of
      #request_for_add_pc_tail{} ->
	  v_msg_request_for_add_pc_tail(Msg,
					[request_for_add_pc_tail], TrUserData);
      _ -> mk_type_error(not_a_known_message, Msg, [])
    end.


-dialyzer({nowarn_function,v_msg_request_for_add_pc_tail/3}).
v_msg_request_for_add_pc_tail(#request_for_add_pc_tail{ua
							   = F1,
						       encoded_pc_tail = F2},
			      Path, _) ->
    if F1 == undefined -> ok;
       true -> v_type_string(F1, [ua | Path])
    end,
    if F2 == undefined -> ok;
       true -> v_type_string(F2, [encoded_pc_tail | Path])
    end,
    ok.

-dialyzer({nowarn_function,v_type_string/2}).
v_type_string(S, Path) when is_list(S); is_binary(S) ->
    try unicode:characters_to_binary(S) of
      B when is_binary(B) -> ok;
      {error, _, _} ->
	  mk_type_error(bad_unicode_string, S, Path)
    catch
      error:badarg ->
	  mk_type_error(bad_unicode_string, S, Path)
    end;
v_type_string(X, Path) ->
    mk_type_error(bad_unicode_string, X, Path).

-spec mk_type_error(_, _, list()) -> no_return().
mk_type_error(Error, ValueSeen, Path) ->
    Path2 = prettify_path(Path),
    erlang:error({gpb_type_error,
		  {Error, [{value, ValueSeen}, {path, Path2}]}}).


prettify_path([]) -> top_level;
prettify_path(PathR) ->
    list_to_atom(string:join(lists:map(fun atom_to_list/1,
				       lists:reverse(PathR)),
			     ".")).



-compile({inline,id/2}).
id(X, _TrUserData) -> X.




get_msg_defs() ->
    [{{msg, request_for_add_pc_tail},
      [#field{name = ua, fnum = 1, rnum = 2, type = string,
	      occurrence = optional, opts = []},
       #field{name = encoded_pc_tail, fnum = 2, rnum = 3,
	      type = string, occurrence = optional, opts = []}]}].


get_msg_names() -> [request_for_add_pc_tail].


get_group_names() -> [].


get_msg_or_group_names() -> [request_for_add_pc_tail].


get_enum_names() -> [].


fetch_msg_def(MsgName) ->
    case find_msg_def(MsgName) of
      Fs when is_list(Fs) -> Fs;
      error -> erlang:error({no_such_msg, MsgName})
    end.


-spec fetch_enum_def(_) -> no_return().
fetch_enum_def(EnumName) ->
    erlang:error({no_such_enum, EnumName}).


find_msg_def(request_for_add_pc_tail) ->
    [#field{name = ua, fnum = 1, rnum = 2, type = string,
	    occurrence = optional, opts = []},
     #field{name = encoded_pc_tail, fnum = 2, rnum = 3,
	    type = string, occurrence = optional, opts = []}];
find_msg_def(_) -> error.


find_enum_def(_) -> error.


-spec enum_symbol_by_value(_, _) -> no_return().
enum_symbol_by_value(E, V) ->
    erlang:error({no_enum_defs, E, V}).


-spec enum_value_by_symbol(_, _) -> no_return().
enum_value_by_symbol(E, V) ->
    erlang:error({no_enum_defs, E, V}).



get_service_names() -> [].


get_service_def(_) -> error.


get_rpc_names(_) -> error.


find_rpc_def(_, _) -> error.



-spec fetch_rpc_def(_, _) -> no_return().
fetch_rpc_def(ServiceName, RpcName) ->
    erlang:error({no_such_rpc, ServiceName, RpcName}).


get_package_name() -> undefined.



gpb_version_as_string() ->
    "3.27.4".

gpb_version_as_list() ->
    [3,27,4].
