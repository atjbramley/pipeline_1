# Basic containerised webserver with webcontent

FROM ubuntu:18.04
LABEL description="Demo containerised webserver"
LABEL maintainer="Adam Bramley - adam@purplebeard.co.uk"
RUN apt-get update && \
    apt-get install apache2 -y
WORKDIR /var/www/html/
COPY /web/index.html .
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ curl -f http://localhost || exit 1 ]
EXPOSE 80/tcp
ENTRYPOINT [ "apache2ctl", "-D", "FOREGROUND" ]
