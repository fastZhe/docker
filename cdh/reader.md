### 基于CDH5.10

#### 打包命令

```
docker build  -f cdhbase.dockerfile  -t  cdh:1.0 .

```
#### 运行命令

```
docker run -d -m 10g  --net mynetwork  -v $(pwd):/opt   --name master1  --hostname master  --ip 172.18.0.10 --add-host s1:172.18.0.11 --add-host s2:172.18.0.12   --privileged=true cdh:2.0 /usr/sbin/init
docker run -d -m 2g  --net mynetwork  -v $(pwd):/opt  --name s11  --hostname s1  --ip 172.18.0.11 --add-host master:172.18.0.10 --add-host s2:172.18.0.12   --privileged=true cdh:2.0 /usr/sbin/init
docker run -d -m 2g  --net mynetwork  -v $(pwd):/opt   --name s21  --hostname s2  --ip 172.18.0.12 --add-host s1:172.18.0.11 --add-host master:172.18.0.10   --privileged=true cdh:2.0 /usr/sbin/init
```