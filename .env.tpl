NETWORKS_DRIVER=bridge

DOCKER_HOST_IP=10.0.75.1

REDIS_PORT=6379
REDIS_DATA_PATH=./data

NGINX_HOST_HTTP_PORT=80
NGINX_HOST_HTTPS_PORT=443
NGINX_LOG_PATH_ORIGIN=./log/nginx/
NGINX_LOG_PATH_CONTAINER=/var/log/nginx/
NGINX_CONFIG_PATH_ORIGIN=./nginx/conf.d/
NGINX_CONFIG_PATH_CONTAINER=/etc/nginx/conf.d/


APP_CODE_PATH_ORIGIN=../
APP_CODE_PATH_CONTAINER=/usr/share/nginx/html

LOG_PATH_ORIGIN=./log/project
LOG_PATH_CONTAINER=/var/log/project
