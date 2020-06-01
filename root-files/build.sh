#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

useradd --home-dir "${NODEJS_BASE_PATH}" --no-create-home --no-user-group --uid 1000 nodejs
groupadd --gid 1000 nodejs

mkdir -p \
    "${NODEJS_BASE_PATH}/bin"

mv /usr/bin/node "${NODEJS_BASE_PATH}/bin/"
mv /usr/bin/nodejs "${NODEJS_BASE_PATH}/bin/"

chown -R nodejs:nodejs "${NODEJS_BASE_PATH}"
chmod -R g+rwX "${NODEJS_BASE_PATH}"
