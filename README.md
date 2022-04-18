# php

~~~~~~
php 7.2 +
mysql:5.7.x +
nginx 1.17.2 +
~~~~~~


* - 打包　容器镜像　cms:v1.0

~~~~~~
docker build -t cms:v1.0 .
~~~~~~

<kbd>docker-compose version 1.29.2<kbd>


* - 启动

~~~~~~
docker-compose -f docker-compose.yml up -d
~~~~~~

* - 停止

~~~~~~
docker-compose -f docker-compose.yml down
~~~~~~



