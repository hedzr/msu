#!/usr/bin/env bash
# Loading msu. This is usually 'source'd in '~/.bashrc'
# (or equivalent)
#
# Copyright (c) 2015-2016 GochoMugo <mugo@forfuture.co.ke>


# shellcheck disable=SC1091

# loading aliases (into env)
msu_require "aliases"

# we need to perform clean-up, since we are 'source'ng
unset MSU_EXE
unset MSU_LIB
unset MSU_REQUIRE_LOCK
unset msu__check_deps
unset msu_require
unset msu_run
unset msu_execute
unset MSU_AUTHOR_NAME
unset MSU_AUTHOR_EMAIL
unset MSU_VERSION
unset MSU_BUILD_HASH
unset MSU_BUILD_DATE
unset MSU_INSTALL_LIB
unset MSU_INSTALL_BIN
unset MSU_INSTALL_MAN
unset MSU_INSTALL_LOAD_STRING
