FROM php:7.3-fpm

ENV COMPOSER_MEMORY_LIMIT='-1'

RUN apt-get update && \
    apt-get install -y --force-yes --no-install-recommends \
    bash \
    libmemcached-dev \
    libmcrypt-dev \
    libreadline-dev \
    libgmp-dev \
    libzip-dev \
    libz-dev \
    libpq-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libssl-dev \
    libmagickwand-dev \
    libxml2-dev

# Install docker PHP extensions
RUN docker-php-ext-install bcmath \
    exif \
    gmp \
    intl \
    pcntl \
    pdo_pgsql \
    soap \
    zip

# Install the PHP Redis
RUN pecl install redis && docker-php-ext-enable redis

# Install the PHP imagick
RUN pecl install imagick && docker-php-ext-enable imagick

# Install the PHP gd library
RUN docker-php-ext-install gd && \
    docker-php-ext-configure gd \
    --with-jpeg-dir=/usr/lib \
    --with-freetype-dir=/usr/include/freetype2 && \
    docker-php-ext-install gd

# Install the xdebug extension
RUN pecl install xdebug

# Install the php memcached extension
RUN pecl install memcached && docker-php-ext-enable memcached

# Install composer and add its bin to the PATH.
RUN curl -s http://getcomposer.org/installer | php && \
    echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc && \
    mv composer.phar /usr/local/bin/composer

RUN rm -r /var/lib/apt/lists/*
RUN usermod -u 1000 www-data

WORKDIR /var/www

EXPOSE 9000

CMD [ "php-fpm" ]