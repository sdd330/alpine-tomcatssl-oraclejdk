FROM sdd330/alpine-tomcat-oraclejdk 

MAINTAINER Yang Leijun <yang.leijun@gmail.com>

RUN mkdir /root/.ssh
WORKDIR /root/.ssh
RUN \
  openssl genpkey -algorithm rsa -out id_rsa && \
  openssl req -new -batch -key id_rsa -out id_rsa.csr && \
  openssl x509 -req -in id_rsa.csr -signkey id_rsa -out id_rsa.crt && \
  rm id_rsa.csr

WORKDIR /usr/tomcat
RUN sed -i '/<!--$/{N;/SSLEnabled/{N;N;N;s/.*<!--\n\(.*\)\/>\n.*-->/\1SSLCertificateFile="\/root\/.ssh\/id_rsa.crt" SSLCertificateKeyFile="\/root\/.ssh\/id_rsa" SSLVerifyClient="optional" \/>/}}' conf/server.xml

EXPOSE 8443
