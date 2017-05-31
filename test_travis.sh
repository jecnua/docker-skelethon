#!/bin/bash
# No need to expose any port :)

export GOSS_WAIT_OPTS="-r 90s -s 1s > /dev/null"
dgoss run \
  example/example:dev-latest
