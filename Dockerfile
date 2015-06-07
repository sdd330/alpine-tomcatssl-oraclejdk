FROM sdd330/alpine-tomcat-oraclejdk 

MAINTAINER Yang Leijun <yang.leijun@gmail.com>

RUN mkdir /root/.ssh
WORKDIR /root/.ssh
RUN \
  openssl genpkey -algorithm rsa -out id_rsa && \
  openssl req -new -batch -key id_rsa -out id_rsa.csr && \
  openssl x509 -req -in id_rsa.csr -signkey id_rsa -out id_rsa.crt && \
  rm id_rsa.csr

WORKDIR $CATALINA_HOME

ADD server.xml $CATALINA_HOME/conf/server.xml

EXPOSE 8443
