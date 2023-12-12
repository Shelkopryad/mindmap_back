FROM ruby:2.7.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler
RUN mkdir /mindmap_back
WORKDIR /mindmap_back
COPY Gemfile /mindmap_back/Gemfile
COPY Gemfile.lock /mindmap_back/Gemfile.lock
RUN bundle install
COPY . /mindmap_back
EXPOSE 3001