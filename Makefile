PROJECT = emqx_dashboard
PROJECT_DESCRIPTION = EMQ X Web Dashboard
PROJECT_VERSION = 2.4.2

LOCAL_DEPS = mnesia

DEPS = minirest
dep_minirest = git https://github.com/emqx/minirest emqx30

BUILD_DEPS = emqx cuttlefish
dep_emqx = git https://github.com/emqtt/emqttd emqx30-dev
dep_cuttlefish = git https://github.com/emqtt/cuttlefish

NO_AUTOPATCH = cuttlefish

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'

COVER = true

include erlang.mk

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emqx_dashboard.conf -i priv/emqx_dashboard.schema -d data
