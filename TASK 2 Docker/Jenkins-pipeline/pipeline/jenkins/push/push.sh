#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="maven-project"

echo "** Logging in ***"
docker login -u anooptalwar -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG anooptalwar/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push anooptalwar/$IMAGE:$BUILD_TAG
