-module(crypto_manager).
-behaviour(gen_server).

-export([start_link/0]).
-export([keygen/0, encode/2, decode/2]).
-export([init/1, handle_call/3]).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init(Args) ->
    {ok, Args}.

get_new_key_name() ->
	["SecKey-", integer_to_list(os:system_time())].

keygen() ->
	gen_server:call(?MODULE, keygen).

encode(TextToEncode, SessionKeyName) ->
	gen_server:call(?MODULE, {encode, TextToEncode, SessionKeyName}).

decode(SessionKeyName, CiphertextFile) ->
	gen_server:call(?MODULE, {decode, SessionKeyName, CiphertextFile}).	    

handle_call(keygen, _From, State) ->
	NewKey = get_new_key_name(),
	os:cmd(["ntru_encrypt_tools/bin/NTRUEncrypt_keygen",
			" --key_name ",
			"./session_keys/", NewKey]),
	{reply, NewKey, State};

handle_call({encode, TextToEncode, SessionKeyName}, _From, State) ->
	io:format("~p~n",[{SessionKeyName, TextToEncode}]),
	Answer = os:cmd(["ntru_encrypt_tools/bin/NTRUEncrypt_encode",
					" --key_name ", "./session_keys/", SessionKeyName,
					" --text_to_encode ", TextToEncode,
					" --ciphertext_file ", "./ciphertext/",SessionKeyName,"-current_cipher_message"
					]),
	{reply, Answer, State};

handle_call({decode, SessionKeyName, CiphertextFile}, _From, State) ->
	Answer = os:cmd(["ntru_encrypt_tools/bin/NTRUEncrypt_decode",
				 	" --key_name ", "./session_keys/",SessionKeyName,
				 	" --ciphertext_file ", "ciphertext/",CiphertextFile
				 	]),
	{reply, Answer, State}.