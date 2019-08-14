# 优化/OPTIMIZATION

加载优化，JS 优化，渲染优化，体验优化，防抖，节流。

## 性能优化目的

性能可以分为文件级和代码级两种。文件级的比如文件的加载速度，是和代码无关的；代码级的比如 HTML 嵌套太深会影响渲染，由代码编写影响性能。那么，可以从文件级和代码级两个方面优化性能，最终目的是：如果是处理数据的应用，就应该尽量快；如果是交互类的应用，就应该尽量流畅。

## 性能检查清单/指标

1. [Front-End Performance Checklist 2019](https://www.smashingmagazine.com/2019/01/front-end-performance-checklist-2019-pdf-pages/)
2. [User-centric Performance Metrics, Philip Walton, developers.google.cn](https://developers.google.cn/web/fundamentals/performance/user-centric-performance-metrics)。FCP（First Contentful Paint）、FMP（First Meaningful Paint）、TTI（Time to Interactive）。

## 发现性能问题

1. [PageSpeed Insights](https://developers.google.cn/speed/pagespeed/insights/)，Google 出的，输入网址在线测试 Web 应用的性能问题，并给出修改建议。
2. 浏览器开发工具，通常会有性能相关的工具，比如 Chrome Devtools 有检查 JavaScript 执行的 Performance，Audits 可以检查整个应用的运行，Network 可以查看资源请求相应情况。
3. [Lighthouse](https://github.com/GoogleChrome/lighthouse)，Chrome 的 Audits 集成的是 Lighthouse，这个工具也可以通过脚本的方式运行生成报告。

## 扩展阅读

1. [Web Performance 101, Ivan Akulov, 3perf, 2018](https://3perf.com/talks/web-perf-101)
2. [Why Performance Matters,  Jeremy Wagner, developers.google.cn](https://developers.google.cn/web/fundamentals/performance)
3. [The Cost Of JavaScript In 2018, Addy Osmani, medium.com, 2018](https://medium.com/@addyosmani/the-cost-of-javascript-in-2018-7d8950fbb5d4)
4. [精读 The Cost of JavaScript In 2018, Tao Jiang, hijiangtao.github.io, 2018](https://hijiangtao.github.io/2018/08/04/the-cost-of-javascript-in-2018/?utm_medium=hao.caibaojian.com&utm_source=hao.caibaojian.com)
5. [Accurately measuring layout on the web, Nolan Lawson, nolanlawson.com, 2018](https://nolanlawson.com/2018/09/25/accurately-measuring-layout-on-the-web/)
6. [Speed Matters](https://speedcurve.com/blog/)
