# a

## 不带请求网站的信息（`noopener noreferrer`）

1. 通过本站链接跳转到第三方网站链接后，在第三方网站可通过 `window.opener` 获取本站的信息。
2. 第三方网站设置了 HTTP `Referer` 的头检测，对跳转来源有限制。

为应对以上两个问题，可为`rel`属性配置 `noopener` 和 `noreferrer` 两个值。

```html
<a href="第三方网站地址" rel="noopener noreferrer">地址</a>
```

示例场景：之前遇到一个问题，需要跳转的网页是一个接口，有来源判断。在浏览器中直接访问接口没有问题，但是，通过本站`a`标签跳转过去就报错（404），最后发现是有来源检测。解决方法有两个：一是接口侧加白名单；二是更简单的方法，就是配置`rel="noopener noreferrer"`。

## 阅读

* [Link types, MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Link_types)
* [Referrer-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referrer-Policy)
