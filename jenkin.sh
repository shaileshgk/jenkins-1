#!/bin/bash


for i in {1..10}
do
	echo "The numbers are $i "
done >> /var/lib/jenkins/workspace/jenkins_project_git_code/git_code.txt
