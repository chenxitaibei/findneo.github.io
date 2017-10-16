---
title: python代码段
tags: [python ]
date: 2017-10-15 16:45:21
categories: code
comments: false
description: 记录一些平时用python写的代码段。
---

### 栅栏密码加解密

#### 单行版本

```python
railFence = lambda s: [[i, ''.join([s[k * i + j] for j in range(i) for k in range(len(s) / i)])] for i in range(1, len(s)) if not len(s) % i]
print railFence('some thing to deal with')
```

#### 正常版本

```python
def railFence(s):
    ll = len(s)
    res = dict()
    for i in range(1, ll):
        r = ''
        if ll % i == 0:
            for j in range(i):
                for k in range(ll / i):
                    r += s[k * i + j]
            res[i] = r
    return res


print railFence('some thing to deal with')
```

### 凯撒密码加解密

#### 单行版本

```python
def caesar(s): return [[off, ''.join([chr((ord(i) - 97 + off) % 26 + 97) if 'a' <= i <= 'z' else chr((ord(i) - 65 + off) % 26 + 65) if 'A' <= i <= 'Z' else i for i in str(s)])] for off in range(26)]
print caesar('some thing to deal with')
```

#### 正常版本

```python
def caesar(s):
    cycle = 26
    res = []
    for offset in range(26):
        r = ''
        for i in str(s):
            if 'a' <= i <= 'z':
                r += chr((ord(i) - ord('a') + offset) % cycle + ord('a'))
            elif 'A' <= i <= 'Z':
                r += chr((ord(i) - ord('A') + offset) % cycle + ord('A'))
            else:
                r += i
        res.append(r)
    return res


print caesar('some thing to deal with')
```

### 莫尔斯电码加解密

```python
# coding: utf8
# by https://findneo.github.io
import re
morseChart = ['.-', '-...', '-.-.', '-..', '.', '..-.', '--.',
              '....', '..', '.---', '-.-', '.-..', '--', '-.',
              '---', '.--.', '--.-', '.-.', '...', '-', '..-',
              '...-', '.--', '-..-', '-.--', '--..', '-----',
              '.----', '..---', '...--', '....-', '.....',
              '-....', '--...', '---..', '----.', '.-.-.-',
              '--..--', '..--..', '-....-', '.----.', '---...',
              '.-..-.', '-..-.', '.--.-.', '-.-.-.', '-...-',
              '-.-.--', '..--.-', '-.--.', '-.--.-', '...-..-',
              '.-...', '.-.-.', ' ', '*']

alphaChart = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
              'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
              's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0',
              '1', '2', '3', '4', '5', '6', '7', '8', '9',
              '.', ',', '?', '-', "'", ':', '"', '/', '@',
              ';', '=', '!', '_', '(', ')', '$', '&', '+', ' ', '#']
c = [morseChart, alphaChart]
# 字典：{c[1][i]: c[0][i] for i in xrange(len(c[0]))}


def morse(s):
    s = s.lower()  # 转为小写
    # 将无法处理的替换为'#'，在莫尔斯密码中体现为'*'
    s = re.sub('[^a-z0-9.,?\-\':"/@;=!_()$&+ ]', '#', s)
    s = re.sub('\s+', ' ', s)  # 将多空格变为单一空格，故无法处理词间分隔
    m = 1
    if not re.match('[^-._ ]', s):
        s = s.replace('_', '-')
        s = re.split(' ', s)
        m = 0
    r = []
    return (m * ' ').join(r.extend([c[1 - m][c[m].index(i)] for i in s]) or r)


print morse('0123456789!abcdef')
print morse('----- .---- ..--- ...-- ....- ..... -.... --... ---.. ----. -.-.-- .- -... -.-. -.. . ..-.')
```

### base家族混合编码fuzz

```python
from base64 import b64decode, b32decode, b16decode
res = []


def basefuzz(s):
    global res
    for f in [b64decode, b32decode, b16decode]:
        try:
            t = f(s)
            if '{' in t and '}' in t:
                res.append(t)
                return 0
            else:
                basefuzz(t)
        except:
            pass
    return res


print basefuzz('UjFrelJFMVJXbGRIUlRORVQwNHlRMGRaTTBSTlVWcFVSMUV6UkU5T1MwZEhUVmxVUzFKU1ZVZEpXbFJKVGxwVVIxa3lWRXRTVWxkSVJWcFVSMDVMUjBkVk0wUkhUVnBZUjBrelZGTk9TMGRIVFRSVVRWSlNWMGxaTTBSSlRqSkY=')

```

随机多重base加密（见[南邮CTF平台练习题](https://findneo.github.io/2017/09/nupt-ctf-writeup/#mixed-base64) ）

