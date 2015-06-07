# Alpine Tomcat SSL
------------
Tomcat SSL Oracle JDK7 Version based on Alpine Linux

## Usage

To start an instance:

	docker run -d -p 8443:8443 --name tomcat-server sdd330/alpine-tomcatssl-oraclejdk
	
To start an instance and mount webapps:

	docker run -d -p 8443:8443 -v [webapps dir]:/usr/tomcat/webapps --name tomcat-ssl-server sdd330/alpine-tomcatssl-oraclejdk

To start with jmx and debug support:

	docker run -d -p 8443:8443 -p 9004:9004 -p 8000:8000 -e JMX=true -e JMX_HOSTNAME=192.168.59.103 --name tomcat-ssl-server sdd330/alpine-tomcatssl-oraclejdk

To login to bash:
	
	docker exec -it tomcat-ssl-server bash

The tomcat ssl server is only for testing purpose, do not use it in production enviroment.
If you use, take your own risk! 
