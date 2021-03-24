FROM marvambass/nginx-ssl-secure
#Installing PHP and Configuring Nginx to Use the PHP Processor
RUN apt-get update; apt-get install php-fpm php-mysql -y

RUN apt-get install -y \
  nano \
  curl \
  git \
  wget \
  iputils-ping \
  zip \
  unzip \
  php-curl \
  php-gd \
  php-xml \
  php-mbstring \
  php-soap \
  mcrypt

RUN apt-get clean
ADD php.ini /etc/php/7.3/fpm/php.ini
# fix pathinfo see: (https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-14-04)
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.3/fpm/php.ini

# add 'service php5-fpm start' to entrypoint.sh
RUN sed -i 's/#!\/bin\/bash/#!\/bin\/bash\n\/etc\/init.d\/php7.3-fpm start\nchmod a+rwx \/var\/run\/php7.3-fpm.sock/g' /opt/entrypoint.sh
