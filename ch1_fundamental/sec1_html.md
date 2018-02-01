# HTML

## HTML5 新标签

标签 | 描述
:--- | :---
`<article>` | 定义文章。
`<aside>` |   定义页面内容之外的内容。
`<audio>` |   定义声音内容。
`<bdi>` | 定义文本的文本方向，使其脱离其周围文本的方向设置。
`<canvas>` |  定义图形。
`<command>` | 定义命令按钮。
`<datalist>` |    定义下拉列表。
`<details>` | 定义元素的细节。
`<dialog>` |  定义对话框或窗口。
`<embed>` |   定义外部交互内容或插件。
`<figcaption>` |  定义 figure 元素的标题。
`<figure>` |  定义媒介内容的分组，以及它们的标题。
`<footer>` |  定义 section 或 page 的页脚。
`<header>` |  定义 section 或 page 的页眉。
`<keygen>` |  定义生成密钥。
`<mark>` |    定义有记号的文本。
`<meter>` |   定义预定义范围内的度量。
`<nav>` | 定义导航链接。
`<output>` |  定义输出的一些类型。
`<progress>` |    定义任何类型的任务的进度。
`<rp>` |  定义若浏览器不支持 ruby 元素显示的内容。
`<rt>` |  定义 ruby 注释的解释。
`<ruby>` |    定义 ruby 注释。
`<section>` | 定义 section。
`<source>` |  定义媒介源。
`<summary>` | 为 `<details>` 元素定义可见的标题。
`<time>` |    定义日期/时间。
`<video>` |   定义视频。
`<wbr>` | 定义视频。
{: class="table"}

reference: [w3school, HTML 参考手册](http://www.w3school.com.cn/tags/index.asp)

## 内联元素和块级元素

1. 块级元素

    ```html
    <address> <caption> <dd> <div> <dl> <dt> <fieldset>
    <form> <h1> <h2> <h3> <h4> <h5> <h6> <hr> <legend>
    <li> <noframes> <noscript> <ol> <ul> <p> <pre>
    <table> <tbody> <td> <tfoot> <th> <thead> <tr>
    ```

2. 内联元素

    ```html
    <a> <abbr> <acronym> <b> <bdo> <big> <br> <cite> <code>
    <dfn> <em> <i> <img> <input> <kbd> <label> <q> <samp> <select>
    <small> <span> <strong> <sub> <sup> <textarea> <tt> <var>
    ```

3. 可变元素：根据上下文确定是块级元素还是内联元素

    ```html
    <applet> <button> <del> <iframe> <ins> <map> <object> <script>
    ```

reference: [A1ter, 块级元素和行内元素的区别, segmentfault](http://segmentfault.com/a/1190000003714074)

## defer 和 async

```html
<script async src="script.js"></script>
<script defer src="script.js"></script>
```

> 1. defer 和 async 在网络读取（下载）这块儿是一样的，都是异步的（相较于 HTML 解析）
2. 它俩的差别在于脚本下载完之后何时执行，显然 defer 是最接近我们对于应用脚本加载和执行的要求的
3. 关于 defer，此图未尽之处在于它是按照加载顺序执行脚本的，这一点要善加利用
4. async 则是一个乱序执行的主，反正对它来说脚本的加载和执行是紧紧挨着的，所以不管你声明的顺序如何，只要它加载完了就会立刻执行
5. async 对于应用脚本的用处不大，因为它完全不考虑依赖（哪怕是最低级的顺序执行），不过它对于那些可以不依赖任何脚本或不被任何脚本依赖的脚本来说却是非常合适的，最典型的例子：Google Analytics

reference: [nightire, defer和async的区别, segmentfault](http://segmentfault.com/q/1010000000640869/a-1020000000641029)

## img 属性 alt 和 title

- alt：当图片无法显示时，将显示 alt 指定的文字。
- title：鼠标滑过时，会显示 title 指定文本。

## Web 存储

- localStorage - 没有时间限制的数据存储
- sessionStorage - 针对一个 session 的数据存储

> sessionStorage, in practice, is best used for temporary data storage.

(Cookie 4kb, userData 64kb, Flash 100kb, SQLite, HTML5 localStorage 5MB)

reference: [Web Storage 初探](http://segmentfault.com/a/1190000003936684), [Web 前端实现本地存储](http://segmentfault.com/a/1190000002701423), [Web Storage API](https://html.spec.whatwg.org/multipage/webstorage.html)
