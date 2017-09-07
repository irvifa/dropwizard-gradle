#!/bin/bash
 
set -e
TAG=nyan/test
VERSION=v2
docker build -t ${TAG}:${VERSION} .
