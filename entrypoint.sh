#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /opt/ty-dev/tmp/pids/server.pid

# MySQLが起動するのを待つ
until mysqladmin ping -h"$DB_HOST" --silent; do
    echo 'waiting for mysqld to be connectable...'
    sleep 1
done
echo "MySQL is up and running!"

# Railsサービスが起動する前にデータベースが存在するか確認して、存在しない場合は作成する
bundle exec rails db:prepare

# seedデータのロード
bundle exec rails db:seed

if [ ! -f '/opt/ty-dev/node_modules/.yarn-integrity' ]; then
  # JavaScriptのセットアップ
  # importmapの設定ファイルが存在しない場合のみ、セットアップを実行
  if [ ! -f "config/importmap.rb" ]; then
    bin/rails importmap:install
    /opt/ty-dev/bin/importmap pin @hotwired/turbo-rails
  fi
fi

# アセットプリコンパイルのコマンドを追加
bundle exec rails assets:precompile

exec "$@"
