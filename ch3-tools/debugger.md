# 调试方法

## JS 断点

1. 浏览器中设置断点进行调试。
2. JS 代码中写入 `debugger` 进行调试。

## 移动端调试

1. 页面：Chrome USB 链接手机调试页面。
2. HTTP：电脑和手机链接同一个 Wifi，Fiddler 调试手机 HTTP 请求。
3. 弹窗：可用 `alert(JSON.stringfy(obj, null, '\t'))` 或者 [vConsole](https://github.com/Tencent/vConsole) 工具弹出。

## node 性能调试

1. [nearform/node-clinic](https://github.com/nearform/node-clinic)
