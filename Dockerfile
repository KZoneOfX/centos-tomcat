# Centos based container with Java and Tomcat
FROM xiaoluyy/cantos7
MAINTAINER zhangxiaoke@xiaoluyy.com
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN yum -y install wget && \
 yum -y install tar
RUN wget -O jre.rpm http://javadl.oracle.com/webapps/download/AutoDL?BundleId=225344_090f390dda5b47b9b721c7dfaa008135 && \
 yum  -y install jre.rpm
RUN wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-7/v7.0.81/bin/apache-tomcat-7.0.81.tar.gz && \
 tar xvf apache-tomcat-7.0.81.tar.gz && \
 mv apache-tomcat-7.0.81 /usr/local/tomcat && \
 rm -rf apache-tomcat-7.0.81.tar.gz && \
 rm -rf jre.rpm
WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh", "run"]
