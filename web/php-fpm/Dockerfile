FROM php:7.3.27-fpm

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y procps
RUN apt-get install -y net-tools
RUN apt-get install -y vim
RUN apt-get install -y libwebp-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libpng-dev libxpm-dev
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libzip-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libxslt-dev
#
RUN pecl install xdebug && docker-php-ext-enable xdebug
RUN docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir \
    --with-png-dir --with-zlib-dir --with-xpm-dir --with-freetype-dir
RUN docker-php-ext-install gd
#
RUN docker-php-ext-install gettext
RUN docker-php-ext-install exif
RUN docker-php-ext-install shmop
RUN docker-php-ext-install soap
RUN docker-php-ext-install sockets
RUN docker-php-ext-install sysvmsg
RUN docker-php-ext-install sysvsem
RUN docker-php-ext-install sysvshm
RUN docker-php-ext-install wddx
RUN docker-php-ext-install xsl
RUN docker-php-ext-install zip
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install opcache
RUN pecl install -o -f redis && rm -rf /tmp/pear && docker-php-ext-enable redis
RUN apt-get install -y nginx
RUN mkdir /var/www/.sec

ADD usr/local/etc/php-fpm.conf /usr/local/etc/php-fpm.conf
ADD usr/local/etc/php-fpm.d/www.codeigniter.co.conf /usr/local/etc/php-fpm.d/
ADD usr/local/etc/php-fpm.d/www.laravel.co.conf /usr/local/etc/php-fpm.d/
RUN rm -rf /usr/local/etc/php-fpm.d/www.conf.default

ADD etc/php/php.ini $PHP_INI_DIR/
COPY etc/php/xdebug.ini $PHP_INI_DIR/conf.d/
