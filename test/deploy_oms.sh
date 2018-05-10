#!/bin/sh

echo 'Start tomcat_web_oms,port is 8082'
t_pid=`/usr/sbin/lsof -n -P -t -i :8082`

echo 'tomcat_pid='$t_pid

[ -n "$t_pid" ] && kill -9 $t_pid

echo 'tomcat_web_oms shutdown'

cd /usr/local/tomcat_oms/webapps

current_time=`date '+%Y%m%d%H%M%S'`

mv huiliao-oms.war /opt/bak/huiliao-oms-$current_time.war.bak

rm -rf /usr/local/tomcat_oms/webapps/huiliao-oms*

cp -rf /root/.jenkins/workspace/huiliao_oms/target/huiliao-oms.war  /usr/local/tomcat_oms/webapps/

cd  /usr/local/tomcat_oms/bin
nohup ./startup.sh  &

echo 'tomcat_web_oms Start over'

