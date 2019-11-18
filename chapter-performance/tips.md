# Tips

* JS 引擎对 `JSON.parse` 的解析、编译、执行时间相对于 JS 的对象更快。可阅读原文：[The cost of parsing JSON](https://v8.dev/blog/cost-of-javascript-2019#json)。如果需要自动转成 `JSON.parse` 可参考 [babel-plugin-object-to-json-parse](https://github.com/nd-02110114/babel-plugin-object-to-json-parse)。

    ```js
    // https://v8.dev/blog/cost-of-javascript-2019#json
    const data = { foo: 42, bar: 1337 }; // 🐌
    const data = JSON.parse('{"foo":42,"bar":1337}'); // 🚀
    ```
