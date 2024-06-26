FROM ubuntu:20.04 
MAINTAINER "info@wiculty.com"
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr
ADD apache-tomcat-9.0.89.tar.gz /root
COPY target/gamutkart.war /root/apache-tomcat-9.0.89/webapps
ENTRYPOINT /root/apache-tomcat-9.0.89/bin/startup.sh && bash

