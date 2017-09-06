#!/bin/bash
 
set -e
TAG=nyan/test
VERSION=v1
docker build -t ${TAG}:${VERSION} .
docker run -d -p 8080:8080 -t ${TAG}:${VERSION}
