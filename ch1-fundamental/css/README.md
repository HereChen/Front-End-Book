# CSS

定位, 盒模型, 浮动, 媒体查询(自适应布局)。CSS 文件异步加载。

## 盒模型

IE 盒模型和标准存在区别。

## link 和 @import

- `@import` 和 link 混用时，可能会出现不同时下载的情况。
- 考虑两者混合使用的浏览器实现的不一样（下载次序）。

reference: [Steve Souders, don’t use @import](http://www.stevesouders.com/blog/2009/04/09/dont-use-import/), [外部引用CSS中 link与@import的区别](http://www.dreamdu.com/blog/2007/05/11/css_link_import/)

## 两栏等高布局

父元素设置 `overflow:hidden;`，子元素设置 `padding-bottom:10000px; margin-bottom:-10000px;`。
`overflow:hidden;` 截除超出的高度，`margin-bottom:-10000px;` 抵消较高内容超出的 `padding`。

``` html
<div id="fa">
  <div class="col">
    <p>1231321321</p>
    <p>1313213</p>
    <p>1313213</p>
    <p>1313213</p>
    <p>1313213</p>
    <p>1313213</p>
  </div>
  <div class="col">45645456456</div>
</div>
```

```css
#fa {
  width: 800px;
  margin: 0 auto;
  background-color: #1524e5;
  overflow: hidden;
}

.col {
  float: left;
  width: 50%;
  padding-bottom: 10000px;
  margin-bottom: -10000px;
}

.col:first-child {
  background-color: #34ef34;
}
.col:last-child {
  background-color: #ef34ef;
}
```

refernce: [CSS/两栏并列等高布局](http://segmentfault.com/a/1190000000625584)

## 扩展

1. [atomiks/30-seconds-of-css](https://github.com/atomiks/30-seconds-of-css): 一些实用的代码片段收集.
