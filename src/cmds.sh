#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# When the dockerfile has not the default name you need to reference it using the -f flag
docker build  -t fabianmoronzirfas/node-front -f Dockerfile.dev .

#--MAP local folder into containr-------------┐
#--KEEP V on container---┐                    |
#- PORTS-----–┐          |                    |
#             |          |                    |
            # ╵          ╵                    ╵
docker run -p 3000:3000 -v /app/node_modules -v (pwd):/app effb5c0f4a3a


# build the Dockerfile with the multistage setup

docker build  -t fabianmoronzirfas/node-nginx .

# run it
# by mapping the 8080 to internal 80 port
docker run -d  -p 8080:80  fabianmoronzirfas/node-nginx:latest