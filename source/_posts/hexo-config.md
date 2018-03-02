---
title: 博客搭建与自定义
tags: [hacklife]
date: 2017-09-26 18:29:02
categories: 备忘 
comments: true
description: 或许，记录在印象笔记和在博客会有不同，但是究竟，不同在哪里呢？
---

利用GitHub page和hexo搭建一个个人博客主要分三步：

1. 使用hexo在本地搭建一个可访问的博客。
2. 自定义博客样式。
3. 将博客发布到GitHub page。

### hexo本地搭建可访问博客

[官方文档](https://hexo.io/zh-cn/docs/index.html)讲的很详细了。

```shell
#基于Windows 10 ; hexo: 3.3.9 ; next Release 5.0.0

#1.安装 Node.js (https://nodejs.org/en/download/)

#2.安装 Git for Windows (https://github.com/waylau/git-for-win)

#3.安装 hexo
#  打开cmd.exe
npm install -g hexo-cli

#4. 创建博客
#  进入想要放博客文件的目录
hexo init <folder>
cd <folder>
npm install
# 到此为止已经可以看到效果
# hexo clean;hexo g;hexo s [--debug]

#5. 自选主题，如next (http://theme-next.iissnan.com/getting-started.html)
cd themes
git clone https://github.com/iissnan/hexo-theme-next themes/next

# 到此为止目录结构如下
.
├── _config.yml  [站点配置文件]
├── ...
├── source
|   ├── _drafts
|   └── _posts
└── themes
	├──landscape
	└──next
		└──_config.yml [博客配置文件]
```

### 自定义博客样式

#### blog/_config.yml

[git commit](https://github.com/findneo/findneo.github.io/blob/0f6cc6c0c88e46ed8409e7c4c76e86eea0fadea9/_config.yml)

#### blog/themes/next/_config.yml

[git commit](https://github.com/findneo/findneo.github.io/commit/c690492c2000d7544f17bf68928d98b576d164a9#diff-40e8f09dcfb3466627fdbc030ae0795c) 

#### 版权声明 ，[参考](http://www.crocutax.com/2017/05/20/Hexo%E6%8C%81%E7%BB%AD%E4%BC%98%E5%8C%96-%E5%9C%A8%E6%96%87%E7%AB%A0%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E7%89%88%E6%9D%83%E5%A3%B0%E6%98%8E%E4%BF%A1%E6%81%AF/)

##### blog\themes\next\layout\_macro\post-copyright.swig

```html
<ul class="post-copyright">
  <li class="post-copyright-title">
    <strong>{{ __('post.copyright.title') + __('symbol.colon') }}</strong>
    <a href="{{ post.permalink }}" >{{ post.title }}</a>
  </li>
  <li class="post-copyright-author">
    <strong>{{ __('post.copyright.author') + __('symbol.colon') }}</strong>
    <a href="{{config.url}}" title="{{__('post.copyright.welcome')}}"> {{ config.author }}</a>
  </li>
  <li class="post-copyright-link">
    <strong>{{ __('post.copyright.link') + __('symbol.colon') }}</strong>
    <a href="{{ post.permalink }}" title="{{ post.title }}">{{ post.permalink }}</a>
  </li>
  <li class="post-copyright-license">
    <strong>{{ __('post.copyright.license_title') + __('symbol.colon') }} </strong>
    {{ __('post.copyright.license_content', theme.post_copyright.license_url, theme.post_copyright.license) }}
  </li>
</ul>

```

##### blog\themes\next\languages\zh-Hans.yml

```yaml
##部分
post:
  copyright:
      title: 本文标题
      author: 文章作者
      link: 原始链接
      license_title: 版权声明
      welcome: '访问 findneo 的个人博客'
      license_content: 本文在<i class="fa fa-creative-commons"></i>
        <a href="%s" rel="external nofollow" target="_blank">%s</a>下发布。转载请保留原始链接。
```

#### 文章模板 blog\scaffolds\post.md

```markdown
---
title: {{ title }}
date: {{ date }}
categories: 
tags: []     ###可以直接用tags: [tag1,tag2]代替多行tags
description:     ###当主题配置文件中的excerpt_description开启时，会把这一部分作为文章摘要

---
```

### 将博客发布到GitHub page

#### 网站内容发布

[官方文档](https://hexo.io/zh-cn/docs/deployment.html#Git)

```bash
创建GitHub账户，新建username.github.io项目，为git配置ssh
npm install hexo-deployer-git --save
hexo d
```

#### 开发内容与配置文件备份

由于主题next本身是git项目，所以直接在blog文件夹内git init，然后整个blog文件夹(当然blog/.gitignore已经排除了没用的子文件夹)push到GitHub会发现next文件夹整个是空的。因此要做git库的[嵌套处理](http://www.mr-ping.com/post/VGr5DCUqTeYoaody)，但比较麻烦，而且似乎不适用于这种情况。所以最后我采用在**第一次push前**把blog\themes\next\\.git 重命名为 blog\themes\next\now-donot-use.git ，于是blog无法识别到next这个项目，成功地备份了所有配置。将来如果要更新主题，只需重命名回来，然后 git pull ，更新完改回去即可。

本地调试完成后，只需在git bash里执行`./ok ["you commit comment"] `即可完成部署和配置备份，ok文件内容如下：

```shell
hexo clean
hexo d
git add -A
if [ "$1" = "" ]
then
git commit -m "Update."
else
git commit -m "$1"
fi
git push
```

### emmm,重装系统了

```shell
从头开始，安装git fro windows，配置ssh
git config --global user.name your_name
git config --global user.email your_mail
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
clip < ~/.ssh/id_rsa.pub
ssh -T git@github.com 验证ssh可用
-------------------------------------
在GitHub新建findneo.github.io
git clone https://github.com/findneo/findneo.github.io.git
cd findneo.github.io
git checkout -b bakeup 
新建备份分支并设为默认分支，因为后面只手动操作这个分支，master分支由hexo-deployer-git自动操作 
hexo init tmp
cp -a tmp/* ./
rm -rf tmp
npm install --save hexo-deployer-git
npm install --save hexo-generator-baidu-sitemap
npm install --save hexo-generator-sitemap
npm install --save hexo-generator-searchdb
npm install --save hexo-generator-feed 
npm i --save hexo-wordcount
-------------------------------------	
在站点配置文件中配置git-deployer为master分支
git add . 
git commit -m "..." 
git push origin bakeup
hexo d -g
```

参考了[这位朋友](https://crazymilk.github.io/2015/12/28/GitHub-Pages-Hexo%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/#more)的备份方法，很棒，(๑•̀ㅂ•́)و✧。

列个软件清单：

---

WSL、[everything](http://www.voidtools.com/)、 [Typora](https://www.typora.io/#windows) 、shadow socks、chrome、firefox、notepad++ 、[一键上网脚本](https://findneo.github.io/2017/10/cmd-surfnet/)、 sublime、印象笔记、python2/3、git for windows、vmware/kali/win7、AgentRansack、7z、射手影音、SumatraPDF、~~微软办公系列~~ [WPS Office 2013 个人版](http://xianshuhua2.blog.163.com/blog/static/99760751201362854753660/) 、IObitUninstaller、snipaste

burpsuite、fiddler、wireshark、nmap、sqlmap、winhex、ziperello、weevely、winhex、御剑、awvs

### 添加gitment作为评论系统

项目介绍:https://imsun.net/posts/gitment-introduction/

在 *findneo.github.io\themes\next\layout\_partials\comments.swig* 的倒数第二个endif前添加

```javascript
{% elseif config.gitment.owner and config.gitment.commentrepo and config.gitment.clientid and config.gitment.clientsecret %}
		  <div id="gitmentContainer"></div>
			<link rel="stylesheet" href="https://imsun.github.io/gitment/style/default.css">
			<script src="https://imsun.github.io/gitment/dist/gitment.browser.js"></script>
			<script type="text/javascript">
			var gitment = new Gitment({
			  id: '{{page.title}}',
			  owner: '{{config.gitment.owner}}',
			  repo: '{{config.gitment.commentrepo}}',
			  oauth: {
			  client_id: '{{config.gitment.clientid}}',
			  client_secret: '{{config.gitment.clientsecret}}',
			  },
			})
			gitment.render('gitmentContainer')
			</script>
```

然后在站点配置文件末尾添加

```php
gitment: 
    owner: findneo
    commentrepo: findneo.github.io
    clientid: a3407310dfbeafbfe55a
    clientsecret: ad6c900a0fce4a44b8eeb40e1790ee7c7cc7575d
```

**需要注意的是每发布一篇文章都需要把该页面初始化一下其他人才可以评论，这是因为评论基于issue，并不是bug**

### 单独控制每篇文章版权声明

给 `themes\next\layout\_macro\post-copyright.swig` 加上控制流程，通过每个post的 front-matter控制，遇到想不加版权声明的文章就在头部加上 `notoriginal: true` 即可，不影响已有文章。

```
{% if not post.notoriginal %}
foo
{% endif %}
```

