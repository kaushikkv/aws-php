#!/bin/bash
REPO_NAME=aws-php
ORIGIN_URL=https://github.com/kaushikkv/aws-php.git
REPO1_URL=https://kaushikkv:alsdkjf1@github.com/kaushikkv/test.git
REPO1_NAME=test 
rm -rf $REPO_NAME $REPO1_NAME diff.txt
git clone $ORIGIN_URL $REPO_NAME
cd $REPO_NAME
git remote add --mirror=fetch repo1 $REPO1_URL
git fetch origin --tags
echo "fetching origin tags done"
git clone $REPO1_URL /home/kaushik/$REPO1_NAME
rc=$?
echo $rc
if [ $rc -eq 0 ]; 
then 
	echo "repository exits"
else 
	curl -u 'kaushikkv':'alsdkjf1' https://api.github.com/user/repos -d '{"name":"test"}' 
	sleep 10
fi
git push repo1 --all 
rc=$?
echo $rc
if [ $rc -eq 0 ];
then
	echo "push to remote repo done"
	git push repo1 --tags
	echo "push tags to remote repo done"
else 
	cd /home/kaushik
	git diff  $REPO_NAME $REPO1_NAME >> diff.txt 
fi
