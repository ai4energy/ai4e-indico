FROM python:3.12.4

LABEL maintainer="Mingtao Li <mingtao@xjtu.edu.cn>" \
      version="3.3.3" \
      description="Indico setup on Python 3.12.4 (Debian bookworm)"

ENV INDICO_VIRTUALENV="/opt/indico/.venv" INDICO_CONFIG="/opt/indico/etc/indico.conf"

ARG pip="${INDICO_VIRTUALENV}/bin/pip"
ARG version=3.3.3

USER root

RUN set -ex && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    dialog \
    texlive-xetex \
    libpq-dev \
    postgresql-client \
    vim \
    less \
    gcc \
    gettext \
    libldap2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p --mode=775 /opt/indico/etc && \
    mkdir -p --mode=775 /opt/indico/tmp && \
    mkdir -p --mode=775 /opt/indico/log && \
    mkdir -p --mode=775 /opt/indico/cache && \
    mkdir -p --mode=775 /opt/indico/archive && \
    python3 -m venv ${INDICO_VIRTUALENV} && \
    ${pip} install --upgrade pip setuptools && \
    ${pip} install uwsgi && \
    ${pip} install indico==${version} && \
    ${INDICO_VIRTUALENV}/bin/indico setup create-symlinks /opt/indico && \
    ${INDICO_VIRTUALENV}/bin/indico setup create-logging-config /opt/indico/etc && \
    chgrp -R 0 /opt/indico

COPY indico.conf logging.yaml /opt/indico/etc/
COPY uwsgi.ini /etc/uwsgi.ini
COPY run_indico.sh run_celery.sh set_user.sh /opt/indico/

RUN chmod 755 /opt/indico/*.sh && \
    chmod g=u /etc/passwd

EXPOSE 59999
