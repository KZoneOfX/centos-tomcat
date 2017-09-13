# Centos based container with Java and Tomcat
FROM centos:centos7
MAINTAINER zhangxiaoke@xiaoluyy.com
ENV CATALINA_HOME /usr/local/tomca8
ENV PATH $CATALINA_HOME/bin:$PATH
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar && \
 wget -O jre.rpm http://javadl.oracle.com/webapps/download/AutoDL?BundleId=225344_090f390dda5b47b9b721c7dfaa008135 && \
 yum  -y install jre.rpm && \
 wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz && \
 tar xvf apache-tomcat-8.5.20.tar.gz && \
 mv apache-tomcat-8.5.20 /usr/local/tomca8 && \
 rm -y apache-tomcat-8.5.20.tar.gz && \
 rm -y jre.rpm
WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh", "run"]
