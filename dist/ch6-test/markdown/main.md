介绍
====

功能测试工具
------------

1.  [puppeteer](https://github.com/GoogleChrome/puppeteer)：Headless
    Chrome Node API。
2.  [selenium](https://github.com/SeleniumHQ/selenium)：A browser
    automation framework and ecosystem。

单元测试工具
------------

1.  [Jasmine](https://github.com/jasmine/jasmine)：Simple JavaScript
    testing framework for browsers and node.js。
2.  [mocha](https://github.com/mochajs/mocha)：simple, flexible, fun
    javascript test framework for node.js & the browser。
3.  [karma](https://github.com/karma-runner/karma)：Spectacular Test
    Runner for JavaScript。

扩展
----

1.  [Getting Started with Headless
    Chrome](https://developers.google.cn/web/updates/2017/04/headless-chrome)

调试方法
========

JS 断点
-------

1.  浏览器中设置断点进行调试。
2.  JS 代码中写入 `debugger` 进行调试。

移动端调试
----------

1.  页面：Chrome USB 链接手机调试页面。
2.  HTTP：电脑和手机链接同一个 Wifi，Fiddler 调试手机 HTTP 请求。
3.  弹窗：可用 `alert(JSON.stringfy(obj, null, '\t'))` 或者
    [vConsole](https://github.com/Tencent/vConsole) 工具弹出。
