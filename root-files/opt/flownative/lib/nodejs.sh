#!/bin/bash
# shellcheck disable=SC1090

# =======================================================================================
# LIBRARY: NODE.JS
# =======================================================================================

# Load helper lib

. "${FLOWNATIVE_LIB_PATH}/log.sh"
. "${FLOWNATIVE_LIB_PATH}/files.sh"
. "${FLOWNATIVE_LIB_PATH}/validation.sh"
. "${FLOWNATIVE_LIB_PATH}/process.sh"

# ---------------------------------------------------------------------------------------
# nodejs_env() - Load global environment variables for configuring Node.js
#
# @global NODEJS_* The NODEJS_ evnironment variables
# @return "export" statements which can be passed to eval()
#
nodejs_env() {
    cat <<"EOF"
export NODEJS_BASE_PATH="${NODEJS_BASE_PATH}"
export NODEJS_APPLICATION_PATH="${NODEJS_APPLICATION_PATH:-/application}"
export NODEJS_APPLICATION_WORKING_PATH="${NODEJS_APPLICATION_WORKING_PATH:-/application}"
EOF
}

# ----------------------------------------------------------------------------------------
# nodejs_initialize() - Initialize Node.js configuration and check required files and dirs
#
# @global NODEJS_* The NODEJS_* environment variables
# @return void
#
nodejs_initialize() {
    info "Node.js: Will run application at ${NODEJS_APPLICATION_PATH} ..."

    # Create a file descriptor for the Nodejs stdout output and clean up the log
    # lines a bit:
    exec 4> >(sed -e "s/^\([0-9\/-]* [0-9:,]*\)/\1     OUTPUT Node.js:/")
}
