# Centos based container with Java and Tomcat
FROM centos:centos7
MAINTAINER zhangxiaoke@xiaoluyy.com
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar
RUN wget -O jre.rpm http://javadl.oracle.com/webapps/download/AutoDL?BundleId=225344_090f390dda5b47b9b721c7dfaa008135 && \
 yum  -y install jre.rpm
RUN wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-7/v7.0.81/bin/apache-tomcat-7.0.81.tar.gz && \
 tar xvf apache-tomcat-7.0.81.tar.gz && \
 mv apache-tomcat-7.0.81 /usr/local/tomcat && \
 rm -rf apache-tomcat-7.0.81.tar.gz && \
 rm -rf jre.rpm
RUN echo "LANG=zh_CN.UTF-8" > /etc/locale.conf && \
 rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
 yum -y install kde-l10n-Chinese && \
 yum -y reinstall glibc-common && \
 localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
ENV LANG C.UTF-8  
WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh", "run"]
