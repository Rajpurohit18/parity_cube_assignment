# Stage 1: Build
FROM ruby:3.2-slim as builder

WORKDIR /app

# Install build dependencies including libyaml-dev (needed for psych gem)
RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  libyaml-dev \
  nodejs \
  yarn \
  git \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY Gemfile* ./
RUN bundle install

COPY . .

# Stage 2: Final runtime image
FROM ruby:3.2-slim

WORKDIR /app

# Install only runtime dependencies (libpq-dev and optional libyaml-dev if required by psych at runtime)
RUN apt-get update && apt-get install -y \
  libpq-dev \
  libyaml-dev \
  nodejs \
  yarn \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app /app
COPY --from=builder /usr/local/bundle /usr/local/bundle

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
