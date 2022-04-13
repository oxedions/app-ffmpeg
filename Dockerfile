FROM ubuntu:latest

RUN apt-get update; apt-get install wget tar xz-utils curl -y;

RUN mkdir /etc/NAE/

RUN wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz; tar xJvf ffmpeg-release-amd64-static.tar.xz; mv ffmpeg-5.0.1-amd64-static/ffmpeg /bin/ffmpeg; rm -Rf ffmpeg*;

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://cloud.nimbix.net/api/jarvice/validate

RUN mkdir -p /etc/NA && touch /etc/NAE/AppDef.json
