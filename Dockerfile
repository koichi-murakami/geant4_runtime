# Dockerfile for Geant4 Runtime

FROM ubuntu:latest as sdk
LABEL maintener="Koichi Murakami <koichi.murakami@kek.jp>"

ENV DEBIAN_FRONTEND=nointeractive

ARG g4version="11.0.0"

#
RUN apt update && \
    apt install -y make build-essential libexpat1-dev cmake wget && \
    mkdir -p /opt/geant4/build

#
WORKDIR /opt/geant4
RUN wget https://geant4-data.web.cern.ch/releases/geant4-v${g4version}.tar.gz && \
    tar zxvf geant4-v${g4version}.tar.gz

#
WORKDIR /opt/geant4/build
RUN cmake -DCMAKE_INSTALL_PREFIX=/opt/geant4/${g4version} \
          -DGEANT4_INSTALL_DATA=ON \
          -DGEANT4_INSTALL_DATADIR=/opt/geant4/data ../geant4-v${g4version} && \
    make -j`nproc` && \
    make install

# -------------------------------------------------------------------
FROM ubuntu:latest
LABEL maintener="Koichi Murakami <koichi.murakami@kek.jp>"

ENV DEBIAN_FRONTEND=nointeractive

ARG g4version="11.0.0"

RUN apt update && \
    apt install -y tcsh zsh sudo make build-essential vim \
                   libboost-dev libexpat1-dev libxerces-c-dev \
                   libcpputest-dev git cmake wget && \
    mkdir -p /opt/geant4/data

#
WORKDIR /opt/geant4
COPY --from=sdk /opt/geant4/${g4version} .

WORKDIR /opt/geant4/data
COPY --from=sdk /opt/geant4/data .

#
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /
