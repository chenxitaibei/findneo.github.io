---
title: 2017 miac writeup
tags: [ctf]
date: 2017-10-15 16:25:04
categories: writeup
comments: false
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

