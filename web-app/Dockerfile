FROM ruby:2.5.3

RUN touch /etc/apt/sources.list
RUN echo "" > /etc/apt/sources.list
RUN echo -n "" > /etc/apt/sources.list
# RUN echo "deb https://archive.debian.org/debian stretch main contrib non-free" >> /etc/apt/sources.list 
# RUN echo "deb-src https://archive.debian.org/debian stretch main contrib non-free" >> /etc/apt/sources.list 
# RUN echo "deb https://archive.debian.org/debian stretch-backports main contrib non-free" >> /etc/apt/sources.list 
# RUN echo  "deb https://archive.debian.org/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list 
# RUN echo  "deb-src https://archive.debian.org/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list

RUN echo "deb http://archive.debian.org/debian/ stretch main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb-src http://archive.debian.org/debian/ stretch main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://archive.debian.org/debian/ stretch-proposed-updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://archive.debian.org/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb-src http://archive.debian.org/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update -qq && apt-get install apt-transport-https ca-certificates

RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
## RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn 
RUN apt-get update && apt-get install -y yarn nano

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install -y nodejs


ENV RAILS_ENV=production
ENV RACK_ENV=production 
ENV NODE_ENV=production

ENV RAILS_ROOT /web-app

ENV BUNDLE_PATH /gems
ENV BUNDLE_HOME /gems

ARG BUNDLE_JOBS=20
ENV BUNDLE_JOBS $BUNDLE_JOBS
ARG BUNDLE_RETRY=5
ENV BUNDLE_RETRY $BUNDLE_RETRY

ENV GEM_HOME /gems
ENV GEM_PATH /gems

ENV PATH /gems/bin:$PATH

RUN mkdir -p $GEM_HOME
RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT

RUN mkdir -p node_modules
RUN mkdir -p public/packs
RUN mkdir -p tmp/cache

COPY Gemfile $RAILS_ROOT/Gemfile
# COPY Gemfile.lock $RAILS_ROOT/Gemfile.lock

COPY . $RAILS_ROOT
RUN gem install bundler -v 2.3.2
RUN bundle install

RUN export NODE_OPTIONS="--max-old-space-size=4096"
# RUN yarn install 
RUN yarn install --check-files --ignore-engines
RUN bundle exec rake db:migrate
# RUN bundle exec rake db:seed
# RUN bundle exec rake assets:precompile
# RUN bundle exec rails credentials:edit --environment production

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
