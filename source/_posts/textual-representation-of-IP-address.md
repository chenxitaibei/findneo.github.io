---
comments: false
title: IP地址的多种表示形式
tags: [网络]
date: 2017-11-25 16:18:25
categories: 备忘
description: 一个IP地址，可能有上百种面目
---



从上回看到`ping 127.1` 能正常工作开始，就一直很好奇背后的原因，最近又在 [一个CTF题目](https://findneo.github.io/2017/11/HITCON-CTF-2017-Babyfirst-Revenge-series-writeup/) 用到基于IP表示法的技巧，于是决定稍微探索一下。

### 概况

IPv4是应用于分组交换网络的无状态协议，是网际协议(Internet Protocol , IP)的第四个版本，也是第一个投入生产的版本，1983年开始首先应用在ARPANET项目中。

IP地址用以标记使用IP接入网络的设备。IPv4把IP地址定义为32位二进制数，可表示 `2**32` 约42亿个网络设备接口，早期使用分类网络(Classful Addressing)的方法划分为五类，随着IP地址需求的增长，这种分类法被无类别域间路由(Classless Inter-Domain Routing , CIDR)取代。【参见RFC 1517-1519】

 Classful Addressing：

| Class                                    | 前缀位  | 网络地址位数 | 剩余的位数 | 网络数       | 每个网络的主机数   |
| ---------------------------------------- | ---- | ------ | ----- | --------- | ---------- |
| A类地址（单播）                                 | 0    | 8      | 24    | 128       | 16,777,214 |
| B类地址（单播）                                 | 10   | 16     | 16    | 16,384    | 65,534     |
| C类地址（单播）                                 | 110  | 24     | 8     | 2,097,152 | 254        |
| D类地址（[群播](https://zh.wikipedia.org/wiki/%E7%BE%A4%E6%92%AD)） | 1110 | 未定义    | 未定义   | 未定义       | 未定义        |
| E类地址（保留）                                 | 1111 | 未定义    | 未定义   | 未定义       | 未定义        |

### IPv4 地址句法的历史与现状

一个IPv4地址除了被机器解析外，还会用在很多需要人类阅读理解的地方，而一个32位二进制数(如`11000000101010000100001011101001` )对人类是很不友好的，因此人们必然会需要某种文本描述(textual representation) 。我们现在最常见到的点分十进制表示法(dotted-decimal notation) 就是其一。什么是点分十进制呢？就是由点号分隔开的四个十进制数(如`192.168.66.233` ） ，其中每个十进制数表示一个字节(octets , 八位二进制数)，较高有效位在左，较低有效位在右。

尽管从上面的描述我们可以了解到IPv4地址的常见形式，但是关于IP地址的文本描述具体应该如何，似乎从来没有严谨全面的定义。另一方面，IP作为互联网中较为基础的设施之一，常常不可避免地出现在各种协议的描述里，这些描述有时顺带也会提及IP地址的写法，但提法不尽相同，也并不足够强硬和严谨。这篇 [文章](https://tools.ietf.org/html/draft-main-ipaddr-text-rep-02) 细数了一些RFC文档里出现过的描述 ，可以看到不同场景下出现过`#127.0.0.1` 、`[127.0.0.1]` 、`127.000.000.001` 等形式的写法。

当IETF版本的句法处于无意识发展时，BSD版本的句法悄然登场。一个权威的解释大概也不是那么重要，尤其是当一项技术的某种实现已经被广泛使用。对于IPv4地址而言，这个实现就是`4.2BSD` 。 `4.2BSD` 引入了名为`inet_aton()` 的用于将字符串解释为IP地址的函数，这个函数被广泛地复制和演绎，从而使得BSD版本的关于IP地址文本描述的句法成为了事实上的标准——能够被`inet_aton()` 解释即合标准。至于`inet_aton()` 接受哪些形式的IP地址，将在下文给出。

这里先简要谈谈这两种句法的异同。

#### 相同点

对于最大多数情况——不带前导0的点分十进制( `dotted decimal octets with leading zeroes suppressed` ) ，两者都是支持的。

#### 不同点

- BSD版本的许多句法IETF版本都不支持
- ***最重要的。***IETF版本的句法在所有表述中始终如一地暗示要将带有前导0的数字解释为十进制，而BSD版本的句法在实现中将带有前导0的数字解释为八进制。举个例子，前者认为`192.168.1.011` 等价于`192.168.1.11` ，而后者认为等价于`192.168.1.9` 。

值得一提的是IPv6 的发展也对此产生了一定的影响。IPv6中的函数`inet_pton()` 在处理IPv4地址时只接受点分十进制，并且明确地拒绝了一些能够被`inet_aton()` 接受的句法。然而，对于是否接受前导0语焉不详。

此外，2005年的RFC 3986 提出取两者安全的公共子集作为严格的IP地址句法定义，形成倾向于IETF的标准，但同时保持对BSD实现的后向兼容。这个子集的定义如下，简单说就是用点号分隔的四个十进制数，禁止使用前导0。

```python
A 32-bit IPv4 address is divided into four octets.  Each octet is
represented numerically in decimal, using the minimum possible number
of digits (leading zeroes are not used, except in the case of 0
itself).  The four encoded octets are given most-significant first,
separated by period characters.

        IPv4address = d8 "." d8 "." d8 "." d8

        d8          = DIGIT               ; 0-9
                    / %x31-39 DIGIT       ; 10-99
                    / "1" 2DIGIT          ; 100-199
                    / "2" %x30-34 DIGIT   ; 200-249
                    / "25" %x30-35        ; 250-255
```



### inet_aton()允许哪些形式的IP地址

> - a single number giving the entire 32-bit address.
> - dot-separated octet values.  
> - It also interpreted two intermediate syntaxes: 
>   - octet-dot-octet-dot-16bits, intended for class B addresses
>   - octet-dot-24bits, intended for class A addresses. 
> - It also allowed some flexibility in how the individual numeric parts were specified. it allowed octal and hexadecimal in addition to decimal, distinguishing these radices by using the C language syntax involving a prefix "0" or "0x", and allowed the numbers to be arbitrarily long.

归纳起来有这么几种情况

- IP地址只有一个部分，表示为`a` ，每部分表示32位二进制数
- IP地址有两个部分，表示为`a.b` ，`a` 表示8位二进制数，`b` 表示24位二进制数
- IP地址有三部分，表示为`a.b.c` ，`a` 和`b` 各表示8位二进制数，`c` 表示16位二进制数
- IP地址有四个部分，表示为`a.b.c.d` ，每部分表示8位二进制数

以及这么两个重点

- 每一个部分可以都有三种表示法，十进制、十六进制和八进制，用前缀表明进制。
- 每部分的数字可以是任意长度。

到此为止，可以看到`127.1` 属于上述第二种情况，最开始的疑惑也就不复存在。

这应该算是一个历史遗留问题，不过在未来一段时间内，在广泛涉及URL和IP地址的浏览器和许多应用层程序(如Ping、telnet、wget、curl、GET、HEAD等)中，符合BSD版本句法的IPv4地址表示形式仍然是可接受的，而这些表示可以多达上百种，就可能在一些安全问题上发挥出人意料的作用。

### 一个产生各种形式IP地址的脚本

```python
# coding:utf8
# by https://findneo.github.io/
# ref: https://linux.die.net/man/3/inet_aton
#      https://tools.ietf.org/html/draft-main-ipaddr-text-rep-02
#      https://tools.ietf.org/html/rfc3986
#      http://www.linuxsa.org.au/pipermail/linuxsa/2007-September/088131.html
import itertools as it
ip = '192.168.66.233'
i = ip.split('.')


def f(x):
    """将str型十进制数转为str型十六进制数，并高位补0至满2字节，如'10'->'0x0a'
    """
    return hex(int(x))[2:].zfill(2)


hi = [f(i[0]),
      f(i[1]),
      f(i[2]),
      f(i[3]),
      # hi[4]:part c of "a.b.c"
      f(i[2]) + f(i[3]),
      # hi[5]:part b of "a.b"
      f(i[1]) + f(i[2]) + f(i[3]),
      # hi[6]:'a'
      f(i[0]) + f(i[1]) + f(i[2]) + f(i[3]),
      ]


def hex2oct(x):
    """可在八进制高位补任意多个0以bypass某些过滤，
        当然，也要考虑一些其他的限制，比如命令行长度限制
    """
    moreZero = 0
    return oct(int(x, 16)).zfill(moreZero + len(oct(int(x, 16)))).strip('L')


def hex2int(x): return str(int(x, 16))


def hex2hex(x): return '0x' + x


p = [hex2hex, hex2int, hex2oct]
res = []
# "a.b.c.d"
# Each of the four numeric parts specifies a byte of the address;
# the bytes are assigned in left-to-right order to produce the binary address.
res.extend(['.'.join([i[0](hi[0]), i[1](hi[1]), i[2](hi[2]), i[3](hi[3])]) for i in it.product(p, p, p, p)])

# "a.b.c"
# Parts a and b specify the first two bytes of the binary address.
# Part c is interpreted as a 16-bit value that defines the rightmost two bytes of the binary address.
res.extend(['.'.join([i[0](hi[0]), i[1](hi[1]), i[2](hi[4])]) for i in it.product(p, p, p)])

# "a.b"
# Part a specifies the first byte of the binary address.
# Part b is interpreted as a 24-bit value that defines the rightmost three bytes of the binary address.
res.extend(['.'.join([i[0](hi[0]), i[1](hi[5])]) for i in it.product(p, p)])

# "a"
# The value a is interpreted as a 32-bit value that is stored directly into the binary address without any byte rearrangement.
res.extend(['.'.join([i[0](hi[6])]) for i in it.product(p)])
print res

# -------------------------------------------------------------------------------
# test
import os

except_ip = []


def test_notation(ip_notation):
    global except_ip
    x = os.popen('ping -n 1 -w 0.5 ' + ip_notation).readlines()
    answer = x[0] if len(x) == 1 else x[1]
    if ip not in answer:
        except_ip.append(ip_notation)
    return answer.decode('gbk').strip()


print "\nchecking. . .",
for i in xrange(len(res)):
    # print "[%d] %s\t\t\t%s" % (i, res[i], test_notation(res[i]))
    test_notation(res[i])
    print '.',

print "\n\ntotally %d notations of ip checked ,all are equivalent to %s" % (len(res), ip)
if len(except_ip):
    print "except for notations following:\n", except_ip

```



运行结果

```python
['0xc0.0xa8.0x42.0xe9', '0xc0.0xa8.0x42.233', '0xc0.0xa8.0x42.0351', '0xc0.0xa8.66.0xe9', '0xc0.0xa8.66.233', '0xc0.0xa8.66.0351', '0xc0.0xa8.0102.0xe9', '0xc0.0xa8.0102.233', '0xc0.0xa8.0102.0351', '0xc0.168.0x42.0xe9', '0xc0.168.0x42.233', '0xc0.168.0x42.0351', '0xc0.168.66.0xe9', '0xc0.168.66.233', '0xc0.168.66.0351', '0xc0.168.0102.0xe9', '0xc0.168.0102.233', '0xc0.168.0102.0351', '0xc0.0250.0x42.0xe9', '0xc0.0250.0x42.233', '0xc0.0250.0x42.0351', '0xc0.0250.66.0xe9', '0xc0.0250.66.233', '0xc0.0250.66.0351', '0xc0.0250.0102.0xe9', '0xc0.0250.0102.233', '0xc0.0250.0102.0351', '192.0xa8.0x42.0xe9', '192.0xa8.0x42.233', '192.0xa8.0x42.0351', '192.0xa8.66.0xe9', '192.0xa8.66.233', '192.0xa8.66.0351', '192.0xa8.0102.0xe9', '192.0xa8.0102.233', '192.0xa8.0102.0351', '192.168.0x42.0xe9', '192.168.0x42.233', '192.168.0x42.0351', '192.168.66.0xe9', '192.168.66.233', '192.168.66.0351', '192.168.0102.0xe9', '192.168.0102.233', '192.168.0102.0351', '192.0250.0x42.0xe9', '192.0250.0x42.233', '192.0250.0x42.0351', '192.0250.66.0xe9', '192.0250.66.233', '192.0250.66.0351', '192.0250.0102.0xe9', '192.0250.0102.233', '192.0250.0102.0351', '0300.0xa8.0x42.0xe9', '0300.0xa8.0x42.233', '0300.0xa8.0x42.0351', '0300.0xa8.66.0xe9', '0300.0xa8.66.233', '0300.0xa8.66.0351', '0300.0xa8.0102.0xe9', '0300.0xa8.0102.233', '0300.0xa8.0102.0351', '0300.168.0x42.0xe9', '0300.168.0x42.233', '0300.168.0x42.0351', '0300.168.66.0xe9', '0300.168.66.233', '0300.168.66.0351', '0300.168.0102.0xe9', '0300.168.0102.233', '0300.168.0102.0351', '0300.0250.0x42.0xe9', '0300.0250.0x42.233', '0300.0250.0x42.0351', '0300.0250.66.0xe9', '0300.0250.66.233', '0300.0250.66.0351', '0300.0250.0102.0xe9', '0300.0250.0102.233', '0300.0250.0102.0351', '0xc0.0xa8.0x42e9', '0xc0.0xa8.17129', '0xc0.0xa8.041351', '0xc0.168.0x42e9', '0xc0.168.17129', '0xc0.168.041351', '0xc0.0250.0x42e9', '0xc0.0250.17129', '0xc0.0250.041351', '192.0xa8.0x42e9', '192.0xa8.17129', '192.0xa8.041351', '192.168.0x42e9', '192.168.17129', '192.168.041351', '192.0250.0x42e9', '192.0250.17129', '192.0250.041351', '0300.0xa8.0x42e9', '0300.0xa8.17129', '0300.0xa8.041351', '0300.168.0x42e9', '0300.168.17129', '0300.168.041351', '0300.0250.0x42e9', '0300.0250.17129', '0300.0250.041351', '0xc0.0xa842e9', '0xc0.11027177', '0xc0.052041351', '192.0xa842e9', '192.11027177', '192.052041351', '0300.0xa842e9', '0300.11027177', '0300.052041351', '0xc0a842e9', '3232252649', '030052041351']

checking. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 

totally 120 notations of ip checked ,all are equivalent to 192.168.66.233
[Finished in 2.6s]
```

