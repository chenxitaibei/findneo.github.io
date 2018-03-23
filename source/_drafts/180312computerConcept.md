---
comments: false
toc: true
mathjax: true
title: 一些术语的通俗解释
tags: [concept]
date: 2018-03-12 21:54:25
categories: 备忘
---

###### [hostname](https://en.wikipedia.org/wiki/Hostname)

在计算机网络中，一个主机名（过去称为节点名）是一个赋给联网设备的标签，用以在各种形式的电子通信（比如万维网）中区分设备。主机名可以是一个单词或短语，也可以是拥有某种约定好的结构。

对于因特网来说，主机名这个概念可以有所扩展，用来表示域名名称系统（DNS）中某一个域的名字。这种情况下，主机名也可称为域名。如果域名被完全地明确地指定，那么可称之为完全域名（FQDN），比如“www.baidu.com”就是一个完全域名，其中com是顶级域名，baidu是次级域名，www是主机名。

###### [Document Object Model](https://en.wikipedia.org/wiki/Document_Object_Model)

文档对象模型（DOM）是跨平台的，语言无关的应用程序编程接口（Application programming interface，API），他将HTML/XHTML/XML文档视为树状结构，树的每个节点都是一个对象，表示文档的一部分。所有的对象都可以通过编程来操纵，如果某个操作结果是可见的，那么这个操作就可能影响文档的外观。。。。

###### [Same-origin policy](https://en.wikipedia.org/wiki/Same-origin_policy)

同源策略是web应用安全模型中的重要概念，在这个策略的限制下，两个web页面只有在被认为是同源的情况下，其中包含的脚本才被允许互相访问对方的数据。同源策略通过三个部分的内容来判定两个页面是否同源：协议，主机名和端口。常见协议有。。。

X-Forwarded-For

HTTP头的一种非标准字段，用来标识通过代理或负载均衡连接到服务端的客户端原始IP地址，是事实上的标准，[RFC 7239, section 4: Forwarded](http://tools.ietf.org/html/7239#section-4) 建议用标准字段`Forwarded` 取代，RFC文档声明了后者的语法和语义。

Forwarded

HTTP标准字段之一，包含请求经过代理服务器的过程中被修改或丢失的客户端消息。可以被 [`X-Forwarded-For`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-For), [`X-Forwarded-Host`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-Host) 和[`X-Forwarded-Proto`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-Proto) 字段替代，他们没有被声明为标准字段，但是是事实上的标准。该字段主要用于数据统计，调试和提供个性化服务等，使用时应注意考虑用户隐私。

语法如下：`Forwarded: by=<identifier>; for=<identifier>; host=<host>; proto=<http|https>` 

其中`<identifier>` 都有多种选择 :

1. [混淆标识符](https://tools.ietf.org/html/rfc7239#section-6.3)  。用在出于跟踪或调试的目的需要存在Forwarded字段,但又想要匿名的情况下,可任意命名,但必须符合正则`/_[\d\w.-]+/ `  , 如`_hidden` ,`_secret` 等; 
2.  `unknown` 。确实不知道该字段值,又想要声明。
3. `IP[:PORT]` 。

by 字段表示我是从哪里收到转发请求的，一般是上一个请求流量进入代理服务器的那个接口网卡。