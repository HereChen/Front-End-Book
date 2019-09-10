# 点击劫持/Clickjacking

点击劫持可以理解为, 以欺骗的方式诱导用户在某网站上进行操作. 欺骗的方式, 例如: 高仿网站; 将目标网站用 iframe 嵌入, 并置为透明. 欺骗的目的, 例如: 诱导用户登录获取授权.

**解决方法** 页面嵌套(被 `<frame>`、`<iframe>`、`<embed>`、`<object>` 嵌套) 方式, 可以通过设置响应头字段 `X-Frame-Options` 来配置. 可以配置 3 个值:

* `DENY`: 不允许页面被嵌套.
* `SAMEORIGIN`: 只允许同源嵌套(嵌套页面与被嵌套的页面同源).
* `ALLOW-FROM`: 用于设置允许嵌套的源(origin, 体现为域名、IP、协议、端口)

设置可参照 [X-Frame-Options, developer.mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options). 需要注意, `X-Frame-Options` 只能在服务端设置, 通过 HTML `meta` 标签设置无效.

> Furthermore, X-Frame-Options must be sent as an HTTP header field and is explicitly ignored by user agents when declared with a meta http-equiv tag. [HTTP Header Field X-Frame-Options, rfc7034](https://tools.ietf.org/html/rfc7034)

**实例** [http-server](https://github.com/http-party/http-server) 没有 `X-Frame-Options` 配置项，需要更改源码自行添加。

```diff
// https://github.com/http-party/http-server/blob/e1f5d2399d/lib/http-server.js
+ this.headers['X-Frame-Options'] = 'SAMEORIGIN';
  if (options.cors) {
    this.headers['Access-Control-Allow-Origin'] = '*';
    this.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Range';
```
