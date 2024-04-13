# titannet 撸毛脚本

- 测试站点
https://test1.titannet.io/newoverview/activationcodemanagement

- 指导手册
https://titannet.gitbook.io/titan-network-cn/huygens-testnet/an-zhuang-cheng-xu-zhuan-qu/ming-ling-hang-an-zhuang

- 脚本指导
1. 确保已经安装 docker，根据自己的电脑选择不同的安装方式（前提）
2. 执行脚本，注意需要调整 hash 参数 -s为自己的

```shell
# 注意将-s后的内容换成自己的hash
curl -sSL "https://raw.githubusercontent.com/ansike/titan/master/titan/create-titan-servers.sh" | bash -s FA7C84E6-4B22-43E3-BC83-40DC09A6BC61
```

- 删除部署的所有docker
```shell
curl -sSL "https://raw.githubusercontent.com/ansike/titan/master/titan/delete-titan-servers.sh" | bash
```
