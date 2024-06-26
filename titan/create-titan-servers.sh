#!/bin/bash

# 设置默认哈希值
default_hash=${1:-"87E8C67B-EDE3-403A-AB9C-8B268B16FD1D"}

# 询问用户输入哈希值
echo "请输入哈希值（直接回车将使用默认值 '$default_hash'）："
read -r hash

# 如果用户没有输入，则使用默认哈希值
if [ -z "$hash" ]; then
    hash="$default_hash"
fi

# 批量部署docker镜像
for i in $(seq 1 5); do
    echo "docker$i"
    echo "docker run -d --name docker$i -v ~/.titanedge/d$i:/root/.titanedge nezha123/titan-edge"
    rm -rf ~/.titanedge/d$i
    mkdir -p ~/.titanedge/d$i
    docker run -d --name "docker$i" -v ~/.titanedge/d$i:/root/.titanedge nezha123/titan-edge
    # 检查上一条命令的退出状态
    if [ $? -eq 0 ]; then
        echo "Docker容器 docker$i 创建成功"
    else
        echo "Docker容器 docker$i 创建失败"
        continue
    fi
    # 注意把hash换成自己的
    docker exec "docker$i" titan-edge bind --hash="$hash" https://api-test1.container1.titannet.io/api/v2/device/binding
    # 检查上一条命令的退出状态
    if [ $? -eq 0 ]; then
        echo "Docker容器 docker$i 绑定成功"
    else
        echo "Docker容器 docker$i 绑定失败"
    fi
done
