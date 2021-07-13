#!/usr/bin/env bash

tail ${@:1} | sed --unbuffered \
    -e 's/\(.*INFO.*\)/\o033[90m\1\o033[39m/' \
    -e 's/\(.*NOTICE.*\)/\o033[37m\1\o033[39m/' \
    -e 's/\(.*WARNING.*\)/\o033[33m\1\o033[39m/' \
    -e 's/\(.*ERROR.*\)/\o033[93m\1\o033[39m/' \
    -e 's/\(.*CRITICAL.*\)/\o033[31m\1\o033[39m/' \
    -e 's/\(.*ALERT.*\)/\o033[91m\1\o033[39m/' \
    -e 's/\(.*EMERGENCY.*\)/\o033[95m\1\o033[39m/' \
    -e 's/\(\#.*\)/\o033[90m\1\o033[39m/' \
    -e 's/\(stacktrace\)/\o033[37m\1\o033[39m/' | grep -e INFO -e NOTICE -e WARNING -e ERROR -e CRITICAL -e ALERT -e EMERGENCY
