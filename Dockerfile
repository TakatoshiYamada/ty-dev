# ベースとなるRubyのイメージを指定
FROM ruby:3.2.1

# 必要なパッケージをインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev nodejs \
                       default-mysql-client \
                       imagemagick

# Yarnのインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# 作業ディレクトリを作成
RUN mkdir /opt/ty-dev

# 作業ディレクトリを指定
WORKDIR /opt/ty-dev

# ホストのGemfileとGemfile.lockをコピー
COPY Gemfile /opt/ty-dev/Gemfile
COPY Gemfile.lock /opt/ty-dev/Gemfile.lock

# BundlerでGemをインストール
RUN bundle install

# その他のアプリケーションファイルをコピー
COPY . /opt/ty-dev

# Yarnを使ってTailwind CSSと依存パッケージをインストール
RUN yarn add tailwindcss postcss autoprefixer

# コンテナが起動する際に実行されるコマンドを指定
CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
