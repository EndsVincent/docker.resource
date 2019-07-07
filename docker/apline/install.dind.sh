#!/bin/bash

################################################################
#
#	alpine install dind(docker in  dokcer)
#   
#   warn:
#		1.the container must been run as options <--privileged>
#		2.the file wrapdocker.sh must exist
#
################################################################

set -ex

# copy the file to container, make sure the file exist
wrapdocker_path="/usr/local/bin/wrapdocker.sh"

# install docker from aliyun
echo "https://mirrors.aliyun.com/alpine/v3.9/main/" > /etc/apk/repositories \
  && echo "https://mirrors.aliyun.com/alpine/v3.9/community/" >> /etc/apk/repositories \
  && echo "https://mirrors.aliyun.com/alpine/edge/community/" >> /etc/apk/repositories \
  && apk add --no-cache docker \
  
# run wrapdocker_path
chmod a+x $wrapdocker_path \
 && bash $wrapdocker_path
 
 exit 0