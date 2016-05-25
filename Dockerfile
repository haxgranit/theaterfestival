FROM ruby:2.3-slim

RUN apt-get update -qq && apt-get install -y build-essential

RUN apt-get update -qq && apt-get install -y git

# for postgres
RUN apt-get update -qq && apt-get install -y libpq-dev

# for nokogiri
RUN apt-get update -qq && apt-get install -y libxml2-dev
RUN apt-get update -qq && apt-get install -y libxslt1-dev

# for capybara-webkit
RUN apt-get update -qq && apt-get install -y libqt4-webkit
RUN apt-get update -qq && apt-get install -y libqt4-dev
RUN apt-get update -qq && apt-get install -y xvfb

# for a JS runtime
RUN apt-get update -qq && apt-get install -y nodejs

# for image processing
RUN apt-get update -qq && apt-get install -y imagemagick

ENV APP_HOME /theaterengine
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock


ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN gem install bundler

RUN bundle

ADD . $APP_HOME
