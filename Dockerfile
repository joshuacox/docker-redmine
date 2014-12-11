FROM joshuacox/ubuntu-nginx
MAINTAINER Josh Cox "josh at webhosting coop"

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
