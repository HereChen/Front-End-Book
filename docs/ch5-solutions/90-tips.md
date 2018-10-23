# 常见问题

## [移动端]滑动卡顿

问题描述：嵌入到 WebView 的页面经常出现因为页面滑动卡顿的各种问题。

解决：可对需要需要滚动的元素添加如下样式。

```css
.ele-need-scroll {
  -webkit-overflow-scrolling : touch;
}
```

## [移动端]图片上传后显示旋转 90 度

问题描述：手机上看照片正常的，通过 HTML5 加载进来显示，照片被旋转了 90 度。部分机型会有此问题。

## iOS 时间无法解析

由于不同平台的时间格式支持上的原因, 在 IOS 上会出现时间解析失败的情形.

```javascript
console.log(new Date('2017-10-16 00:00:00'))
// Invalid Date
console.log(Date.parse('2017-10-16 00:00:00'))
// NAN
```

为了适配各个平台, 可采用以下做法.

```javascript
var arr = '2017-10-16 00:00:00'.split(/[- :]/),
    date = new Date(arr[0], arr[1]-1, arr[2], arr[3], arr[4], arr[5]);
console.log(date);
```
