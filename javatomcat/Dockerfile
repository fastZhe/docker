# version 0.0.1
FROM centos:7
MAINTAINER hzdan "bendandan"
#添加java
ADD  jdk-8u151-linux-x64.tar.gz /usr/local
#RUN  mv /usr/local/jdk1.8.0_151 /usr/local/java
ENV  JAVA_HOME /usr/local/jdk1.8.0_151

#添加tomcat
ADD apache-tomcat-8.0.47.tar.gz /usr/local
RUN ln -s /usr/local/apache-tomcat-8.0.47 /usr/local/tomcat

# 添加orache java7源，一次性安装vim，wget，curl，java7，tomcat7等必备软件
RUN chmod +x /usr/local/tomcat/bin/*.sh


# 容器需要开放Tomcat 8080端口
EXPOSE 8080

# 设置Tomcat7初始化运行，SSH终端服务器作为后台运行
ENTRYPOINT /usr/local/tomcat/bin/catalina.sh run
