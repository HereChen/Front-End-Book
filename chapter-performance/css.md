# CSS

> 1. A browser can’t render a page until it has built the Render Tree;
> 2. the Render Tree is the combined result of the DOM and the CSSOM;
> 3. the DOM is HTML plus any blocking JavaScript that needs to act upon it;
> 4. the CSSOM is all CSS rules applied against the DOM;
> 5. it’s easy to make JavaScript non-blocking with async and defer attributes;
> 6. making CSS asynchronous is much more difficult;
> 7. so a good rule of thumb to remember is that **your page will only render as quickly as your slowest stylesheet**.
>
> [CSS and Network Performance](https://csswizardry.com/2018/11/css-and-network-performance/)

一句话总结: 只有当所有样式加载完毕时(当 CSS 都在 head 中时), 页面才开始渲染. 因此优化的一个关键是让 CSS 尽快载入, 方式有两种: 减少 CSS 载入、加快 CSS 载入.

## Critical CSS: 只引入必须的样式

通过外链的方式引入 CSS 文件, 通常包含了大量无用的样式. 这里的 Critical 是指只包含渲染所必须的样式, 减少额外的开销, 加快视图渲染.

工具: [addyosmani/critical](https://github.com/addyosmani/critical)

## CSS 文件划分: 并行下载 CSS 文件

浏览器可以一次性可以加载多个文件, 通过划分 CSS 文件, 可以将原本串行的下载变为并行下载, 加快 CSS 载入. 通常不建议使用 `@import` 也是因为它和包含他的文件是串行下载, 但因为有打包工具, `@import` 的文件一般被合并替换, 不存在此问题.

划分的方法有: 按业务功能划分、按媒体(Media Queries)划分.

## 注意文件引入顺序

### CSS 文件

在最新的浏览器中, CSS 文件的下载只会阻止其随后的内容渲染. 这意味着我们可以根据功能划分 CSS, 并在内容的最开始引入.

```html
<body>
  <link rel="stylesheet" href="header.css" />
  <header></header>

  <link rel="stylesheet" href="main.css" />
  <main></main>

  <link rel="stylesheet" href="footer.css" />
  <footer></footer>
</body>
```

### CSS 文件和 JS 文件

对于通过 JS 创建标签引入的 JS 文件, 如果不依赖于对页面样式的查询(CSSOM Querying, 比如要获取某个元素的宽度), 应当将其置于 CSS 文件引入之前.

```html
<!-- sample1:  analytics.js 和 app.css 并行下载-->
<script>
  var script = document.createElement('script');
  script.src = "analytics.js";
  document.getElementsByTagName('head')[0].appendChild(script);
</script>
<link rel="stylesheet" href="app.css" />

<!-- sample2: app.css 下载完才下载 analytics.js -->
<link rel="stylesheet" href="app.css" />
<script>
  var script = document.createElement('script');
  script.src = "analytics.js";
  document.getElementsByTagName('head')[0].appendChild(script);
</script>
```

## 阅读

* [CSS and Network Performance](https://csswizardry.com/2018/11/css-and-network-performance/)
