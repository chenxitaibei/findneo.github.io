---
title: burpsuite-usage
tags: 
---

### 综述

burpsuite是一款HTTP代理工具，除了能够修改和代理HTTP/HTTPS协议的通信外，还内置了漏洞扫描、网站爬取、暴力破解、序列随机熵分析、解码、比较等功能，较新版本支持丰富的插件，是渗透测试中的得力工具，熟练地使用有助于提高工作效率，因此本文对常用的功能做了整理和简单介绍。

### 模块

#### proxy

proxy的功能是拦截和查看代理流量，是burpsuite中的基础模块，分为intercept(拦截)、HTTP history(代理流量历史记录)、WebSockets history(使用WebSockets的代理流量的历史纪录)和Options(代理选项)四个子功能。

为了使代理功能正常工作，需要在options的proxy listeners中设置burp监听的本地端口，然后在将要代理其流量的浏览器中设置127.0.0.1为代理地址，上述端口为代理端口，然后通过浏览器产生的所有HTTP流量都将按照Options中intercept client request部分设置的规则记录到history里，如果intercept设置为on，数据包就会被显示在intercept选项卡以供进一步操作。

HTTPS通信实际上是这样一个过程：服务端分发数字证书（包含公开密钥、名称以及证书授权中心的数字签名等），客户端安装并信任数字证书，客户端用证书包含的公钥加密传输信息，从而只有服务端能用私钥解密HTTPS传输的内容。如果想要代理HTTPS流量，burp必须和客户端、服务端各建立一条SSL通道，burp在与客户端的通信中扮演服务器的角色，在与服务端的通信中扮演浏览器的角色。因此burp会自行模拟客户端去和服务端通信，我们要做的是给浏览器安装并信任burp颁发的数字证书，这样之后浏览器和HTTPS站点通信时的流量就会用burp证书中的公钥加密，burp拦截到流量后用burp证书对应的私钥解密得到明文信息，然后再将得到的明文信息用目标站点的数字证书公开密钥加密后与该站点进行HTTPS通信。

在options中进行设置可以拦截或修改符合特定匹配的请求或响应。

#### repeater

repeater的功能是查看、修改和重放HTTP报文，并查看响应，功能简单却强大，是手工探测的利器。

双击每个标签可以重命名，有利于识别。

修改报文后按go即可重放，go按键的功能称为 issue the request ，因为默认未开启这个功能的快捷键，所以可以在User options->Misc->Hot keys里面为其设置。

####target

target的功能是为每个代理过的站点生成一个直观的目录树。

####spider

#### 

### 技巧

#### 快捷键设置

#### 增加sqlmap

#### bapp