---
comments: false
toc: true
mathjax: true
title: 收集整理一个人所有的微博
tags: [python]
date: 2018-03-09 00:01:39
categories: 备忘
---

> 项目地址在  [https://github.com/findneo/TKposts](https://github.com/findneo/TKposts) 

人生活在社区里，对一个常使用微博的人来说，微博记录和反映了他在一段时间内所接触的信息，思考的问题和表达的观点，是值得研究的。如果这个研究对象是一个优秀的人，这里面的价值可能比想象要大。

很显然，要做成`收集整理一个人所有的微博` 这件事，首先是收集，其次是整理。

收集主要想到有三种方式：

- 找现成工具（无趣，暂不考虑）。
- 在`https://m.weibo.cn/u/14015127xxx` 页面一直按`END` 键，然后页面会不断异步发送请求以增加页面内容，直到全部内容都被获取。
- 可以看到第二种方法中的请求是向`https://m.weibo.cn/api/container/getIndex?type=uid&value=1401527xxx&containerid=1076031401527xxx&page=1` 发送GET请求，只需迭代page的参数即可得到所有数据。

### 方法二实践

用如下简单脚本模拟按键行为，泡杯茶观察成果。

```python
import win32api
import time
print time.asctime()
cnt=0
while 1:
	cnt+=1
	win32api.keybd_event(35, 0, 0, 0) #35 stands for "END" key; 0 means hold down
 	win32api.keybd_event(35, 0, 1, 0) # 1 means hold up 
	print cnt,
	time.sleep(2)
print time.asctime()
```

发现按了几十下页面就开始不变化了，观察请求发现都是发给`page=50`的，想必是做了限制，最多获取50条记录，暂告失败。

### 方法三实践

要用这个方法首先最好知道总共有多少page，用二分法手动测，很快就能发现目标用户共有1542个page的记录，然后写个脚本dump下这些响应，保存成json文件，以供后面处理即可。

```python
from requests import * 
from time import *
import json
print asctime()
url="https://m.weibo.cn/api/container/getIndex?type=uid&value=1401527xxx&containerid=1076031401527xxx&page="
for i in range(1543,1,-1):
	u=url+str(i)
	f=open("result/%d.json"%i,'w+')
	f.write(get(u).content)
	f.close()
	sleep(2)
	if i%50==0:
		sleep(3)
print asctime()
```

### 处理json

分析响应结构，提取关键信息，构造文件汇总即可。代码见  [GitHub](https://github.com/findneo/TKposts/blob/master/parse_json.py) 。

### 收获

- 了解了正则表达式的`backreference`和`lazy mode` 。
- 使用 `json.load(file)` 将json文件转换成字典。
- 数据编码问题可能导致写文件报错，可用`f.write(data.encode('utf8'))` 。
- 用`with open("f1") as f1,open("f2") as f2:` 打开多个文件。
- 每一个人作为数字公民的部分可能最后并不能留下太多痕迹，而且这些痕迹可能非常脆弱。当然，话说回来，这同线下生活也是相似的。

