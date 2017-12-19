FROM hzdan/storm:0.9.1
MAINTAINER  hzdan

RUN /usr/bin/config-supervisord.sh ui

EXPOSE 8080
CMD /usr/bin/start-supervisor.sh
