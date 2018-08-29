#!/usr/bin/env bash

###################################
#        service init
###################################
passwd <<EOF
123456
123456
EOF

cat <<'EOF' >>/etc/profile
export JAVA_HOME=/usr/java/jdk1.8.0_144
export PATH=$PATH:$JAVA_HOME/bin
EOF


ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa


systemctl restart sshd


function master(){

systemctl restart mariadb 

###################################
#        mysql init
###################################
#设置mysql密码
mysqladmin -uroot password '123456'
#创建相关数据库以及更新权限
mysql -uroot -p123456 <<EOF
show databases;
grant all privileges on *.* to 'root'@'%' identified by '123456' with grant option;
flush privileges;
create database cmf  DEFAULT CHARSET utf8;
create database rpm DEFAULT CHARSET utf8;
select Host,User from mysql.user;
exit
EOF

systemctl restart cloudera-scm-server
systemctl restart cloudera-scm-agent
}


function agent(){
    systemctl stop cloudera-scm-server
    systemctl restart cloudera-scm-agent
}



if [ "$1" == "m" ];then
echo "启动master"
 master
else
echo "启动agent"
 agent
fi

###################################
#        service 
###################################
#systemctl start cloudera-scm-agent
#systemctl start cloudera-scm-server





