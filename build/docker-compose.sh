#!/bin/sh
#docker run --name mysql -e MYSQL_ROOT_PASSWORD=111111 -p 3306:3306 -v /var/lib/mysql:/var/lib/mysql:rw -d docker.io/mysql/mysql-server
mysqlExist=`curl -X GET http://10.10.10.7:2375/containers/mysql/json | sed 's/no such id: mysql//'`
if [ ${#mysqlExist} -eq 0 ];then 
curl -X GET http://10.10.10.7:2375/containers/mysql/json | 
containerID=` curl -X POST -H "Content-Type: application/json" \
http://10.10.10.7:2375/containers/create?name=mysql \
-d '{
"Image": "docker.io/mysql/mysql-server",
"ExposedPorts": {
	"3306/tcp": {}
},
"Env":["MYSQL_ROOT_PASSWORD=111111"],
"HostConfig": {
	"Binds": [
	"/var/lib/mysql:/var/lib/mysql:rw"
	],
	"PortBindings": { "3306/tcp": [{ "HostPort": "3306" }] }
}
}' | cut -d "\"" -f 4 `
echo ${containerID}
curl -X POST -H "Content-Type: application/json" http://10.10.10.7:2375/containers/${containerID}/start
else
  echo "mysql容器已存在"
fi
tomcatExist=`curl -X GET http://10.10.10.7:2375/containers/web-project/json | sed 's/no such id: web-project//'`
if [ ${#tomcatExist} -eq 0 ] ;then
containerID=` curl -X POST -H "Content-Type: application/json" \
http://10.10.10.7:2375/containers/create?name=web-project \
-d '{
"Image": "getlot/tomcat:8u23",
"ExposedPorts": {
	"8080/tcp": {}
},
"HostConfig": {
	"Links": ["mysql:mysqlserver"],
	"Binds": [
	"/opt/data/jenkins/build:/var/lib/tomcat8/webapps:rw"
	],
	"PortBindings": { "8080/tcp": [{ "HostPort": "8089" }] }
}
}' | cut -d "\"" -f 4 `
echo ${containerID}
curl -X POST -H "Content-Type: application/json" http://10.10.10.7:2375/containers/${containerID}/start
else
  echo "web-project容器已存在"
fi
