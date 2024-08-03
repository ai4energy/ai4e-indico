# indico

```shell
mkdir -p /srv/indico
mkdir -p /srv/indico/archive
mkdir -p /srv/indico/custom
mkdir -p /srv/indico/log/nginx
mkdir -p /srv/indico/nginx.conf.d
cp deploy/docker-compose/indico/docker-compose.yaml /srv/indico
cp deploy/docker-compose/indico/00indico-front-nginx-indico.conf /srv/indico/nginx.conf.d/indico.conf
cd /srv/indico
docker compose up -d
```