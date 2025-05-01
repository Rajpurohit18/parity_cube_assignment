# Stage 1: Build
FROM ruby:3.2-slim as builder

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs yarn git

COPY Gemfile* ./
RUN bundle install

COPY . .

# Stage 2: Final runtime image
FROM ruby:3.2-slim

WORKDIR /app

RUN apt-get update && apt-get install -y libpq-dev nodejs yarn \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app /app
COPY --from=builder /usr/local/bundle /usr/local/bundle

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
