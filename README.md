docker exec -it docker_ror6_nginx_1_c23461810e2c /bin/sh
ls /etc/nginx/conf.d

docker exec -it docker_ror6_nginx_1_c23461810e2c /bin/ls /etc/nginx/conf.d

docker-compose exec nginx /bin/sh

docker-compose exec nginx cat /etc/nginx/conf.d/webapp-nginx.conf

docker-compose exec nginx service nginx reload