# Tips

## `JSON.parse` 比对象快

JS 引擎对 `JSON.parse` 的解析、编译、执行时间相对于 JS 的对象更快。如果需要自动转成 `JSON.parse` 可参考 [babel-plugin-object-to-json-parse](https://github.com/nd-02110114/babel-plugin-object-to-json-parse)。

```js
// https://v8.dev/blog/cost-of-javascript-2019#json
const data = { foo: 42, bar: 1337 }; // 🐌
const data = JSON.parse('{"foo":42,"bar":1337}'); // 🚀
```

阅读

* [The cost of parsing JSON](https://v8.dev/blog/cost-of-javascript-2019#json)。
* [[performance] use JSON.parse(jsonSource) for JSON modules](https://github.com/webpack/webpack/pull/9349)。
