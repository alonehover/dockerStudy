FROM php:5.6-fpm

LABEL maintainer=alonehover

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        libmemcached-dev \
        libz-dev \
        libpq-dev \
        libjpeg-dev \
        libpng12-dev \
        libfreetype6-dev \
        libssl-dev \
        libmcrypt-dev

RUN docker-php-ext-install \
    mcrypt \
    mysqli \
    pdo_mysql \
    pdo_pgsql
    
RUN docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/lib \
        --with-freetype-dir=/usr/include/freetype2 && \
    docker-php-ext-install gd

# http://pecl.php.net/get/xdebug-2.5.5.tgz
COPY ./pkg/xdebug-2.5.5.tgz /home/xdebug.tgz
RUN pecl install /home/xdebug.tgz \
    && docker-php-ext-enable xdebug \
    && rm -rf /home/xdebug.tgz

# http://pecl.php.net/get/redis-4.0.2.tgz
COPY ./pkg/redis-4.0.2.tgz /home/redis.tgz
RUN printf "\n" | pecl install /home/redis.tgz \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis \
    && rm -rf /home/redis.tgz

# https://github.com/phalcon/cphalcon/archive/v3.2.0.tar.gz
COPY ./pkg/cphalcon-3.2.0.tar.gz /home/cphalcon.tar.gz
RUN tar xzf /home/cphalcon.tar.gz && cd cphalcon-3.2.0/build \
    && ./install \
    && echo "extension=phalcon.so" > /usr/local/etc/php/conf.d/phalcon.ini \
    && rm -rf /home/cphalcon.tar.gz cphalcon-3.2.0

RUN curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/2.2.0.tar.gz" \
    && mkdir -p memcached \
    && tar -C memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
    && ( \
        cd memcached \
        && phpize \
        && ./configure \
        && make -j$(nproc) \
        && make install \
    ) \
    && rm -r memcached \
    && rm /tmp/memcached.tar.gz \
    && docker-php-ext-enable memcached