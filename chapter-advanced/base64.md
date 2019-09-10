# Base64

> * [The Base16, Base32, and Base64 Data Encodings](https://tools.ietf.org/html/rfc4648)
> * [8.3 Base64 utility methods](https://html.spec.whatwg.org/multipage/webappapis.html#atob)

```js
// string to Base64
window.btoa("string")

// Base64 to string
window.atob("string")
```

## Base64 与 URL

**Base64 编解码在 URL 中问题** 如果 Base64 编码后需要应用于 URL，需要注意，编码后可能会有 `/`、`=`、`+`。前后端加解密也会遇到类似的问题。URL 中，`/` 代表网址路径划分，`+` 取参数是空格，`=` 用于设置参数。搜索引擎中可以看到多个关键词的搜索就是用的 `+`，比如：`https://cn.bing.com/search?q=search+test`。

* 规范中提供了对 URL 和文件名安全的编码方法，`+` 和 `/` 分别换成 `-` 和 `_`。
* 针对 `=`，可在实际应用中，编码后去掉末尾的 `=`（`=` 是位数不够在末尾附加的），然后在解码时，位数不够在末尾补充 `=` 后再解码。

```javascript
var q = new URLSearchParams("var=er+3434");
q.get("var");
// "er 3434"
```

**针对 URL 安全的编解码库** [brianloveswords/base64url](https://github.com/brianloveswords/base64url) 这个库就是在编码后直接替换。

```javascript
function fromBase64(base64: string): string {
    return base64
        .replace(/=/g, "")
        .replace(/\+/g, "-")
        .replace(/\//g, "_");
}
```

**实现一个 URL 安全的编解码** 应用 `atob` 和 `btoa` 编写针对 URL 安全的（解决上面特殊字符问题）Base64 编解码。

```javascript
// base64.urlsafeEncode("qL8R4QIcQ_ZsRqOAbeRfcZhilN_MksRtDaErMA")
// base64.urlsafeDecode("cUw4UjRRSWNRL1pzUnFPQWJlUmZjWmhpbE4vTWtzUnREYUVyTUE9PQ==")
base64 = {
  urlsafeEncode: function(str) {
    // 实际编码得到的长度是 4 的倍数，此处不够则补足 "="
    return btoa(`${str}${Array(str.length % 4).fill("=").join("")}`
    .replace(/\-/g, "+")
    .replace(/_/g, "/"));
  },
  urlsafeDecode: function(str) {
    return atob(str)
    .replace(/=/g, "")
    .replace(/\+/g, "-")
    .replace(/\//g, "_");;
  }
}
```
