FROM ruby:3.2.2-bullseye

RUN apt-get update -qq && apt-get install -y build-essential \
    postgresql-client \
    libpq-dev \
    graphviz

WORKDIR /home/events_ms
COPY Gemfile /home/events_ms/Gemfile
COPY Gemfile.lock /home/events_ms/Gemfile.lock
RUN bundle install

RUN chown -R $USER:$USER .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0"]
