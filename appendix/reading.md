# Reading

* <https://developer.mozilla.org>
* <https://csswizardry.com>
* <https://css-tricks.com>
* <https://dev.to>
* <https://medium.com>
* <https://developers.google.cn/web/>
* <https://v8.dev/blog>
* [web.dev](https://web.dev): Web 开发指导。

## 书籍

* [JavaScript高级程序设计](https://book.douban.com/subject/10546125/)。目前看过的最好的一本前端书籍，全面、深入、易懂。要出第4版了[Professional JavaScript for Web Developers, 4th Edition](https://www.wiley.com/en-us/Professional+JavaScript+for+Web+Developers%2C+4th+Edition-p-9781119366447)。
* <https://exploringjs.com/> Dr. Axel Rauschmayer 的各种 JS 电子书。
* [Understanding ECMAScript 6, Nicholas C. Zakas](https://github.com/nzakas/understandinges6)
* [basarat/typescript-book](https://github.com/basarat/typescript-book), TypeScript, 有 Kindle 格式.
* [Functional-Light JavaScript, Kyle Simpson](https://github.com/getify/Functional-Light-JS)
* [Speaking JavaScript: An In-Depth Guide for Programmers, Dr. Axel Rauschmayer](http://speakingjs.com)
* [ruanyf/free-books](https://github.com/ruanyf/free-books) 一份免费书籍清单，包含 JavaScript。

## 阅读

* [2019-07-09, Modern Script Loading, https://jasonformat.com](https://jasonformat.com/modern-script-loading/)

    文章描述了如何区分加载 JS 文件 (支持 module 的文件, 经过处理包含 polyfill 的文件). 方式有多种: 1、JS 或 HTML 标签判断是否包含 module 属性; 2、服务端判断 UserAgent (判断浏览器及版本). 基于方式 1, 可以将 polyfill 单独抽离出来, 只在需要的浏览器加载, 其余浏览器加载 module.

    ```html
    <!-- newer browsers won't load this bundle: -->
    <script nomodule src="polyfills.js"></script>

    <!-- all browsers load this one: -->
    <script src="/bundle.js"></script>
    ```

* [2019-03-20, Learning to Learn , Sarah Drasner, https://css-tricks.com](https://css-tricks.com/learning-to-learn/)
* [2019-12-19, Handling broken images with the service worker](https://bitsofco.de/handling-broken-images-with-service-worker/)
* [2018-10-15, Smart Bundling: How To Serve Legacy Code Only To Legacy Browsers, https://www.smashingmagazine.com](https://www.smashingmagazine.com/2018/10/smart-bundling-legacy-code-browsers/)

    基本思路是划分两个环境, 分别打包, 在服务端区分响应. Browserslist 定义两个环境的浏览器配置(现代浏览器 modern和一般浏览器 legacy )现代浏览器 (Firefox 53+, Edge 15+, Chrome 58+, Safari 10.1+) , 再用 autoprefixer 处理 CSS.

    ```text
    [modern]
    Firefox >= 53
    Edge >= 15
    Chrome >= 58
    iOS >= 10.1

    [legacy]
    > 1%
    ```

    对于 JS, 有 3 个入口文件: modern 和 legacy 的 polyfill, 以及正常的业务逻辑文件 main.js. Webpack 根据环境配置分别打包. 现代浏览器也需要 polyfill 是因为浏览器实现不同, 对部分功能也需要抹平处理, 比如 `intersection-observer`.

* [2016-06-16, DNS 原理入门, 阮一峰](http://www.ruanyifeng.com/blog/2016/06/dns.html)。

    有工具介绍，`dig`、`host`、`whois`。

* [2010-06, An Eye Tracking Study on camelCase and under_score Identifier Styles, Sharif, Bonita, and Jonathan I. Maletic](http://www.cs.kent.edu/~jmaletic/papers/ICPC2010-CamelCaseUnderScoreClouds.pdf)
