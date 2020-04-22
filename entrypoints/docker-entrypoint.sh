#!/bin/sh
set -e

echo '--- run yarn install'
yarn install --check-files

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
bundle exec rails s -b 0.0.0.0