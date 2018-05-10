#!/bin/sh

echo "-----------------------------"
echo "Deploying $1"

#============================================================

if [ $1 == "web" ] 
then

	# is tomcat_im_web project

	current_time=`date '+%Y%m%d%H%M%S'`

	echo 'String tomcat_web,port is 8080'
	
	t_pid=`/usr/sbin/lsof -n -P -t -i :8080`
	
	echo 'tomcat_pid='$t_pid

	[ -n "$t_pid" ] && kill -9 $t_pid

	echo 'tomcat_web shutdown'

	cd /usr/local/tomcat_web/webapps

	mv huiliao_im_web.war /opt/bak/huiliao_im_web_$current_time.war.bak

	rm -rf /usr/local/tomcat_web/webapps/huiliao_im_web*

	cp -rf /root/.jenkins/workspace/huiliao_web/target/huiliao_im_web.war  /usr/local/tomcat_web/webapps/

	cd /usr/local/tomcat_web/bin

	nohup ./startup.sh  &

	echo 'tomcat_im_web Start over'

fi

#============================================================

if [ $1 == "service" ] 
then

	# is tomcat_im_service project

	current_time=`date '+%Y%m%d%H%M%S'`

	echo 'String tomcat_service,port is 8081'
	
	t_pid=`/usr/sbin/lsof -n -P -t -i :8081`
	
	echo 'tomcat_pid='$t_pid

	[ -n "$t_pid" ] && kill -9 $t_pid

	echo 'tomcat_service shutdown'

	cd /usr/local/tomcat_service/webapps

	mv huiliao_im_service.war /opt/bak/huiliao_im_service_$current_time.war.bak

	rm -rf /usr/local/tomcat_service/webapps/huiliao_im_service*

	cp -rf /root/.jenkins/workspace/huiliao_service/target/huiliao_im_service.war  /usr/local/tomcat_service/webapps/

	cd /usr/local/tomcat_service/bin

	nohup ./startup.sh  &

	echo 'tomcat_im_service Start over'

fi

#==============================================

if [ $1 == "rest" ] 
then

	# is tomcat_im_service project

	current_time=`date '+%Y%m%d%H%M%S'`

	echo 'String tomca_rest,port is 8091'
	
	t_pid=`/usr/sbin/lsof -n -P -t -i :8091`
	
	echo 'tomcat_pid='$t_pid

	[ -n "$t_pid" ] && kill -9 $t_pid

	echo 'tomca_rest shutdown'

	cd /usr/local/tomca_rest/webapps

	mv huiliao_rest.war.war /opt/bak/huiliao_rest_$current_time.war.bak

	rm -rf /usr/local/tomcat_rest/webapps/huiliao_rest*

	mv /opt/huiliaoWar/huiliao_rest.war /usr/local/tomca_rest/webapps/

	cd /usr/local/tomca_rest/bin

	nohup ./startup.sh  &

	echo 'tomca_rest Start over'

fi
