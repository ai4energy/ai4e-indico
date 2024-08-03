FROM nginx:1.27.0

LABEL maintainer="Mingtao Li <mingtao@xjtu.edu.cn>" \
      version="3.3.3" \
      description="NGINX server for Indico static files"

# USER root

# RUN set -ex \
#     && apt-get update \
#     && apt-get install --no-install-recommends --no-install-suggests -y \
#         python3-venv \
#         unzip \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# RUN python3 -m venv /opt/venv \
#     && /opt/venv/bin/pip install -U pip setuptools \
#     && mkdir /tmp/indico-pip \
#     && /opt/venv/bin/pip download --no-deps -d /tmp/indico-pip indico==3.3.3 \
#     && unzip /tmp/indico-pip/indico-*.whl -d /opt 'indico/web/static/*' \
#     && rm -rf /tmp/indico-pip \
#     && ln -sf /dev/stdout /var/log/nginx/access.log \
#     && ln -sf /dev/stderr /var/log/nginx/error.log

COPY indico.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
