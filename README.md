# jaws3
![s3](https://cloud.githubusercontent.com/assets/6124495/19840674/31f31654-9eda-11e6-9ef2-85b8839ef4e8.png)
---------
An Erlang/Elixir application for upload files easily to AWS S3

First et al, you have to add yours aws s3 certificates in the [sys.config](https://github.com/davecaos/jaws3/blob/master/rel/sys.config) file.

```erlang
[
 {jaws3, 
   [
     {s3_access_key,    "SECRET_KEY"},
     {s3_access_secret, "ACCESS_SECRET"},
     {s3_bucket,        "BUCKET_NAME"}
   ]
 }
].
``` 
---------

Example:
```erlang
Eshell V7.0  (abort with ^G)
1>  jaws:upload_files(["/users/davecaos/avatar.jpg", "vacations.gif"]).
   
```
