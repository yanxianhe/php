FROM php:8.1.4-fpm

LABEL maintainer yan xianhe <xianhe_yan@sina.com>

#更新系统包

RUN apt-get update && apt-get install -y vim cron libfreetype6-dev libjpeg62-turbo-dev libzip-dev libjpeg-dev libpng-dev libfreetype-dev

#编译安装核心扩展
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
	docker-php-ext-install -j$(nproc) gd zip mysqli

#pecl 安装扩展
RUN pecl install redis-5.3.7 && \
    docker-php-ext-enable redis
