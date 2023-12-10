# ベースとなるRubyのイメージを指定
FROM ruby:3.2.1

# 必要なパッケージをインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       default-mysql-client \
                       imagemagick

# Node.jsのソースリストを追加し、Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Yarnのインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# 作業ディレクトリを作成
RUN mkdir /opt/ty-dev

# 作業ディレクトリを指定
WORKDIR /opt/ty-dev

# ホストのGemfileとGemfile.lockをコピー
COPY Gemfile /opt/ty-dev/Gemfile
COPY Gemfile.lock /opt/ty-dev/Gemfile.lock

# BundlerでGemをインストール
RUN bundle install

# ホストのpackage.jsonとyarn.lockをコピー
COPY package.json yarn.lock /opt/ty-dev/

# Yarnでnpmパッケージをインストール
RUN yarn install

# その他のアプリケーションファイルをコピー
COPY . /opt/ty-dev

# コンテナが起動する際に実行されるコマンドを指定
CMD ["bundle", "exec", "rails", "s", -p", "3000", "-b", "0.0.0.0"]

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
