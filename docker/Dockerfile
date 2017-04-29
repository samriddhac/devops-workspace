FROM ubuntu:latest
MAINTAINER Samriddha Chatterjee samriddhac@gmail.com

RUN apt-get update && \
apt-get install -y git-all curl 

#RUN curl -sL https://deb.nodesource.com/setup_7.x | -E bash -
RUN curl -sL https://deb.nodesource.com/setup_7.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs
RUN apt-get install build-essential
RUN mkdir -p projects/server
WORKDIR ~/projects/server
RUN git clone https://samriddhac@Severus11#:github.com/samriddhac/travelblogging.git
EXPOSE 8443
RUN npm run start:server
