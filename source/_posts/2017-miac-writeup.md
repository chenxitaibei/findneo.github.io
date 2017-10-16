---
title: 2017 miac writeup
tags: [ctf]
date: 2017-10-15 16:25:04
categories: writeup
comments: false
description: ┏ (゜ω゜)=☞  滑稽树上滑稽果 
---


2017/10/14，miac。

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

