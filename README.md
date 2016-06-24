# jaws3     <img src="https://github.com/davecaos/jaws3/blob/master/S3.png"  height="50" width="198">
---------
This is a Erlang library for upload easily files to AWS S3 

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
