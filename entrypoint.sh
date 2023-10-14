#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /opt/ty-dev/tmp/pids/server.pid

# Railsサービスが起動する前にデータベースが存在するか確認して、存在しない場合は作成する
bundle exec rails db:prepare

# seedデータのロード
bundle exec rails db:seed

# 初回起動時にyarn installを実行
# 新しい依存関係を追加するたびに、手動でdocker-compose run web yarn install
if [ ! -f '/opt/ty-dev/node_modules/.yarn-integrity' ]; then
  yarn install
  # JavaScriptのセットアップ
  # importmapの設定ファイルが存在しない場合のみ、セットアップを実行
  if [ ! -f "config/importmap.rb" ]; then
    bin/rails importmap:install
    /opt/ty-dev/bin/importmap pin @hotwired/turbo-rails
  fi
fi
# コマンドの実行
exec "$@"
