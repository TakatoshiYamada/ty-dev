#!/bin/bash
set -e

# Railsサービスが起動する前にデータベースが存在するか確認して、存在しない場合は作成する
bundle exec rails db:prepare

# コマンドの実行
exec "$@"
