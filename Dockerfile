FROM bitnami/rails:latest
MAINTAINER Easy Check-in Team <admin@chatops.in>

USER root
RUN install_packages libsqlite3-dev

USER bitnami

WORKDIR /app

COPY Gemfile* ./
RUN bundle install
COPY . .