FROM ruby:2.4.1

RUN echo Asia/Tokyo > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /app
WORKDIR /app

# Ruby on Rails
Add Gemfile /app/Gemfile
Add Gemfile.lock /app/Gemfile.lock
RUN bundle install -j4

WORKDIR /app
ADD . /app
