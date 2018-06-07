FROM jenkins/jenkins:lts-alpine

LABEL maintainer "capuchon.dev@gmail.com"

# Set environment variables.
ENV LANG=en_US.UTF-8 \
    JAVA_OPTS="-Dorg.apache.commons.jelly.tags.fmt.timeZone=Europe/Paris"

# Install needed OS packages.
USER root
RUN apk add --no-cache \
    docker  \
 && addgroup jenkins docker
USER jenkins

# Pre-install desired Jenkins plugins.
RUN /usr/local/bin/install-plugins.sh \
      build-timeout \
      credentials-binding \
      timestamper \
      ws-cleanup \
      workflow-aggregator \
      pipeline-stage-view \
      blueocean \
      git \
      git-parameter \
      ssh-slaves \
      matrix-auth \
      pam-auth \
      email-ext \
      mailer \
      docker-custom-build-environment
