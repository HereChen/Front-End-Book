# 调试

1. [Firefox Debugger](https://github.com/firefox-devtools/debugger.html), React 写的, 可以独立运行.
2. [WebReplay](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/WebReplay), Time Travel 调试方法, 可以用于重放 bug. 目前 Firefox Nightly macOS 上支持启用 WebReplay. ([jasonLaster/time-travel.md](https://gist.github.com/jasonLaster/1e220992c294a571dd9b59abd084ccf2), [Time travel debugging: A step-by-step guide.](https://www.youtube.com/watch?v=rDq1AN1kSn4))
3. [Righting Web Development, John Vilk, 2018](https://scholarworks.umass.edu/cgi/viewcontent.cgi?article=2507&context=dissertations_2), 这篇论文描述了 Web 调试的难点, 并针对这些难点提出了对应的工具. 比如: 自动检查内存泄漏的[BLeak](https://github.com/plasma-umass/BLeak), Time Travel 调试[MCFLY](https://arxiv.org/pdf/1810.11865.pdf), 通过 JavaScript 解析其他语言[doppio](https://github.com/plasma-umass/doppio), [Browsix](https://browsix.org), BCause.

## UI 调试

1. [VisBug](https://github.com/GoogleChromeLabs/ProjectVisBug), 一个可视化的 UI 调试工具, 可进行元素移动、变色、查看元素属性等, 提供浏览器扩展, 直接在浏览器里面调试.
2. Chrome 开发工具(Devtools), 可直接编辑 CSS 的源文件(Devtools -> Sources -> Page), 改好了复制到本地.
3. Firefox 开发工具, 后期可能提供 CSS 修改后复制 diff 代码.

## HTTP 调试

1. [HTTPie](https://github.com/jakubroztocil/httpie), HTTP 命令行请求工具.
2. [Postman](https://www.getpostman.com/), HTTP 客户端请求工具, 可保存请求记录、可导出、可保存环境参数, 有浏览器扩展应用. 也可设置代理, 记录 HTTP 的请求, 需要保存和提取参数时比较方便, 可以参阅[Capturing HTTP requests](https://learning.getpostman.com/docs/postman/sending_api_requests/capturing_http_requests/).
3. [Fiddler](https://www.telerik.com/fiddler), HTTP 调试. HTTP 断点调试,修改请求和响应等.
4. [Charles](https://www.charlesproxy.com), HTTP 调试. 和 Fiddler 类似, 但收费, 请求自动根据域名分类.

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
3. [Node.js debugging in VS Code](https://code.visualstudio.com/docs/nodejs/nodejs-debugging)
