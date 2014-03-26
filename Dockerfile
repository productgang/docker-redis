FROM ubuntu:12.04
MAINTAINER Lukas Klein <lukas@productgang.com>
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y python-software-properties sudo
RUN apt-add-repository -y ppa:chris-lea/redis-server
RUN apt-get update
RUN apt-get install -y redis-server
RUN sysctl vm.overcommit_memory=1
ADD run /usr/local/bin/run
EXPOSE 6379
VOLUME ["/var/lib/redis"]
CMD ["/usr/local/bin/run"]
