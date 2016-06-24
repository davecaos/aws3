PROJECT = jaws3

DEPS =  sync erlcloud minmay
dep_sync     = git https://github.com/rustyio/sync.git      master
dep_minmay   = git https://github.com/davecaos/minmay.git   1.0.0
dep_erlcloud = git https://github.com/erlcloud/erlcloud.git 0.13.4

include erlang.mk

CT_OPTS = -erl_args -config rel/sys.config

SHELL_OPTS = -name ${PROJECT}@`hostname` -s ${PROJECT} -config rel/sys.config
