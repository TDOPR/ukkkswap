[toc]
# 1.服务部署目录文件描述

| 目录               | 描述        |
|------------------| --------- |
| ukswap-2.0.0.jar | 服务主程序jar  |
| db               | 数据库建表语句存放目录    |
| logs             | 日志存储目录    |
| conf             | 配置文件目录    |
| bin              | 运行脚本目录    |

上传部署包到服务器的/home目录下

# 2.修改配置文件
## 2.1.修改日志保存天数
默认是14天,配置标签在第18行

    vi /home/ukswap/conf/logback-spring.xml

```xml
<property name="saveDay" value="14" />
```

## 2.2.修改API服务的配置文件

    vi /home/ukswap/conf/application.yml


修改配置文件8~10行的数据库连接信息
```
      url: jdbc:mysql://localhost:3306/ukswap?allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8&useSSL=false
      username: root
      password: 123456
```

修改20~22行的redis连接信息
```
    host: 127.0.0.1
    port: 6379
    password:
```
# 3.创建表结构
在mysql客户端执行 /home/ukswap/db/init.sql文件创建服务需要的表结构。

# 4.启动服务

启动服务(正式环境 不输出nohup日志)

    /home/ukswap/bin/server.sh start

启动服务(测试环境 输出nohup日志)

    /home/ukswap/bin/server.sh dev

停止服务

    /home/ukswap/bin/server.sh stop

# 5.查看日志

查看info日志

    tail -f /home/ukswap/logs/server-info.log

查看error日志

    tail -f /home/ukswap/logs/server-error.log

查看nohup命令产生的日志(包含Info和error信息)

    tail -f /home/ukswap/logs/console-out.log  

# 6.修改application.yml

#基础token
token:

#BSC Router地址
routerBscAddress: '已部署的ukSwapRouter的币安链合约地址'

#ETH Router地址
routerEthAddress: '已部署的ukSwapRouter的以太坊链合约地址'

#web3ETH服务地址
web3EthServiceUrl: 以太坊RPC
#web3BSC服务地址
web3BscServiceUrl: 币安RPC

#钱包地址私钥
web3Wallet: '钱包地址私钥'

#基础token 以币安链为例
baseList:
- 'BNB地址'
- 'KTBK地址'
- 'WETH地址'
- 'USDT地址'
- 'BTCB地址'

# 7.修改eth_token_coin_config表中数据
    相应字段填入参数
    coin：'EVENT'
    coin_type: 'EVENT'
    contract: '填入部署后的ukSwapFactory地址'
    chain_id: '链id'
    block_no: '填入部署ukSwapFactory的区块号即可'
    valid: 'E'

    coin：'DEPOSIT'
    coin_type: 'DEPOSIT'
    contract: '填入部署后的Deposit地址'
    chain_id: '链id'
    block_no: '填入部署Deposit的区块号即可'
    valid: 'E'
# 8.application.yml中多数据源配置
    更改active值匹配测试或正式环境
    spring:
        profiles:
    # dev=测试  prod=正式
            active: dev(测试数据源)
