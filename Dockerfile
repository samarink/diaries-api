FROM ruby:3.0.1

RUN apt-get update -qq && \
  apt-get install -y nodejs yarn postgresql-client && \
  gem install bundler:2.2.20

WORKDIR /app
COPY . .

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

RUN bundle install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
