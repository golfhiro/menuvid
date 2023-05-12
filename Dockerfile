# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.1.2
#これはDockerfileのベースイメージを設定するもので、指定されたRubyのバージョンとベースイメージの「slim」バリアントを使用します。ベースイメージは、"base "と呼ばれる中間イメージを作成するために使用されます。
FROM ruby:$RUBY_VERSION-slim as base

# Rails app lives here
#コンテナ内の作業ディレクトリを/railsに設定します。
WORKDIR /rails

# Set production environment
# コンテナの環境変数を設定します。ここでは、Railsの環境を「production」に設定し、bundlerで開発用とテスト用の依存関係を除外する設定をしています。
ENV RAILS_ENV="production" \
    BUNDLE_WITHOUT="development:test" \
    BUNDLE_DEPLOYMENT="1"

# Update gems and bundler
#RubyGemsのシステムを更新し、bundler gemをインストールします。
RUN gem update --system --no-document && \
    gem install -N bundler


# Throw-away build stage to reduce size of final image
# これまでの「base」イメージを利用して、「build」という新しいステージを定義しています。
FROM base as build

# Install packages needed to build gems and node modules
# build-essential、curl、libpq-dev、node-gyp、pkg-config、python-is-python3など、gemsやnodeモジュールの構築に必要なパッケージがインストールされます。
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential curl libpq-dev node-gyp pkg-config python-is-python3

# Install JavaScript dependencies
# Node.jsとYarnのバージョンを指定するための引数を定義する。
ARG NODE_VERSION=19.0.0
ARG YARN_VERSION=1.22.19
# Node.jsのバイナリへのパスをシステムのPATHに追加します。
ENV PATH=/usr/local/node/bin:$PATH
# 以下のRUNコマンドは、以下の動作を行います：
# node-build ツールをダウンロードし、抽出します。
# node-build を使用して、指定された Node.js バージョンをインストールします。
# 指定されたYarnのバージョンをグローバルにインストールします。
# 一時ファイルをクリーンアップします。
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
    npm install -g yarn@$YARN_VERSION && \
    rm -rf /tmp/node-build-master

# Install application gems
# ホストからGemfileとGemfile.lockをコンテナにコピーします。
COPY --link Gemfile Gemfile.lock ./
# Bundlerを使用してアプリケーションのgemsをインストールし、bootsnap precompilationを実行し、不要なファイルを削除してイメージサイズを小さくします。
RUN bundle install && \
    bundle exec bootsnap precompile --gemfile && \
    rm -rf ~/.bundle/ $BUNDLE_PATH/ruby/*/cache $BUNDLE_PATH/ruby/*/bundler/gems/*/.git

# Install node modules
# package.json、package-lock.json、yarn.lockをホストからコンテナにコピーします。
RUN yarn install --frozen-lockfile
# Yarnを使用して、JavaScriptの依存関係をインストールします。
COPY --link package.json package-lock.json yarn.lock ./

# Copy application code
# アプリケーションコード全体をコンテナにコピーする。
COPY --link . .

# Precompile bootsnap code for faster boot times
# 起動時間を短縮するために、bootsnapコードをプリコンパイルします
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
# 制作のためのアセットをプリコンパイルする。
RUN SECRET_KEY_BASE=DUMMY ./bin/rails assets:precompile
# server.pid ファイルが存在する場合は、削除します
RUN rm -f /rails/tmp/pids/server.pid

# Final stage for app image
# 次のセクションでは、"ベース "となる画像を使って新しいステージをスタートさせます
FROM base

# Install packages needed for deployment
# パッケージリストを更新し、PostgreSQLクライアントをインストールします。また、画像サイズを小さくするために、パッケージリストとアーカイブを削除します。
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y postgresql-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Run and own the application files as a non-root user for security
# ホームディレクトリを/rails、デフォルトシェルを/bin/bashに設定した「rails」という名前の新しいユーザを作成します。
RUN useradd rails --home /rails --shell /bin/bash
# 以降の指示のユーザーとグループを "rails:rails "に設定します。
USER rails:rails

# Copy built artifacts: gems, application
# インストールされたgemを「ビルド」段階から最終イメージにコピーします。
COPY --from=build /usr/local/bundle /usr/local/bundle
# アプリケーションコードを「ビルド」段階から最終イメージにコピーし、所有権とパーミッションを保持します。
COPY --from=build --chown=rails:rails /rails /rails

# Deployment options
# コンテナの環境変数を設定する。ここでは、STDOUTへのロギングを有効にし、静的ファイルの提供を可能にします。
ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true"

# Entrypoint prepares the database.
# コンテナ起動時に実行されるエントリポイントコマンドを設定します。
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
# コンテナとの通信のためにポート3000を公開する。
EXPOSE 3000
# コンテナ実行時にRailsサーバーを起動するためのデフォルトコマンドを設定します。
CMD ["./bin/rails", "server"]


# 要約すると、このDockerfileはRuby on Railsアプリケーション用の本番用Dockerイメージを構築します。必要な依存関係を設定し、gemsとJavaScriptの依存関係をインストールし、資産をプリコンパイルし、環境変数を設定し、Railsサーバを実行するためのエントリポイントとデフォルトコマンドを定義しています。
