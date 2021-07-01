FROM ruby:2.6.6-alpine3.12
LABEL maintainer="hungle"

# Minimal requirements to run a Rails app
RUN apk add --no-cache --update build-base \
    linux-headers \
    git \
    postgresql-dev \
    nodejs \
    yarn \
    tzdata

ENV APP_PATH /usr/src/app

# Different layer for gems installation
WORKDIR $APP_PATH
ADD Gemfile $APP_PATH
ADD Gemfile.lock $APP_PATH
RUN gem list bundler
RUN gem install bundler -v 2.2.4
RUN bundle install
# Copy the application into the container
COPY . APP_PATH

EXPOSE 3000

