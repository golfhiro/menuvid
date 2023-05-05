# #applicationのディレクトリ名で置き換えてください
# ARG APP_NAME=menu_vid
# #使いたいrubyのimage名に置き換えてください
# ARG RUBY_IMAGE=ruby:3.1.2
# #使いたいnodeのversionに置き換えてください(`15.14.0`ではなく`15`とか`16`とかのメジャーバージョン形式で書いてください)
# ARG NODE_VERSION='18'
# #インストールするbundlerのversionに置き換えてください
# ARG BUNDLER_VERSION=2.3.7

# FROM $RUBY_IMAGE
# ARG APP_NAME
# ARG RUBY_VERSION
# ARG NODE_VERSION
# ARG BUNDLER_VERSION

# ENV RAILS_ENV production
# ENV BUNDLE_DEPLOYMENT true
# ENV BUNDLE_WITHOUT development:test
# ENV RAILS_SERVE_STATIC_FILES true
# ENV RAILS_LOG_TO_STDOUT true

# RUN mkdir /$APP_NAME
# WORKDIR /$APP_NAME

# # 別途インストールが必要なものがある場合は追加してください
# RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
#   && wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
#   && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
#   && apt-get update -qq \
#   && apt-get install -y build-essential nodejs yarn

# RUN gem install bundler:$BUNDLER_VERSION

# COPY Gemfile /$APP_NAME/Gemfile
# COPY Gemfile.lock /$APP_NAME/Gemfile.lock

# RUN bundle install

# COPY yarn.lock /$APP_NAME/yarn.lock
# COPY package.json /$APP_NAME/package.json

# COPY . /$APP_NAME/

# RUN SECRET_KEY_BASE="$(bundle exec rake secret)" bin/rails assets:precompile assets:clean \
#   && yarn install --production --frozen-lockfile \
#   && yarn cache clean \
#   && rm -rf /$APP_NAME/node_modules /$APP_NAME/tmp/cache

# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000
# CMD ["rails", "server", "-b", "0.0.0.0"]


#元々のDockerfile
# FROM ruby:3.1.2

# ENV TZ Asia/Tokyo
# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && apt-get install -y vim

# # # Install yarn
# # RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
# #   && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
# #   && apt-get update \
# #   && apt-get install -y yarn

# # # Install npm
# # RUN apt-get update && apt-get install -y npm

# # 作業ディレクトリを指定
# RUN mkdir /myapp
# WORKDIR /myapp
# ADD Gemfile /myapp/Gemfile
# ADD Gemfile.lock /myapp/Gemfile.lock
# RUN bundle install
# COPY . /myapp

# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

# CMD ["rails", "server", "-b", "0.0.0.0"]


#元々のコードをリファクタリング。これに合わせてdockerfile-compose.ymlを変更している
FROM ruby:3.1.2

ENV TZ Asia/Tokyo
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && apt-get install -y vim

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update \
  && apt-get install -y yarn

# 作業ディレクトリを指定
WORKDIR /myapp

# ホストのGemfileとGemfile.lockをコンテナにコピー
COPY Gemfile Gemfile.lock /myapp/

# bundle installを実行
RUN bundle install

# ホストのカレントディレクトリをコンテナにコピー
COPY . /myapp

# entrypoint.shをコンテナ内の/usr/binにコピーし、実行権限を与える
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# ENTRYPOINTとCMDを統合
ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0", "-e", "production"]
# CMD ["rails", "server", "-b", "0.0.0.0"]
