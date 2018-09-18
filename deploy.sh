#! /bin/bash

USER=$1
PASS=$2
ARCH=$3
TAG=$4
OWNER="chineseteapot"
REPO="gitbook"
docker login -u $USER -p $PASS
docker tag $OWNER/$REPO-$ARCH $OWNER/$REPO-$ARCH:$TAG
docker push $OWNER/$REPO-$ARCH:$TAG
