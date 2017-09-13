# Centos based container with Java and Tomcat
FROM centos:centos7
MAINTAINER zhangxiaoke@xiaoluyy.com
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar && \
 wget -O jre.rpm http://javadl.oracle.com/webapps/download/AutoDL?BundleId=225344_090f390dda5b47b9b721c7dfaa008135 && \
 yum  -y install jre.rpm && \
 wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz && \
 tar xvf apache-tomcat-8.5.20.tar.gz && \
 mv apache-tomcat-8.5.20 tomcat8 
EXPOSE 8080
EXPOSE 8009
