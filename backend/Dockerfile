ARG RELEASE=bullseye
FROM ruby:3.2.2-slim-${RELEASE} as rubyimg

###
# Base layers for all target
###
FROM rubyimg AS base

ARG userid=993
ARG git_revision='unspecified'

ENV GIT_REVISION=$git_revision

SHELL ["/bin/bash", "-c"]
RUN groupadd -g $userid -r spruce-challenge-api && \
    useradd -u $userid -r -m -d /srv/spruce-challenge-api -g spruce-challenge-api spruce-challenge-api

RUN apt-get update
RUN apt-get install -y curl libpq-dev libpq5 vim libboost-all-dev build-essential dumb-init

WORKDIR /srv/spruce-challenge-api/src

###
# dev stage; use --target=development to stop here
# This stage useful for mounting your local checkout with compose
# into the container to dev against.
###
FROM base AS development

ARG rails_env=development
ENV RAILS_ENV=$rails_env

COPY --chown=spruce-challenge-api:spruce-challenge-api docker-entrypoint.sh ./
USER spruce-challenge-api
ENTRYPOINT ["/usr/bin/dumb-init", "--", "./docker-entrypoint.sh"]

###
# build stage; use --target=builder to stop here
#
# This is development with the app copied in and built.  The build results are used in
# prod below.
###
FROM development AS builder

COPY --chown=spruce-challenge-api:spruce-challenge-api . .

RUN bundle install --binstubs="${BUNDLE_APP_CONFIG}/bin" \
  && rm -rf /usr/local/bundle/cache/*.gem \
  && find /usr/local/bundle/gems/ -name "*.c" -delete \
  && find /usr/local/bundle/gems/ -name "*.o" -delete \
  && find /usr/local/bundle/gems/ -name ".git" -type d -prune -execdir rm -rf {} +


###
# prod stage; default if no target given
# This inherits from base again to avoid bringing in extra built time binary packages
###
FROM base AS production

ENV RAILS_ENV=production

COPY --from=builder $BUNDLE_APP_CONFIG $BUNDLE_APP_CONFIG
COPY --from=builder --chown=spruce-challenge-api:spruce-challenge-api /srv/spruce-challenge-api/src ./

USER spruce-challenge-api
ENTRYPOINT ["/usr/bin/dumb-init", "--", "./docker-entrypoint.sh"]
CMD ["foreman", "start", "-f", "./Procfile"]
