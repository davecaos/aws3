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
  ok = minmay:start(),
  jaws3_sup:start_link().

%% @private
stop(_State) ->
  ok.

-spec upload_files([string()]) -> [tuple()].
upload_files(FilesPaths) ->
  #{aws3_bucket := Bucket} = jaws3_utils:config(),
  parallel_lists:pmap(fun upload_file/1 , FilesPaths).

-spec upload_file(string()) -> string().
upload_file(FilesPath) -> 
  ImageData = read_data_file(FilesPath),
  Bucket = application:get_env(jaws3, s3_bucket, undefined),
  {ok, AwsUrl} = jaws3_utils:upload(Bucket, FilesPath, ImageData),
  AwsUrl.

read_data_file(FileName) ->
  {ok, Data}      = file:read_file(FileName),
  MimeContentType = minmay:from_filename(FileName),
  {MimeContentType, Data}.
