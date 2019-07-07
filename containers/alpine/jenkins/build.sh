#!/bin/bash

cp ../../../wrapdocker.sh .
docker build -t jenkins:alpine-1.0 .
rm wrapdocker.sh