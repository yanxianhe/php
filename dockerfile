FROM php:7.3.33-fpm

LABEL maintainer yan xianhe <xianhe_yan@sina.com>

RUN sed -i 's#http://deb.debian.org/debian#http://mirrors.aliyun.com/debian#g' /etc/apt/sources.list
RUN sed -i 's#http://security.debian.org/debian-security#http://mirrors.aliyun.com/debian-security#g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    vim \
    cron \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    zlib1g-dev \
    libonig-dev

# 编译安装核心扩展
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd zip mysqli

# 使用 PECL 安装扩展
RUN pecl install redis-5.3.7 && docker-php-ext-enable redis