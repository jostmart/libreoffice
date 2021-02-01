FROM ubuntu:latest as base

ENV DEBIAN_FRONTEND=noninteractive

# Install tools required for Libre project 

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository --yes ppa:libreoffice/ppa
RUN apt-get -y -q install gdb libreoffice libreoffice-writer ure libreoffice-java-common libreoffice-core libreoffice-common openjdk-8-jre fonts-opensymbol hyphen-fr hyphen-de hyphen-en-us hyphen-it hyphen-ru fonts-dejavu fonts-dejavu-core fonts-dejavu-extra fonts-droid-fallback fonts-dustin fonts-f500 fonts-fanwood fonts-freefont-ttf fonts-liberation fonts-lmodern fonts-lyx fonts-sil-gentium fonts-texgyre fonts-tlwg-purisa

# Headless-Libreoffice
RUN apt-get -y -q remove libreoffice-gnome

RUN apt-get clean

EXPOSE 8997

# Libreoffice user customization
RUN adduser --home=/opt/libreoffice --disabled-password --gecos "" --shell=/bin/bash libreoffice

ADD entrypoint.sh /opt/libreoffice/entrypoint.sh
RUN chmod +x /opt/libreoffice/entrypoint.sh

VOLUME ["/tmp"]
WORKDIR "/tmp"

ENTRYPOINT ["/opt/libreoffice/entrypoint.sh"]
