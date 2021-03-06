PROJECT = jaws3

DEPS = erlcloud minmay erlware_commons
TEST_DEPS = sync

dep_sync     = hex 0.1.3
dep_minmay   = hex 1.2.0
dep_erlcloud = hex 2.2.16
dep_erlware_commons = hex 1.0.0

include erlang.mk

CT_OPTS = -erl_args -config rel/sys.config

SHELL_OPTS = -name ${PROJECT}@`hostname` -s ${PROJECT} -config rel/sys.config
