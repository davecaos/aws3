-module(jaws3_utils).

-export([ config/0
        , upload/3
        , build_url/2
        ]).

-spec config() -> map().
config() ->
  AWS3Key    = application:get_env(jaws3, s3_access_key, undefined),
  AWS3Secret = application:get_env(jaws3, s3_access_secret, undefined),
  Bucket     = application:get_env(jaws3, s3_bucket, undefined),
  ok = erlcloud_s3:configure(AWS3Key, AWS3Secret),
  erlcloud_aws:update_config(#aws_config{retry = erlcloud_retry:default_retry/1})
  #{aws3_key => AWS3Key, aws3_secret => AWS3Secret, aws3_bucket => Bucket}.

-spec upload(string(), binary(), {binary(), string(), iolist()}) ->
  {ok, [byte()]}.
upload(Bucket, FileName, {CType, Data}) ->
  erlcloud_s3:put_object(Bucket, FileName, Data, [], [{"content-type", CType}]),
  {ok, build_url(Bucket, FileName)}.

-spec build_url(string(), string()) -> string().
build_url(Bucket, FileName) ->
  ["https://", Bucket, ".s3.amazonaws.com/", FileName].
