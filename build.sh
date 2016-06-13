#!/bin/bash -x
seyernJar=`curl -s https://api.github.com/repos/scobal/seyren/releases/latest | grep "browser_download_url" | grep jar |awk '{print $2}'`
SEYREN_VERSION=`curl -s https://api.github.com/repos/scobal/seyren/releases/latest | grep "tag_name" |awk '{print $2}'|sed s/[\",]//g`

wget -o seyren.jar https://github.com/scobal/seyren/releases/download/${SEYREN_VERSION}/seyren-web-${SEYREN_VERSION}.jar

docker build -t jregovic/seyren:latest -t jregovic/seyren:${SEYREN_VERSION} .
