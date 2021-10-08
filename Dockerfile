FROM ruby:3-alpine


ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

RUN apk --no-cache add  \
        wget            \
        ca-certificates \
        libstdc++ \
        build-base \
        ruby \
        ruby-dev \
        sqlite-dev \
        ruby-nokogiri \
        zlib-dev

WORKDIR /usr/src/app

COPY Gemfile ./
COPY . .
RUN bundle update
RUN bundle install

CMD ["ruby","acoes.rb"]
