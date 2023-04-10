FROM ruby:3.1.2

ENV TZ Asia/Tokyo
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && apt-get install -y vim

# # Install yarn
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
#   && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
#   && apt-get update \
#   && apt-get install -y yarn

# # Install npm
# RUN apt-get update && apt-get install -y npm

# 作業ディレクトリを指定
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
