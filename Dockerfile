FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN apt-get install unixodbc-dev -y
RUN gem install ruby-odbc -v '0.99999'
RUN bundle install
COPY . /myapp