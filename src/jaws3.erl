-module(jaws3).

-export([ start/0
        , start/2
        , stop/0
        , stop/1
        , upload_files/1
        ]).

%% application
%% @doc Starts the application
start() ->
  {ok, _Started} = application:ensure_all_started(jaws3).

%% @doc Stops the application
stop() ->
  application:stop(jaws3).

%% behaviour
%% @private
start(_StartType, _StartArgs) ->
  %ok = minmay:start(),
  jaws3_sup:start_link().

%% @private
stop(_State) ->
  ok.

-spec upload_files([string()]) -> [tuple()].
upload_files(FilesPath) ->
  #{aws3_bucket := Bucket} = jaws3_utils:config(),
  %% TODO this comprehension list should be paralized.
  [upload_file(list_to_binary(Img), Bucket) || Img <- FilesPath].

-spec upload_file(string(), string()) -> string().
upload_file(FileName, Bucket) -> 
  ImageData      = read_data_file(FileName),
  FileNameString = binary_to_list(FileName),
  {ok, AwsUrl} = jaws3_utils:upload(Bucket, FileNameString, ImageData),
  AwsUrl.

read_data_file(FileName) ->
  {ok, Data}      = file:read_file(FileName),
  MimeContentType = minmay:get_mime_type(FileName),
  {MimeContentType, Data}.
