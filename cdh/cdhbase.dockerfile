FROM centos:7.3.1611
#copy cdh rpm  package to image
COPY ./base /mnt/base

RUN yum install -y  openssh-server openssh-clients net-tools  wget telnet which  mariadb-server && cd /mnt/base && rpm -ivh jdk-8u144-linux-x64.rpm && mkdir /usr/share/java && mv mysql-connector-java.jar  /usr/share/java/ && yum install -y cloudera-manager-daemons-5.10.2-1.cm5102.p0.9.el7.x86_64.rpm  cloudera-manager-agent-5.10.2-1.cm5102.p0.9.el7.x86_64.rpm cloudera-manager-server-5.10.2-1.cm5102.p0.9.el7.x86_64.rpm enterprise-debuginfo-5.10.2-1.cm5102.p0.9.el7.x86_64.rpm
RUN /etc/init.d/cloudera-scm-agent stop && /etc/init.d/cloudera-scm-server stop && rm -fr /mnt/base/*

COPY config.ini  /etc/cloudera-scm-agent/
COPY db.properties /etc/cloudera-scm-server/
COPY cdhinit.sh /root

EXPOSE 7180
