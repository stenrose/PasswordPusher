#!/bin/bash
set -e

export RAILS_ENV=production

echo "Password Pusher: migrating database to latest..."
bundle exec rake db:migrate
echo "Password Pusher: precompiling assets..."
bundle exec rails webpacker:compile
echo "Password Pusher: starting puma webserver..."
bundle exec puma -C config/puma.rb

exec "$@"
