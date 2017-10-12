---
title: 博客搭建与自定义
tags: [hacklife]
date: 2017-09-26 18:29:02
categories: 备忘 
keywords: hexo,next,findneo
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

```yaml
### 冒号后注意留空  ##
# Hexo Configuration
## Docs: https://hexo.io/docs/configuration.html
## Source: https://github.com/hexojs/hexo/

# Site
title: findneo
subtitle: focused on cyber security
description: ctf,python,web security
author: findneo
language: zh-Hans
timezone: Asia/Shanghai

# URL
## If your site is put in a subdirectory, set url as 'http://yoursite.com/child' and root as '/child/'
url: https://findneo.github.io/
root: /
permalink: :year/:month/:day/:title/
permalink_defaults:

# Directory
source_dir: source
public_dir: public
tag_dir: tags
archive_dir: archives
category_dir: categories
code_dir: downloads/code
i18n_dir: :lang
skip_render:

# Writing
new_post_name: :title.md # File name of new posts
default_layout: post  #############################可自定义 blog\scaffold\post.md内容
titlecase: false # Transform title into titlecase
external_link: true # Open external links in new tab
filename_case: 0
render_drafts: false

###############################################################
post_asset_folder: true 
#开启后使用hexo new title会在blog\source\_posts下生成title.md和title文件夹，
#将markdown文件中需要用到的图片放到title文件夹里，直接![](name.jpg)引用即可
###############################################################

relative_link: false #############################别开，会很有趣。。
future: true
highlight:
  enable: true
  line_number: true
  auto_detect: false
  tab_replace:
  
# Home page setting
# path: Root path for your blogs index page. (default = '')
# per_page: Posts displayed per page. (0 = disable pagination)
# order_by: Posts order. (Order by date descending by default)
index_generator:
  path: ''
  per_page: 10
  order_by: -date
  
# Category & Tag
default_category: uncategorized
category_map:
tag_map:

# Date / Time format
## Hexo uses Moment.js to parse and display date
## You can customize the date format as defined in
## http://momentjs.com/docs/#/displaying/format/
date_format: YYYY-MM-DD
time_format: HH:mm:ss

# Pagination
## Set per_page to 0 to disable pagination
per_page: 10
pagination_dir: page

# Extensions
## Plugins: https://hexo.io/plugins/
## Themes: https://hexo.io/themes/
theme: next           ###########################填写使用的主题名字

# Deployment
## Docs: https://hexo.io/docs/deployment.html
deploy:
  type: git
  repo: git@github.com:findneo/findneo.github.io.git
  branch:  master

#######################################
##local search全局搜索功能
##参考 http://theme-next.iissnan.com/third-party-services.html#local-search 
search:
  path: search.xml
  field: all     #####索引范围 可选all,post等 
  format: html
  limit: 10000   #####最大索引文章数目
```

#### blog/themes/next/_config.yml

```yaml
# ---------------------------------------------------------------
# Theme Core Configuration Settings
# ---------------------------------------------------------------

# Set to true, if you want to fully override the default configuration.
# Useful if you don't want to inherit the theme _config.yml configurations.
override: true

# ---------------------------------------------------------------
# Site Information Settings
# ---------------------------------------------------------------

# Put your favicon.ico into `hexo-site/source/` directory.
favicon: /favicon.ico

# Set default keywords (Use a comma to separate)
keywords: "ctf, python, web security, linux"

# Set rss to false to disable feed link.
# Leave rss as empty to use site's feed link.
# Set rss to specific value if you have burned your feed already.
rss:

# Specify the date when the site was setup
since: 2017

# icon between year and author @Footer
# authoricon: heart
authoricon: tint

# Footer `powered-by` and `theme-info` copyright
copyright: false


# ---------------------------------------------------------------
# SEO Settings
# ---------------------------------------------------------------

# Canonical, set a canonical link tag in your hexo, you could use it for your SEO of blog.
# See: https://support.google.com/webmasters/answer/139066
# Tips: Before you open this tag, remember set up your URL in hexo _config.yml ( ex. url: http://yourdomain.com )
canonical: true

# Change headers hierarchy on site-subtitle (will be main site description) and on all post/pages titles for better SEO-optimization.
seo: true

# If true, will add site-subtitle to index page, added in main hexo config.
# subtitle: Subtitle
index_with_subtitle: false


# ---------------------------------------------------------------
# Menu Settings
# ---------------------------------------------------------------

# When running the site in a subdirectory (e.g. domain.tld/blog), remove the leading slash from link value (/archives -> archives).
# Usage: `Key: /link/ || icon`
# Key is the name of menu item. If translate for this menu will find in languages - this translate will be loaded; if not - Key name will be used. Key is case-senstive.
# Value before `||` delimeter is the target link.
# Value after `||` delimeter is the name of FontAwesome icon. If icon (with or without delimeter) is not specified, question icon will be loaded.
menu:
  home: / || home
  about: /about/ || user
  tags: /tags/ || tags
  categories: /categories/ || th
  archives: /archives/ || archive
  #schedule: /schedule/ || calendar
  #sitemap: /sitemap.xml || sitemap
  #commonweal: /404/ || heartbeat

# Enable/Disable menu icons.
menu_icons:
  enable: true


# ---------------------------------------------------------------
# Scheme Settings
# ---------------------------------------------------------------

# Schemes
scheme: Muse
#scheme: Mist
#scheme: Pisces
#scheme: Gemini


# ---------------------------------------------------------------
# Sidebar Settings
# ---------------------------------------------------------------

# Social Links.
# Usage: `Key: permalink || icon`
# Key is the link label showing to end users.
# Value before `||` delimeter is the target permalink.
# Value after `||` delimeter is the name of FontAwesome icon. If icon (with or without delimeter) is not specified, globe icon will be loaded.
social:
  GitHub: https://github.com/findneo || github
  E-Mail: mailto:1285470533@qq.com || envelope
  #Google: https://plus.google.com/yourname || google
  #Twitter: https://twitter.com/yourname || twitter
  #FB Page: https://www.facebook.com/yourname || facebook
  #VK Group: https://vk.com/yourname || vk
  #StackOverflow: https://stackoverflow.com/yourname || stack-overflow
  #YouTube: https://youtube.com/yourname || youtube
  #Instagram: https://instagram.com/yourname || instagram
  #Skype: skype:yourname?call|chat || skype

social_icons:
  enable: true
  icons_only: false
  transition: false

# Blog rolls
links_title: Links
#links_layout: block
links_layout: inline
links:
  XMU-Ph0en1x: https://ph0en1x.com/
  CHYbeta: https://chybeta.github.io/
  lzhtony: https://lxpark.com/
  Mads: http://blog.madsome.cn/
  中國哲學書電子化計劃: http://ctext.org/zh
  太极书馆: http://www.8bei8.com/


# Sidebar Avatar
# in theme directory(source/images): /images/avatar.gif
# in site  directory(source/uploads): /uploads/avatar.gif
avatar: /images/avatar.png

# Table Of Contents in the Sidebar
toc:
  enable: true

  # Automatically add list number to toc.
  number: true

  # If true, all words will placed on next lines if header width longer then sidebar width.
  wrap: true

# Creative Commons 4.0 International License.
# http://creativecommons.org/
# Available: by | by-nc | by-nc-nd | by-nc-sa | by-nd | by-sa | zero
#creative_commons: by-nc-sa
#creative_commons: by-nc-sa

sidebar:
  # Sidebar Position, available value: left | right
  position: left
  #position: right

  # Sidebar Display, available value:
  #  - post    expand on posts automatically. Default.
  #  - always  expand for all pages automatically
  #  - hide    expand only when click on the sidebar toggle icon.
  #  - remove  Totally remove sidebar including sidebar toggle.
  #display: post
  #display: always
  display: hide
  #display: remove

  # Sidebar offset from top menubar in pixels.
  offset: 12
  offset_float: 12

  # Back to top in sidebar
  b2t: false

  # Scroll percent label in b2t button
  scrollpercent: false

  # Enable sidebar on narrow view
  onmobile: false


# ---------------------------------------------------------------
# Post Settings
# ---------------------------------------------------------------

# Automatically scroll page to section which is under <!-- more --> mark.
scroll_to_more: false

# Automatically saving scroll position on each post/page in cookies.
save_scroll: true

# Automatically excerpt description in homepage as preamble text.
excerpt_description: true

# Automatically Excerpt. Not recommend.
# Please use <!-- more --> in the post to control excerpt accurately.
auto_excerpt:
  enable: false
  length: 150

# Post meta display settings
post_meta:
  item_text: false
  created_at: true
  updated_at: true
  categories: true

# Post wordcount display settings
# Dependencies: https://github.com/willin/hexo-wordcount
post_wordcount:
  item_text: false
  wordcount: true
  min2read: true
  totalcount: false
  separated_meta: false

# Wechat Subscriber
#wechat_subscriber:
  #enabled: true
  #qcode: /path/to/your/wechatqcode ex. /uploads/wechat-qcode.jpg
  #description: ex. subscribe to my blog by scanning my public wechat account

# Reward
#reward_comment: Donate comment here
#wechatpay: /images/wechatpay.jpg
#alipay: /images/alipay.jpg
#bitcoin: /images/bitcoin.png

# Declare license on posts
post_copyright:
  enable: true
  license: 署名-非商业性使用-禁止演绎 4.0 国际 
  license_url: https://creativecommons.org/licenses/by-nc-nd/4.0/
  


# ---------------------------------------------------------------
# Misc Theme Settings
# ---------------------------------------------------------------

# Reduce padding / margin indents on devices with narrow width.
mobile_layout_economy: false

# Android Chrome header panel color ($black-deep).
android_chrome_color: "#222"

# Custom Logo.
# !!Only available for Default Scheme currently.
# Options:
#   enabled: [true/false] - Replace with specific image
#   image: url-of-image   - Images's url
custom_logo:
  enabled: false
  image:

# Code Highlight theme
# Available value:
#    normal | night | night eighties | night blue | night bright
# https://github.com/chriskempson/tomorrow-theme
highlight_theme: night bright


# ---------------------------------------------------------------
# Font Settings
# - Find fonts on Google Fonts (https://www.google.com/fonts)
# - All fonts set here will have the following styles:
#     light, light italic, normal, normal italic, bold, bold italic
# - Be aware that setting too much fonts will cause site running slowly
# - Introduce in 5.0.1
# ---------------------------------------------------------------
# CAUTION! Safari Version 10.1.2 bug: https://github.com/iissnan/hexo-theme-next/issues/1844
# To avoid space between header and sidebar in Pisces / Gemini themes recommended to use Web Safe fonts for `global` (and `logo`):
# Arial | Tahoma | Helvetica | Times New Roman | Courier New | Verdana | Georgia | Palatino | Garamond | Comic Sans MS | Trebuchet MS
# ---------------------------------------------------------------
font:
  enable: false

  # Uri of fonts host. E.g. //fonts.googleapis.com (Default).
  host:

  # Font options:
  # `external: true` will load this font family from `host` above.
  # `family: Times New Roman`. Without any quotes.
  # `size: xx`. Use `px` as unit.

  # Global font settings used on <body> element.
  global:
    external: true
    family: Lato
    size:

  # Font settings for Headlines (h1, h2, h3, h4, h5, h6).
  # Fallback to `global` font settings.
  headings:
    external: true
    family:
    size:

  # Font settings for posts.
  # Fallback to `global` font settings.
  posts:
    external: true
    family:

  # Font settings for Logo.
  # Fallback to `global` font settings.
  logo:
    external: true
    family:
    size:

  # Font settings for <code> and code blocks.
  codes:
    external: true
    family:
    size:


# ---------------------------------------------------------------
# Third Party Services Settings
# ---------------------------------------------------------------

# MathJax Support
mathjax:
  enable: false
  per_page: false
  cdn: //cdn.bootcss.com/mathjax/2.7.1/latest.js?config=TeX-AMS-MML_HTMLorMML

# Han Support docs: https://hanzi.pro/
han: false

# Swiftype Search API Key
#swiftype_key:

# Baidu Analytics ID
#baidu_analytics: ea32443372f33a0c544614d28ab0a4a0

# Duoshuo ShortName
#duoshuo_shortname:

# Disqus
disqus:
  enable: false
  shortname:
  count: true

# Hypercomments
#hypercomments_id:

# changyan
changyan:
  enable: false
  appid:
  appkey:


# Valine.
# You can get your appid and appkey from https://leancloud.cn
# more info please open https://github.com/xCss/Valine
valine:
  enable: false
  appid:  # your leancloud application appid
  appkey:  # your leancloud application appkey
  notify: false # mail notifier , https://github.com/xCss/Valine/wiki
  verify: false # Verification code
  placeholder: Comment input placeholder

# Support for youyan comments system.
# You can get your uid from http://www.uyan.cc
#youyan_uid: your uid

# Support for LiveRe comments system.
# You can get your uid from https://livere.com/insight/myCode (General web site)
#livere_uid: your uid

# Baidu Share
# Available value:
#    button | slide
# Warning: Baidu Share does not support https.
#baidushare:
##  type: button

# Share
# This plugin is more useful in China, make sure you known how to use it.
# And you can find the use guide at official webiste: http://www.jiathis.com/.
# Warning: JiaThis does not support https.
#jiathis:
  ##uid: Get this uid from http://www.jiathis.com/
#add_this_id:

# Share
#duoshuo_share: true

# Google Webmaster tools verification setting
# See: https://www.google.com/webmasters/
#google_site_verification:

# Google Analytics
#google_analytics:

# Bing Webmaster tools verification setting
# See: https://www.bing.com/webmaster/
#bing_site_verification:

# Yandex Webmaster tools verification setting
# See: https://webmaster.yandex.ru/
#yandex_site_verification:

# CNZZ count
#cnzz_siteid:

# Application Insights
# See https://azure.microsoft.com/en-us/services/application-insights/
# application_insights:

# Make duoshuo show UA
# user_id must NOT be null when admin_enable is true!
# you can visit http://dev.duoshuo.com get duoshuo user id.
duoshuo_info:
  ua_enable: false
  admin_enable: false
  user_id: 0
  #admin_nickname: Author



# Facebook SDK Support.
# https://github.com/iissnan/hexo-theme-next/pull/410
facebook_sdk:
  enable: false
  app_id:       #<app_id>
  fb_admin:     #<user_id>
  like_button:  #true
  webmaster:    #true

# Facebook comments plugin
# This plugin depends on Facebook SDK.
# If facebook_sdk.enable is false, Facebook comments plugin is unavailable.
facebook_comments_plugin:
  enable: false
  num_of_posts: 10  # min posts num is 1
  width: 100%       # default width is 550px
  scheme: light     # default scheme is light (light or dark)

# VKontakte API Support.
# To get your AppID visit https://vk.com/editapp?act=create
vkontakte_api:
  enable: false
  app_id:       #<app_id>
  like:         true
  comments:     true
  num_of_posts: 10

# Star rating support to each article.
# To get your ID visit https://widgetpack.com
rating:
  enable: false
  id:     #<app_id>
  color:  fc6423


# Show number of visitors to each article.
# You can visit https://leancloud.cn get AppID and AppKey.
leancloud_visitors:
  enable: false
  app_id: #<app_id>
  app_key: #<app_key>

# Show PV/UV of the website/page with busuanzi.
# Get more information on http://ibruce.info/2015/04/04/busuanzi/
busuanzi_count:
  # count values only if the other configs are false
  enable: true
  # custom uv span for the whole site
  site_uv: true
  site_uv_header: <i class="fa fa-user">访问人数</i>
  site_uv_footer:
  # custom pv span for the whole site
  site_pv: true
  site_pv_header: <i class="fa fa-eye">总访问量</i>
  site_pv_footer: 次
  # custom pv span for one page only
  page_pv: true
  page_pv_header: <i class="fa fa-file-o"></i>
  page_pv_footer: views


# Tencent analytics ID
# tencent_analytics:

# Tencent MTA ID
# tencent_mta:


# Enable baidu push so that the blog will push the url to baidu automatically which is very helpful for SEO
baidu_push: true

# Google Calendar
# Share your recent schedule to others via calendar page
#
# API Documentation:
# https://developers.google.com/google-apps/calendar/v3/reference/events/list
calendar:
  enable: false
  calendar_id: <required>
  api_key: <required>
  orderBy: startTime
  offsetMax: 24
  offsetMin: 4
  timeZone:
  showDeleted: false
  singleEvents: true
  maxResults: 250

# Algolia Search
algolia_search:
  enable: false
  hits:
    per_page: 10
  labels:
    input_placeholder: Search for Posts
    hits_empty: "We didn't find any results for the search: ${query}"
    hits_stats: "${hits} results found in ${time} ms"

# Local search
# Dependencies: https://github.com/flashlab/hexo-generator-search
local_search:
  enable: true
  # if auto, trigger search by changing input
  # if manual, trigger search by pressing enter key or search button
  trigger: auto
  # show top n results per article, show all results by setting to -1
  top_n_per_article: 1


# ---------------------------------------------------------------
# Tags Settings
# ---------------------------------------------------------------

# External URL with BASE64 encrypt & decrypt.
# Usage: {% exturl text url "title" %}
# Alias: {% extlink text url "title" %}
exturl: false

# Note tag (bs-callout).
note:
  # Note tag style values:
  #  - simple    bs-callout old alert style. Default.
  #  - modern    bs-callout new (v2-v3) alert style.
  #  - flat      flat callout style with background, like on Mozilla or StackOverflow.
  #  - disabled  disable all CSS styles import of note tag.
  style: simple
  icons: false
  border_radius: 3
  # Offset lighter of background in % for modern and flat styles (modern: -12 | 12; flat: -18 | 6).
  # Offset also applied to label tag variables. This option can work with disabled note tag.
  light_bg_offset: 0

# Label tag.
label: true

# Tabs tag.
tabs:
  enable: true
  transition:
    tabs: false
    labels: true
  border_radius: 0


#! ---------------------------------------------------------------
#! DO NOT EDIT THE FOLLOWING SETTINGS
#! UNLESS YOU KNOW WHAT YOU ARE DOING
#! ---------------------------------------------------------------

# Motion
motion:
  enable: false
  async: true
  transition:
    # Transition variants:
    # fadeIn | fadeOut | flipXIn | flipXOut | flipYIn | flipYOut | flipBounceXIn | flipBounceXOut | flipBounceYIn | flipBounceYOut
    # swoopIn | swoopOut | whirlIn | whirlOut | shrinkIn | shrinkOut | expandIn | expandOut
    # bounceIn | bounceOut | bounceUpIn | bounceUpOut | bounceDownIn | bounceDownOut | bounceLeftIn | bounceLeftOut | bounceRightIn | bounceRightOut
    # slideUpIn | slideUpOut | slideDownIn | slideDownOut | slideLeftIn | slideLeftOut | slideRightIn | slideRightOut
    # slideUpBigIn | slideUpBigOut | slideDownBigIn | slideDownBigOut | slideLeftBigIn | slideLeftBigOut | slideRightBigIn | slideRightBigOut
    # perspectiveUpIn | perspectiveUpOut | perspectiveDownIn | perspectiveDownOut | perspectiveLeftIn | perspectiveLeftOut | perspectiveRightIn | perspectiveRightOut
    post_block: fadeIn
    post_header: slideDownIn
    post_body: slideDownIn
    coll_header: slideLeftIn

# Fancybox
fancybox: true

# Progress bar in the top during page loading.
pace: true
# Themes list:
#pace-theme-big-counter
#pace-theme-bounce
#pace-theme-barber-shop
#pace-theme-center-atom
#pace-theme-center-circle
#pace-theme-center-radar
#pace-theme-center-simple
#pace-theme-corner-indicator
#pace-theme-fill-left
#pace-theme-flash
#pace-theme-loading-bar
#pace-theme-mac-osx
#pace-theme-minimal
# For example
# pace_theme: pace-theme-center-simple
pace_theme: pace-theme-minimal

# Canvas-nest
canvas_nest: false

# three_waves
three_waves: false

# canvas_lines
canvas_lines: false

# canvas_sphere
canvas_sphere: false

# Only fit scheme Pisces
# Canvas-ribbon
canvas_ribbon: false

# Script Vendors.
# Set a CDN address for the vendor you want to customize.
# For example
#    jquery: https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js
# Be aware that you should use the same version as internal ones to avoid potential problems.
# Please use the https protocol of CDN files when you enable https on your site.
vendors:
  # Internal path prefix. Please do not edit it.
  _internal: lib

  # Internal version: 2.1.3
  jquery:

  # Internal version: 2.1.5
  # See: http://fancyapps.com/fancybox/
  fancybox:
  fancybox_css:

  # Internal version: 1.0.6
  # See: https://github.com/ftlabs/fastclick
  fastclick:

  # Internal version: 1.9.7
  # See: https://github.com/tuupola/jquery_lazyload
  lazyload:

  # Internal version: 1.2.1
  # See: http://VelocityJS.org
  velocity:

  # Internal version: 1.2.1
  # See: http://VelocityJS.org
  velocity_ui:

  # Internal version: 0.7.9
  # See: https://faisalman.github.io/ua-parser-js/
  ua_parser:

  # Internal version: 4.6.2
  # See: http://fontawesome.io/
  fontawesome:

  # Internal version: 1
  # https://www.algolia.com
  algolia_instant_js:
  algolia_instant_css:

  # Internal version: 1.0.2
  # See: https://github.com/HubSpot/pace
  # Or use direct links below:
  # pace: //cdn.bootcss.com/pace/1.0.2/pace.min.js
  # pace_css: //cdn.bootcss.com/pace/1.0.2/themes/blue/pace-theme-flash.min.css
  pace:
  pace_css:

  # Internal version: 1.0.0
  # https://github.com/hustcc/canvas-nest.js
  canvas_nest:

  # three
  three:

  # three_waves
  # https://github.com/jjandxa/three_waves
  three_waves:

  # three_waves
  # https://github.com/jjandxa/canvas_lines
  canvas_lines:

  # three_waves
  # https://github.com/jjandxa/canvas_sphere
  canvas_sphere:

  # Internal version: 1.0.0
  # https://github.com/zproo/canvas-ribbon
  canvas_ribbon:

  # Internal version: 3.3.0
  # https://github.com/ethantw/Han
  han:


# Assets
css: css
js: js
images: images

# Theme version
version: 5.1.2
```

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