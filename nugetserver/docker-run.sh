#!/bin/bash

################################################################
#
#	docker run simple-nuget-server
#
################################################################

set -x

docker run -d \
           -p 8060:80 \
           --env NUGET_API_KEY=oy2neri5dhaulwjihdlazm5fneinbwpuhfb4ugbh4iod3y \
           --volume /data/nuget/database:/var/www/db \
           --volume /data/nuget/packages:/var/www/packagefiles \
           --name nuget-server \
           sunside/simple-nuget-server