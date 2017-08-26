# jaws3
![S3](https://user-images.githubusercontent.com/6124495/29745357-ea11e7ba-8a8e-11e7-9a4e-b95823c12011.png)
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
