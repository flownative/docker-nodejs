[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)
[![Maintenance level: Love](https://img.shields.io/badge/maintenance-%E2%99%A1%E2%99%A1%E2%99%A1-ff69b4.svg)](https://www.flownative.com/en/products/open-source.html)
![Nightly Builds](https://github.com/flownative/docker-nodejs/workflows/Nightly%20Builds/badge.svg)
![Release to Docker Registries](https://github.com/flownative/docker-nodejs/workflows/Release%20to%20Docker%20Registries/badge.svg)

# Flownative Node.js Image

A Docker image providing [Node.js](https://nodejs.org/en/) for
[Beach](https://www.flownative.com/beach),
[Local Beach](https://www.flownative.com/localbeach) and other purposes.

## tl;dr

```bash
$ docker run flownative/nodejs
```

## Hosting a Node application

tbd.

## Configuration

### Logging

By default, the access log is written to STDOUT and the error log is
redirected to STDERR. That way, you can follow logs by watching
container logs with `docker logs` or using a similar mechanism in
Kubernetes or your actual platform.

### Environment variables

| Variable Name | Type | Default | Description |
|:--------------|:-----|:--------|:------------|
| …             | …    | …       | …           |

## Security aspects

This image is designed to run as a non-root container. Using an
unprivileged user generally improves the security of an image, but may
have a few side-effects, especially when you try to debug something by
logging in to the container using `docker exec`.

When you are running this image with Docker or in a Kubernetes context,
you can take advantage of the non-root approach by disallowing privilege
escalation:

```yaml
$ docker run flownative/nodejs:latest --security-opt=no-new-privileges
```

Because Node.js runs as a non-root user, it cannot bind to port 80 and
users port 8080 instead. Since you can map that port to any other port
by telling Docker or Kubernetes, this won't be a problem in practice.
However, be aware that you need to specify 8080 as the container port –
otherwise you won't get a connection.

## Building this image

Build this image with `docker build`. You need to specify the desired
version for some of the tools as build arguments:

```bash
docker build -t flownative/nodejs:latest .
```

Check the latest stable release on the tool's respective websites:

- Node.js: https://packages.debian.org/buster/nodejs
