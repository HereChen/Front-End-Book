# 响应式设计

关键就是应用媒体查询和相对单位这两个技术，实现响应式布局。

**JS 方案** 在视图尺寸改变（`onresize`）的时候，更改 `html` 元素的字体大小。然后用 `rem` 作为单位。

```js
// Vue.js
export default {
  methods: {
    // 应用加载后执行（mounted）
    onAppStart() {
      this.adptiveFont();
    },
    // 字体适配逻辑
    adptiveFont() {
      // 这里设置 html 元素字体大小
      const clientWidth = document.documentElement.clientWidth;
      const deviceWidth = clientWidth > 1300 ? 1300 : clientWidth;
      document.documentElement.style.fontSize = deviceWidth / 75 + "px";
    },
    // 尺寸改变时调用。
    // 需要考虑延时调用，不然会频繁更改尺寸，[Vue.resize](https://github.com/David-Desmaisons/Vue.resize) 有这个功能。
    onResize() {
      this.adptiveFont();
    }
  }
}
```

**CSS 方案** 采用媒体查询的方式设置根元素字体大小。然后用 `rem` 作为单位。

```css
@media (min-width : 375px) and (max-width : 667px) {
  html { font-size: 37.5px; }
}
```

## 阅读

* [2019-08-20, Elad Shechter, The New Responsive Design Evolution](https://medium.com/@elad/the-new-responsive-design-evolution-2bfb9b504a4e)

    这篇文章介绍了响应式设计一种思路，可以结合上文的 `rem` 应用。有以下几个关键点：

    1. 样式分为模块化的 SASS 文件、定义设备尺寸的文件。模块化的文件分为两部分：基本样式（与设备尺寸无关）、根据定义的设备尺寸进行媒体查询设置样式。
    2. 媒体查询需设置最小和最大的尺寸。只设置最小尺寸的话，会存在样式覆盖的问题，应该避免。
