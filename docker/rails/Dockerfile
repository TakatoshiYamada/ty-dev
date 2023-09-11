# ベースとなるRubyのイメージを指定
FROM ruby:3.0.2

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# 作業ディレクトリを作成
RUN mkdir /opt/ty-dev

# 作業ディレクトリを指定
WORKDIR /opt/ty-dev

# ホストのGemfileとGemfile.lockをコピー
COPY Gemfile /opt/myapp/Gemfile
COPY Gemfile.lock /opt/myapp/Gemfile.lock

# BundlerでGemをインストール
RUN bundle install

# その他のアプリケーションファイルをコピー
COPY . /opt/myapp

# コンテナが起動する際に実行されるコマンドを指定
CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
