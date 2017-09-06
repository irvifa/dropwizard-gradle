#!/bin/bash
 
set -e
TAG=nyan/test
VERSION=v1
docker build -t ${TAG}:${VERSION} .
