# 兼容性问题

## 移动端键盘弹起

问题: 键盘弹起后遮挡输入框. 解决思路如下:

1. 判断是否是需要解决键盘弹起问题的设备: userAgent 检测 Android 或者 iOS.
2. 键盘弹起后会触发 resize 事件, 通过监听此事件添加处理逻辑.
3. 检查当前激活的元素是否是输入框类型(input, textarea 等, 因为其他情况也会触发 resize).
4. 将激活的输入框元素弹起到视图内(可见的范围内).

```javascript
// step 1
if (/android/.test(navigator.userAgent.toLocaleLowerCase())) {
  // step 2
  window.addEventListener("resize", function() {
    // step 3
    if (document.activeElement.tagName === "input") {
      // step 4
      document.activeElement.scrollIntoView();
    }
  })
}
```
