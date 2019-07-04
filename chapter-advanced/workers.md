# Workers

1. Web Workers 通过 postMessage 与主线程通信, 用于执行主线程触发的任务.
2. Service Workers 通过 postMessage 与主线程通信, 作为主线程访问基础资源的代理, 比如网络和缓存, 因此可以用于缓存控制.
3. Worklet 是 Web Workers 的轻量级版本, 可以访问渲染阶段的底层接口, 比如可以用于执行 JS 或 WebAssembly 实现图像渲染和音频处理. WebAssembly 音频处理的例子 [googlechromelabs/web-audio-samples](https://googlechromelabs.github.io/web-audio-samples/audio-worklet/design-pattern/wasm/).

* [Ire Aderinokun, Web workers vs Service workers vs Worklets, bitsofco.de, 2018](https://bitsofco.de/web-workers-vs-service-workers-vs-worklets/)
* [Matt Gaunt, Service Workers: an Introduction, developers.google.cn, 2019](https://developers.google.cn/web/fundamentals/primers/service-workers/)
