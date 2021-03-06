FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends supervisor cron busybox-syslogd logrotate python3-apt

COPY ./supervisord.conf /etc/supervisor/supervisord.conf
COPY ./docker-apt-upgrade /usr/bin/docker-apt-upgrade
COPY ./bootstrap.sh /bootstrap.sh

RUN chmod +x /usr/bin/docker-apt-upgrade
RUN echo "0 0 * * * root /usr/bin/docker-apt-upgrade" >> /etc/crontab
RUN touch /etc/default/locale
RUN addgroup syslog

VOLUME /conf

CMD ["/bootstrap.sh"]
