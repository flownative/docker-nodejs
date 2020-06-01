FROM docker.pkg.github.com/flownative/docker-base/base:buster
MAINTAINER Robert Lemke <robert@flownative.com>

LABEL org.label-schema.name="Flownative Node.js"
LABEL org.label-schema.description="Docker image providing Node.js"
LABEL org.label-schema.vendor="Flownative GmbH"

# -----------------------------------------------------------------------------
# Node.js
# Latest versions: https://packages.debian.org/buster/nodejs

ARG NODEJS_VERSION
ENV NODEJS_VERSION ${NODEJS_VERSION}

ENV FLOWNATIVE_LIB_PATH=/opt/flownative/lib \
    NODEJS_BASE_PATH=/opt/flownative/nodejs \
    PATH="/opt/flownative/nodejs/bin:$PATH" \
    LOG_DEBUG=false

USER root
COPY --from=docker.pkg.github.com/flownative/bash-library/bash-library:1 /lib $FLOWNATIVE_LIB_PATH

RUN install_packages \
    nodejs=${NODEJS_VERSION}

COPY root-files /
RUN /build.sh

EXPOSE 8080

USER nodejs
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "run" ]
