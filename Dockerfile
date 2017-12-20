FROM ruby:2.4.3-alpine

RUN apk update \
  && apk upgrade \
  && apk add --update \
  tzdata \
  git \
  linux-headers \
  build-base \
  postgresql-dev \
  && rm -rf /var/cache/apk/*

WORKDIR /usr/src/app

RUN gem install bundler

COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs 2 --retry 1

COPY . .

EXPOSE 3007

CMD ["bundle", "exec", "rails", "server", "-p", "3010", "-b", "0.0.0.0"]
