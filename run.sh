#!/bin/bash
 
set -e
TAG=nyan/test
VERSION=v1
docker run -d -p 8080:8080 -p 8081:8081 -t ${TAG}:${VERSION}
