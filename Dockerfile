# Base docker image for building XEPs
# Sets up directories and dependencies
# docker build . -t xmppxsf/xeps-base -f Dockerfile.base

FROM debian:10
MAINTAINER XSF Editors <editor@xmpp.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        xsltproc libxml2-utils libxml2 texlive fonts-inconsolata make nginx \
        curl python python-pip texlive-xetex texlive-fonts-recommended \
        texlive-fonts-extra lmodern python3 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*<F12>

COPY default.conf /etc/nginx/sites-available/default

RUN mkdir -p /src/resources /var/www/html/registrar
