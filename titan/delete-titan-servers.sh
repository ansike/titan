#!/bin/bash

echo "当前nezha123/titan-edge的个数为：$(docker ps -a | grep nezha123/titan-edge | wc -l)"

# 删除所有的 nezha123/titan-edge docker镜像
docker ps -a | grep nezha123/titan-edge | awk '{print $NF}' | xargs docker rm -f

echo "当前nezha123/titan-edge的个数为：$(docker ps -a | grep nezha123/titan-edge | wc -l)"
