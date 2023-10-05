#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /opt/ty-dev/tmp/pids/server.pid

# Railsサービスが起動する前にデータベースが存在するか確認して、存在しない場合は作成する
bundle exec rails db:prepare

# コマンドの実行
exec "$@"
