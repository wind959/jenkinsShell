#!/bin/sh


echo "-----------------------------"
echo "Deploying $1"

#===============hhuiliao_im_we======================
if [ $1 == "web" ] 
then

	scp -P 22 /root/.jenkins/workspace/huiliao_im_web/target/huiliao_im_web.war	root@172.17.25.98:/opt/huiliaoWar/
	ssh root@172.17.25.98 -p 22 t_pid='/script/deploy_project.sh web'

fi


if [ $1 == "service" ] 
then

	scp -P 22 /root/.jenkins/workspace/huiliao_im_service/target/huiliao_im_service.war	root@172.17.25.98:/opt/huiliaoWar/
	ssh root@172.17.25.98 -p 22 t_pid='/script/deploy_project.sh service'

fi


if [ $1 == "rest" ] 
then

	scp -P 22 /root/.jenkins/workspace/huiliao_rest/target/huiliao_rest.war	root@172.17.25.98:/opt/huiliaoWar/
	ssh root@172.17.25.98 -p 22 t_pid='/script/deploy_project.sh rest'

fi
