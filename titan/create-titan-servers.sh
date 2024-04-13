#!/bin/bash

# 批量部署docker镜像
for i in $(seq 1 5)
do
    echo "docker$i"
    docker run -d --name "docker$i" -v "/F:/titan/dockerFile/d$i:/root/.titanedge" nezha123/titan-edge
    # 注意把hash换成自己的
    docker exec "docker$i" titan-edge bind --hash=87E8C67B-EDE3-403A-AB9C-8B268B16FD1D https://api-test1.container1.titannet.io/api/v2/device/binding
done

# 删除所有的docker镜像
# docker ps -a|grep nezha123/titan-edge|awk '{print $NF}'|xargs docker rm -f