#　
FROM ruby:3.1.2

RUN apt update -qq
RUN mkdir /menuvid
WORKDIR /menuvid
COPY Gemfile /menuvid/Gemfile
COPY Gemfile.lock /menuvid/Gemfile.lock
RUN bundle install
COPY . /menuvid

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
