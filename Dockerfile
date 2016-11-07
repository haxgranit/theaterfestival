FROM ruby:2.3-slim

ENV BUNDLE_PATH=/bundle

RUN apt-get update -qq && apt-get install -y build-essential

RUN apt-get update -qq && apt-get install -y git

RUN apt-get update -qq && apt-get install -y libpq-dev

RUN apt-get update -qq && apt-get install -y libxml2-dev
RUN apt-get update -qq && apt-get install -y libxslt1-dev

RUN apt-get update -qq && apt-get install -y libqt4-webkit
RUN apt-get update -qq && apt-get install -y libqt4-dev
RUN apt-get update -qq && apt-get install -y xvfb

RUN apt-get update -qq && apt-get install -y nodejs

RUN apt-get update -qq && apt-get install -y imagemagick
RUN apt-get update -qq && apt-get install -y file
RUN apt-get update -qq && apt-get install -y libcurl4-gnutls-dev

ENV APP_HOME /theaterengine
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock


ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2

RUN gem install bundler

RUN bundle install

ADD . $APP_HOME
