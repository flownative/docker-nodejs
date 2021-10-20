FROM europe-docker.pkg.dev/flownative/docker/base:bullseye

LABEL org.opencontainers.image.authors="Robert Lemke <robert@flownative.com>"
LABEL org.label-schema.name="Flownative Node.js"
LABEL org.label-schema.description="Docker image providing Node.js"
LABEL org.label-schema.vendor="Flownative GmbH"

# -----------------------------------------------------------------------------
# Node.js
# Latest versions: https://packages.debian.org/buster/nodejs

ENV FLOWNATIVE_LIB_PATH=/opt/flownative/lib \
    NODEJS_BASE_PATH=/opt/flownative/nodejs \
    PATH="/opt/flownative/nodejs/bin:$PATH" \
    LOG_DEBUG=false

USER root
COPY --from=europe-docker.pkg.dev/flownative/docker/bash-library:1.13.3 /lib $FLOWNATIVE_LIB_PATH

RUN install_packages \
    nodejs

COPY root-files /
RUN /build.sh

EXPOSE 8080

USER nodejs
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "run" ]
