FROM ruby:2.3

RUN apt-get update -qq && apt-get install -y build-essential

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

ENV BUNDLE_PATH /bundle

ADD Gemfile* $APP_HOME/
RUN bundle check || bundle install

ADD . $APP_HOME
