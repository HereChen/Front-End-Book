# Appendix

1. [10 Things I Regret About Node.js, Ryan Dahl, JSConf, 2018](http://tinyclouds.org/jsconf2018.pdf), [video](https://www.youtube.com/watch?v=M3BM9TB-8yA)
2. [web.dev](https://web.dev): Web 开发指导.
3. [squoosh.app](https://squoosh.app/): 图片压缩.

## 读物

* [basarat/typescript-book](https://github.com/basarat/typescript-book), TypeScript, 有 Kindle 格式.
* [Functional-Light JavaScript, Kyle Simpson](https://github.com/getify/Functional-Light-JS)
* [Speaking JavaScript: An In-Depth Guide for Programmers, Dr. Axel Rauschmayer](http://speakingjs.com)

## 阅读

* [2019-07-09, Modern Script Loading, https://jasonformat.com](https://jasonformat.com/modern-script-loading/)

    文章描述了如何区分加载 JS 文件 (支持 module 的文件, 经过处理包含 polyfill 的文件). 方式有多种: 1、JS 或 HTML 标签判断是否包含 module 属性; 2、服务端判断 UserAgent (判断浏览器及版本). 基于方式 1, 可以将 polyfill 单独抽离出来, 只在需要的浏览器加载, 其余浏览器加载 module.

    ```html
    <!-- newer browsers won't load this bundle: -->
    <script nomodule src="polyfills.js"></script>

    <!-- all browsers load this one: -->
    <script src="/bundle.js"></script>
    ```

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
