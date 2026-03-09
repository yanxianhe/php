FROM php:5.6.40-fpm

LABEL maintainer="yan xianhe <xianhe_yan@sina.com>"

# 配置 Debian 9 归档源
RUN echo "deb [trusted=yes] http://archive.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src [trusted=yes] http://archive.debian.org/debian stretch main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb [trusted=yes] http://archive.debian.org/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src [trusted=yes] http://archive.debian.org/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99no-check

# 安装依赖
RUN apt-get update && apt-get install -y \
    vim \
    cron \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libzip-dev \
    libjpeg-dev \
    libpng-dev \
    && rm -rf /var/lib/apt/lists/*

# 编译安装核心扩展（PHP 5.6 使用 -dir 格式）
RUN docker-php-ext-configure gd \
    --with-freetype-dir=/usr \
    --with-jpeg-dir=/usr \
    --with-png-dir=/usr \
    && docker-php-ext-install -j$(nproc) gd zip mysqli

# pecl 安装扩展
RUN pecl install redis-4.3.0 && \
    docker-php-ext-enable redis
