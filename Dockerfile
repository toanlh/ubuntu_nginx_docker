FROM ubuntu:18.04
MAINTAINER toanlh<lehuutoan@gmail.com>
RUN DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y nginx
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections \
    && echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections \
    && apt-get install -y mysql-server \
	&& apt-get install php-fpm php-mysql
WORKDIR /venv
COPY start.sh /venv
RUN chmod a+x /venv/*
ENTRYPOINT ["/venv/start.sh"]
EXPOSE 80
