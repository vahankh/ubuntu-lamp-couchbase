FROM vahankh/ubuntu-lamp
MAINTAINER Vahan K 

RUN \
  wget http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-4-amd64.deb && \ 
  dpkg -i couchbase-release-1.0-4-amd64.deb && \ 
  apt-get update && \
  apt-get install -y libcouchbase-dev zlib1g-dev && \
  pecl install pcs-1.3.3 # since couchbase-2.2.4

RUN pecl install couchbase

RUN \
  apt-get install -y gcc make autoconf libc-dev pkg-config && \
  apt-get install -y libssl-dev && \
  apt-get install -y librabbitmq-dev && \
  apt-get install -y php7.0-mbstring php7.0-bcmath && \
  printf "\n" | pecl install amqp


COPY 30-pcs.ini /etc/php/7.0/cli/conf.d/
COPY 30-pcs.ini /etc/php/7.0/fpm/conf.d/
COPY 30-pcs.ini /etc/php/7.0/apache2/conf.d/
COPY 30-couchbase.ini /etc/php/7.0/cli/conf.d/
COPY 30-couchbase.ini /etc/php/7.0/fpm/conf.d/
COPY 30-couchbase.ini /etc/php/7.0/apache2/conf.d/
COPY 30-ampq.ini /etc/php/7.0/cli/conf.d/
COPY 30-ampq.ini /etc/php/7.0/fpm/conf.d/
COPY 30-ampq.ini /etc/php/7.0/apache2/conf.d/



