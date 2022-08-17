FROM ruby
RUN gem install rails rubocop
RUN apt-get update \
    && apt-get install -y sqlite3 nodejs yarn \
    && apt-get clean