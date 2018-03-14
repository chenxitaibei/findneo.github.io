---
title: 命令行拨号上网
toc: false
tags: [hacklife , code ,Batch]
date: 2017-10-03 23:52:02
categories:  备忘
comments: false
description: 解放鼠标，从命令行连接与断开网络
---

校园网使用PPPoE拨号上网，每次都通过图形化界面通断网络不太方便，希望能一键上网一键下线，于是写了个小脚本。

配置好相关参数后保存为  `C:\Windows\System32\surf.bat ` ，重启命令行即可使用 `surf` 命令通断网络，常用的话甚至只要 `win+r->enter`就可以自由迅速地上线下线啦。把下面第二十行的注释去掉可以在联网同时打开ss，有些缺憾的是还没有实现断网时退出ss。

流程控制参考了[Batch Guide by Terry Newton](http://www.infionline.net/~wtnewton/batch/batguide.html#8) 。

```c
REM 校园网使用PPPoE拨号上网，将文件内容存为 C:\Windows\System32\surf.bat ，可以命令行拨号上网
REM 可自行加开ss
@echo off
set name=net  			 REM 	修改net 为拨号连接的名字
set phone=13323333333 	  REM	 修改为拨号上网手机号
set pass=2333   		 REM   	 运营商提供的密码

rasdial | findstr 已连接 > nul
if errorlevel 1 goto notfound

rem string was found
rasdial %name% /disconnect 

goto endfind

:notfound
rem string was not found
rasdial %name% %phone% %pass%
if "%1" neq "" goto :endfind
REM start C:\path\to\your\Shadowsocks\Shadowsocks.exe
:endfind
```



## 2017/10/05 更新代码

添加第十九行，如果ss已经在运行，只要传入一个参数就不会尝试开启啦。



------

## 2018-03-12重写

逻辑更清晰，添加重连功能，有时被ban可以起到刷新IP的作用。

- **surf  r**  断开并重新连接
- **surf**  通<=>断
- **surf any**  连接但不启动shadow socks

```c
@echo off
set name=surf  			
set phone=15759261656  
set pass=285530	 	
rasdial | findstr 已连接 > nul
set is_connect=%errorlevel%

echo %is_connect%

if %is_connect%==1 goto not_connected
if %is_connect%==0 goto connected

:connected
if "%1"=="r" goto re_connect
goto disconnect


:not_connected
if "%1"=="" goto connect_with_ss
goto connect_without_ss

rem ==========================================

:re_connect
rasdial %name% /disconnect
ping 127.1 -n 2 > nul
rasdial %name% %phone% %pass%
ipconfig | find "IPv4"
goto end

:disconnect
rasdial %name% /disconnect
goto end

:connect_without_ss
rasdial %name% %phone% %pass%
ipconfig | find "IPv4"
goto end

:connect_with_ss
rasdial %name% %phone% %pass%
start D:\path\to\Shadowsocks-4.0.6\Shadowsocks.exe
ipconfig | find "IPv4"
goto end


:end
```