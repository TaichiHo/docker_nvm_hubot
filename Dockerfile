# first build the image from this dockerfile, then run it like: docker run -it yuehengh:nvm_hubot /bin/bash

FROM ubuntu:14.04

MAINTAINER Yueheng He <heyuehengtaichi@gmail.com>

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*  && sudo apt-get update && \
    sudo apt-get install -y libexpat1-dev \
    curl \
    git \
    build-essential libssl-dev
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 5.10.1
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default



ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm config set unsafe-perm true
RUN npm install -g yo generator-hubot
RUN npm install -g forever coffee-script

RUN adduser --disabled-password --gecos "" yeoman; \
  echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
ENV HOME /home/yeoman
USER yeoman
WORKDIR /home/yeoman


CMD ['/bin/bash']


