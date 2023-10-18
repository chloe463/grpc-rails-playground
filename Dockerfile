FROM ruby:3.2.2-slim-buster

ENV BUNDLER_VERSION 2.4.10

RUN gem install bundler --version "$BUNDLER_VERSION" \
  # Ignore warning: "Don't run Bundler as root."
  # @see https://github.com/docker-library/rails/issues/10
  && bundle config --global silence_root_warning 1 \
	# Ignore insecure `git` protocol for gem
  && bundle config --global git.allow_insecure true \
	&& bundle config set --local path 'vendor/bundle' \
	&& bundle config set --local without 'test development' \
	&& bundle config set --global force_ruby_platform true

RUN apt-get update && \
	apt-get install -y g++ cmake sqlite3 \
	zlib1g-dev liblzma-dev patch xz-utils pkg-config

ENV TZ Asia/Tokyo

WORKDIR /app

COPY Gemfile /app
COPY Gemfile.lock /app
RUN bundle install --jobs 8

COPY . /app

ENV PATH $PATH:/app/vendor/bundle/bin
ENV RAILS_ENV production
RUN bundle exec rails db:migrate && bundle exec rails db:seed

ENV PORT 50051

EXPOSE 50051

CMD ["bundle", "exec", "rails", "runner", "script/grpc-server.rb"]
