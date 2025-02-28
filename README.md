# PHP　cms docker docker-compose 部署

- Dockerfile 的主要功能是构建一个基于 PHP 7.3.33-fpm 的 Docker 镜像，同时安装一些必要的依赖和扩展，以便支持常见的 PHP 功能（如图像处理、数据库连接和缓存）。以下是 Dockerfile 的功能分解和详细说明：

~~~~~~
php 7.3 +
mysql:5.7.x +
nginx 1.17.2 +
~~~~~~

* 需要基础镜像
~~~~~~

docker pull mysql:5.7.29
docker pull 1.17.2

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

