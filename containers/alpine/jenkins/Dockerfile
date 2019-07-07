################################################################################
#
#   Jenkins with  HubDocker jenkins/jenkins latest alpine
#   Plugin
#		1.docker(dind)
#		2.dotnet sdk 2.2.300
# 
#################################################################################

FROM jenkins/jenkins:alpine

ARG WRAPDOCKER_PATH="/usr/local/bin/wrapdocker.sh"
ARG DOTNET_SDK_URL="https://download.visualstudio.microsoft.com/download/pr/bcf3b2eb-a5ed-4829-b2c9-6fc5d41f79e2/30dfae04f6bb726fd763d52f0a42501a/dotnet-sdk-2.2.300-linux-musl-x64.tar.gz"
ARG DOTNET_PATH="/usr/dotnet"

ENV DOTNET_ROOT ${DOTNET_PATH}
ENV PATH "$PATH:${DOTNET_PATH}"

#Prepare Setting
COPY wrapdocker.sh $WRAPDOCKER_PATH

USER root

RUN echo "https://mirrors.aliyun.com/alpine/v3.9/main/" > /etc/apk/repositories \
  && echo "https://mirrors.aliyun.com/alpine/v3.9/community/" >> /etc/apk/repositories \
  && echo "https://mirrors.aliyun.com/alpine/edge/community/" >> /etc/apk/repositories \
  && apk add --no-cache procps shadow tzdata openrc docker icu \
  && echo "################ set zone "         \
  && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone \
  && echo "################ set docker "         \
  && chmod a+x ${WRAPDOCKER_PATH}	\
  && bash $WRAPDOCKER_PATH	\
  && echo "################ set dotnet sdk "         \
  && mkdir -p /usr/dotnet \
  && cd /usr/dotnet
  && wget ${DOTNET_SDK_URL} \
  && tar zxf dotnet-sdk-2.2.300-linux-musl-x64.tar.gz \
  && rm dotnet-sdk-2.2.300-linux-musl-x64.tar.gz
  && echo "################ set permission "         \
  && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
  $$ usermod -a -G docker Jenkins
  
USER jenkins

# `shadow`: `alpine`默认不集成`usermod`,所以需要这个额外包,因为要用来更改默认`shell`
# `tzdata` : zone tools
# `openrc` :rc tools
# `icu` : dotnet sdk required