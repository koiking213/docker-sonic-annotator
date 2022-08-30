FROM ubuntu:20.04

RUN apt-get -y update \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install wget libglib2.0-0 libfuse2 libkeyutils-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
RUN wget https://code.soundsoftware.ac.uk/attachments/download/2708/sonic-annotator-1.6-linux64-static.tar.gz \
 && tar xvf sonic-annotator-1.6-linux64-static.tar.gz \
 && cp sonic-annotator-1.6-linux64-static/sonic-annotator /usr/local/bin
COPY plugins /usr/local/lib/vamp
ENTRYPOINT ["sonic-annotator"]
