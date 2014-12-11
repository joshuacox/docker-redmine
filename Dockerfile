FROM joshuacox/ubuntu-nginx
MAINTAINER Josh Cox "josh at webhosting coop"

RUN apt-get update
RUN apt-get install -y supervisor logrotate nginx mysql-client postgresql-client \
      imagemagick subversion git cvs bzr mercurial rsync ruby2.1 locales openssh-client \
      gcc g++ make patch pkg-config ruby2.1-dev libc6-dev \
      libmysqlclient18 libpq5 libyaml-0-2 libcurl3 libssl1.0.0 \
      libxslt1.1 libffi6 zlib1g
RUN  update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX
RUN  gem install --no-document bundler
RUN  rm -rf /var/lib/apt/lists/

ADD assets/setup/ /app/setup/
RUN chmod 755 /app/setup/install
RUN /app/setup/install

ADD assets/config/ /app/setup/config/
ADD assets/init /app/init
RUN chmod 755 /app/init

#EXPOSE 80
#EXPOSE 443

#VOLUME ["/home/redmine/data"]
#VOLUME ["/var/log/redmine"]

#ENTRYPOINT ["/app/init"]
#CMD ["app:start"]
