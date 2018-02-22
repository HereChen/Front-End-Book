# 浏览器

## 浏览器兼容性

### IE6/IE7/IE8 支持 html5 新标签

#### 创建标签

```html
document.createElement('section'); // 其他标签一样处理
```

#### 使用JS方案

1. html5shiv：<https://github.com/aFarkas/html5shiv/> (用的也是 createElement())
2. modernizr：<https://github.com/modernizr/modernizr/> (这个功能要多一点，还兼顾 CSS3，[更多](http://www.osmn00.com/translation/221.html))

### IE 兼容性测试

[Modern.IE](https://dev.modern.ie/) 提供的[虚拟机](https://dev.modern.ie/tools/vms/windows/)测试。下载 [virtualbox](https://www.virtualbox.org/) (免费) 或者 [VMware](http://www.vmware.com/) (收费)，然后导入对应的下载包(不同系统 IE 版本不同)。如果是 Windows 10, 虚拟机可启用 Hyper-V.

### 提示不支持 JavaScript

noscript 元素用来定义在脚本未被执行时的替代内容（文本）。此标签可被用于可识别 `<script>` 标签但无法支持其中的脚本的浏览器。

```html
<noscript>Your browser does not support JavaScript!</noscript>
```

reference: [HTML noscript 标签, w3school](http://www.w3school.com.cn/tags/tag_noscript.asp)

### 浏览器 hack

以 IE 为例，展示几个 CSS hack 方法，更多的见参考链接。

**IE6**

```css
.selector { _property: value; }
.selector { -property: value; }
```

**IE <= 7** ( ``! $ & * ( ) = % + @ , . / ` [ ] # ~ ? : < > |`` )

```css
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
```

**IE 6-8**

```css
.selector { property: value\9; }
.selector { property/*\**/: value\9; }
```

reference: <http://browserhacks.com/>

### CSS3 前缀

虽然目前 CSS3 得到广泛支持，但各个浏览器厂商对标准实现并不完全一样，可以对 CSS3 使用前缀。建议把特殊的 CSS 语句放在前面，一般的语句放置在后面。可以使用 [Autoprefixer](https://github.com/search?utf8=%E2%9C%93&q=Autoprefixer) 自动添加前缀。

- `-moz-` Firefox,
- `-webkit-` Safari, Chrome
- `-o-` Opera (不过, Opera 和 Chrome 现在都采用 Blink 内核)
- `-ms-` Internet Explorer

### 浏览器/设备检测

通过 js 检测浏览器方法包括：条件语句检测, 依靠浏览器各自的特性检测；通过 `userAgent` 检测。

#### IE 条件语句

可以添加条件语句检测浏览器，针对性的编写样式。

```html
<!--[if IE 8]>
<body class="ie8">
<![endif]-->
<!--[if !IE]>
<body class="notie">
<![endif]-->
```

reference: [About conditional comments, msdn](https://msdn.microsoft.com/en-us/library/ms537512(v=vs.85).aspx)

#### userAgent

**userAgent 示例**

```
Chrome 60
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36

360 安全浏览器/极速模式
Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36 QIHU 360SE

360 安全浏览器/IE 兼容模式
Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; rv:11.0) like Gecko

IE 11
Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; rv:11.0) like Gecko

Edge 40
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36 Edge/15.15063
```

**userAgent 判别浏览器**

可直接查看此插件的 js 代码：[jquery-browser-plugin](https://github.com/gabceb/jquery-browser-plugin)。实测了 IE、Firefox、Opera、Chrome，输出结果都是对的。

```html
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
```

**userAgent 判别设备**

通过检测设备, 可以针对不同设备提供不同功能, 并处理不同设备的兼容需求.

```javascript
// 检测 IOS
ios = /iphone|ipod|ipad/i.test(window.navigator.userAgent);
// 检测 Android
android = /android/i.test(window.navigator.userAgent);
```

#### 通过特性检测判断

reference: [露兜博客, 检测访客浏览器的2种方法, 2009](http://www.ludou.org/2-way-to-detect-browser.html)

### IE 图标字体未加载降级处理 (IE icon)

IE 下图标字体未加载, 导致图标无法显示, `element-ui` 就存在这个情况. 可以判断浏览器是否是 IE, 若果是则加载覆盖的样式, 用文本或其他字符代替图标. 例如通过下面的方式, 修复表格中操作图标无法展示.

```css
.el-table .el-icon-delete:before {
  content: '删除';
}
```

```javascript
const ua = window.navigator.userAgent.toLowerCase()
// 不包含 Edge
let ifIE = ua.indexOf('msie') > -1 || ua.indexOf('trident') > -1
if (ifIE) {
  // 依赖 loadjs
  loadjs('/static/css/iefix.css')
}
```

## 本地缓存

- [详说 Cookie, LocalStorage 与 SessionStorage](http://jerryzou.com/posts/cookie-and-web-storage/)
