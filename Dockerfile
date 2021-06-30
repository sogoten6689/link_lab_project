FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
RUN mkdir /linklab
WORKDIR /linklab
ADD Gemfile /linklab/Gemfile
ADD Gemfile.lock /linklab/Gemfile.lock
RUN gem install bundler:1.17.3
RUN bundle install
ADD . /linklab