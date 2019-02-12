# 调试方法

## HTTP 调试

1. [HTTPie](https://github.com/jakubroztocil/httpie), HTTP 命令行请求工具.
2. [Postman](https://www.getpostman.com/), HTTP 客户端请求工具, 可保存请求记录、可导出、可保存环境参数, 有浏览器扩展应用.
3. [Fiddler](https://www.telerik.com/fiddler), HTTP 调试.
4. [Charles](https://www.charlesproxy.com), HTTP 调试.

## JS 断点

1. 浏览器中设置断点进行调试。
2. JS 代码中写入 `debugger` 进行调试。

## 移动端调试

1. 页面：Chrome USB 链接手机调试页面。
2. HTTP：电脑和手机链接同一个 Wifi，Fiddler 调试手机 HTTP 请求。
3. 弹窗：可用 `alert(JSON.stringfy(obj, null, '\t'))` 或者 [vConsole](https://github.com/Tencent/vConsole) 工具弹出。

## Node.js

1. [nearform/node-clinic](https://github.com/nearform/node-clinic): 性能调试
2. [https://github.com/Tencent/TSW](Tencent/TSW): 日志、监控
