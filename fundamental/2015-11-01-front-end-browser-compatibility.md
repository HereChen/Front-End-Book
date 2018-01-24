---
date: 2015-10-17 17:37:10 PM
title: 前端系列之浏览器兼容性
categories: technology
---

## IE 条件注释

可以添加条件语句检测浏览器，针对性的编写样式。

{% highlight html %}
<!--[if IE 8]>
<body class="ie8">
<![endif]-->
<!--[if !IE]>
<body class="notie">
<![endif]-->
{% endhighlight %}

reference: [About conditional comments, msdn](https://msdn.microsoft.com/en-us/library/ms537512(v=vs.85).aspx)

## IE 支持 CSS

使用条件语句判断 IE，并用 CSS 表达式解决 (一般情况下不推荐采用表达式，效率低)。在 IE8 标准模式中，不支持 CSS Expression。

{% highlight css %}
/* 正常 IE6/IE7/IE8 不支持*/
min-height:50px;
/* 表达式 */
_height:expression((parseInt(this.currentStyle.height) < 50) ? 50 : this.clientHeight)
{% endhighlight %}

## IE6/IE7/IE8 支持 html5 新标签

( 1 ) 创建标签

{% highlight javascript %}
document.createElement('section'); // 其他标签一样处理
{% endhighlight %}

( 2 ) 使用方案 

- html5shiv：<https://github.com/aFarkas/html5shiv/> (用的也是 createElement())
- modernizr：<https://github.com/modernizr/modernizr/> (这个功能要多一点，还兼顾 CSS3，[更多](http://www.osmn00.com/translation/221.html))

## IE 兼容性测试

采用 [Modern.IE](https://dev.modern.ie/) 提供的[虚拟机](https://dev.modern.ie/tools/vms/windows/)测试。下载 [virtualbox](https://www.virtualbox.org/) (免费) 或者 [VMware](http://www.vmware.com/) (收费)，然后导入对应的下载包(不同系统 IE 版本不同)。

## 不支持 JavaScript

noscript 元素用来定义在脚本未被执行时的替代内容（文本）。此标签可被用于可识别 `<script>` 标签但无法支持其中的脚本的浏览器。

{% highlight html %}
<noscript>Your browser does not support JavaScript!</noscript>
{% endhighlight %}

reference: [HTML noscript 标签, w3school](http://www.w3school.com.cn/tags/tag_noscript.asp)

## 浏览器 hack

以 IE 为例，展示几个 CSS hack 方法，更多的见参考链接。

( 1 ) IE6

~~~ css
.selector { _property: value; }
.selector { -property: value; }
~~~

( 2 ) IE <= 7 ( ``! $ & * ( ) = % + @ , . / ` [ ] # ~ ? : < > |`` )

~~~ css
.selector { !property: value; }
.selector { $property: value; }
.selector { &property: value; }
.selector { *property: value; }
.selector { )property: value; }
.selector { =property: value; }
.selector { %property: value; }
.selector { +property: value; }
.selector { @property: value; }
.selector { ,property: value; }
.selector { .property: value; }
.selector { /property: value; }
.selector { `property: value; }
.selector { ]property: value; }
.selector { #property: value; }
.selector { ~property: value; }
.selector { ?property: value; }
.selector { :property: value; }
.selector { |property: value; }
~~~

( 3 ) IE 6-8

~~~ css
.selector { property: value\9; }
.selector { property/*\**/: value\9; }
~~~

reference: <http://browserhacks.com/>

## CSS3 前缀

虽然目前 CSS3 得到广泛支持，但各个浏览器厂商对标准实现并不完全一样，可以对 CSS3 使用前缀。建议把特殊的 CSS 语句放在前面，一般的语句放置在后面。可以使用 [Autoprefixer](https://github.com/search?utf8=%E2%9C%93&q=Autoprefixer) 自动添加前缀。

- `-moz-` Firefox, 
- `-webkit-` Safari, Chrome
- `-o-` Opera (不过, Opera 和 Chrome 现在都采用 Blink 内核)
- `-ms-` Internet Explorer

## 浏览器检测

通过 js 检测浏览器可以分为两种：依靠浏览器各自的特性检测；通过浏览器对象检测 `navigator.userAgent`。

( 1 ) navigator.userAgent

可直接查看此插件的 js 代码：[jquery-browser-plugin](https://github.com/gabceb/jquery-browser-plugin)。实测了 IE、Firefox、Opera、Chrome，输出结果都是对的。

{% highlight html %}
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="jquery.browser.js"></script>
</head>
<body>
<script>
    console.log("jQBrowser.webkit: " + jQBrowser.webkit);
    console.log("jQBrowser.mozilla: " + jQBrowser.mozilla);
    console.log("jQBrowser.msie: " + jQBrowser.msie);
    console.log("jQBrowser.version: " + jQBrowser.version);
</script>
</body>
</html>
{% endhighlight %}

( 2 ) 通过特性检测判断：占位待续

reference: [露兜博客, 检测访客浏览器的2种方法, 2009](http://www.ludou.org/2-way-to-detect-browser.html)