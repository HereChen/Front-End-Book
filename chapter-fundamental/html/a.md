# a

## 不带请求网站的信息

1. 通过本站链接跳转到第三方网站链接后, 可通过 `Window.opener` 获取本站的信息.
2. 第三方网站设置了 HTTP `Referer` 的头检测, 非本站不予响应.

为应对以上两个问题, 可分别配置 `noopener` 和 `noreferrer` 两个属性.

```html
<a href="第三方网站地址" rel="noopener noreferrer">地址</a>
```

## 参考及扩展阅读

* [Link types, MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Link_types)
* [Referrer-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referrer-Policy)
