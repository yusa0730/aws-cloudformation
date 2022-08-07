FROM public.ecr.aws/docker/library/ruby:3.1
RUN apt-get update -qq && \\
  apt-get install -y --no-install-recommends --no-install-suggests default-mysql-client && \\
  apt-get clean && \\
  rm -rf /var/lib/apt/lists/*

WORKDIR /awsmaster
COPY app/Gemfile /awsmaster/Gemfile
COPY app/Gemfile.lock /awsmaster/Gemfile.lock
RUN gem update bundler && \\
  bundle install

COPY app/ /awsmaster/
COPY containers/app/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]