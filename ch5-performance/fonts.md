# 字体

**CSS font-display** 中文字体文件一般较大, 在样式没有下载下来的情况下, 页面将是空白, 可以通过异步的方式挂载样式.

```css
/* 未设置的情况默认是 auto, 会花费 3s 等待字体下载*/
body {
  font-display: auto;
}

/* 设置的字体下载完成后立即采用 */
body {
  font-display: swap;
}

/* 短暂的等待下载后, 如果设置的字体仍然无效, 则先应用本地有效的字体, 等字体有效(下载完成)则启用 */
body {
  font-display: fallback;
}

/* 与 fallback 相似, 区别在于需要下次页面刷新时字体才生效 */
body {
  font-display: optional;
}
```

**Google Fonts `font-display: swap`** [Suggestion: Implement font-display](https://github.com/google/fonts/issues/358)

```text
https://fonts.googleapis.com/css?family=Noto+Sans+SC:400,700|Noto+Sans:400,700&display=swap
```

## 扩展阅读

1. [Web safe fonts, developer.mozilla.org](https://developer.mozilla.org/en-US/docs/Learn/CSS/Styling_text/Fundamentals#Web_safe_fonts)
2. [font-display, 3perf.com](https://3perf.com/talks/web-perf-101/#fonts-fallback-1)
