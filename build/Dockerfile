FROM genlot/java:8u23
MAINTAINER Janson <dehua.ye@genlot.com>
ENV TOMCAT_PACKAGE=apache-tomcat-8.0.23
ENV TOMCAT_DIR=tomcat8
ADD $TOMCAT_PACKAGE.tar.gz /var/lib/
WORKDIR /var/lib
RUN mv $TOMCAT_PACKAGE $TOMCAT_DIR
#VOLUME /opt/docker/
#WORKDIR /opt/docker
EXPOSE 8080
CMD $TOMCAT_DIR/bin/startup.sh && tail -f $TOMCAT_DIR/logs/catalina.out
#ENTRYPOINT CMD $TOMCAT_DIR/bin/startup.sh
#docker build -t getlot/tomcat:8u23 /var/lib/dockerfile/tomcat8/
#docker run -d --name tomcat8 -p 8009:8080 -v /var/lib/webapps/:/var/lib/tomcat8/webapps:ro genlot/tomcat:8u23
