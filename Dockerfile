# Dockerfile for Geant4 Runtime

ARG g4version="11.3.0"

FROM ubuntu:latest AS sdk
LABEL maintener="Koichi Murakami <koichi.murakami@kek.jp>"

ARG g4version
ENV DEBIAN_FRONTEND=nointeractive

RUN apt update && \
    apt install -y tcsh zsh sudo make build-essential vim \
                   libexpat1-dev libboost-dev \
                   git cmake wget && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /opt/geant4/

FROM sdk AS build
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
FROM sdk AS release

ARG g4version

RUN mkdir -p /opt/geant4/data

#
WORKDIR /opt/geant4
COPY --from=build /opt/geant4/${g4version} .

WORKDIR /opt/geant4/data
COPY --from=build /opt/geant4/data .

WORKDIR /
