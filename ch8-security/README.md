# Security

1. [OWASP Top 10 Application Security Risks - 2017](https://www.owasp.org/index.php/Top_10-2017_Top_10)
2. [OWASP/CheatSheetSeries](https://github.com/OWASP/CheatSheetSeries)
3. [appsecco/dvna](https://github.com/appsecco/dvna)

    > Damn Vulnerable NodeJS Application (DVNA) is a simple NodeJS application to demonstrate OWASP Top 10 Vulnerabilities and guide on fixing and avoiding these vulnerabilities.

## 点击劫持(Clickjacking)

**X-Frame-Options** 页面嵌套(被 `<frame>`、`<iframe>`、`<embed>`、`<object>` 嵌套) header 配置. 可以配置 3 个值:

* `DENY`: 不允许页面被嵌套.
* `SAMEORIGIN`: 只允许同源嵌套(嵌套页面与被嵌套的页面同源).
* `ALLOW-FROM`: 用于设置允许嵌套的源(origin, 体现为域名、IP、协议、端口)

设置可参照 [X-Frame-Options, developer.mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options). 需要注意, `X-Frame-Options` 只能在服务端设置, 通过 HTML `meta` 标签设置无效.

> Furthermore, X-Frame-Options must be sent as an HTTP header field and is explicitly ignored by user agents when declared with a meta http-equiv tag. [HTTP Header Field X-Frame-Options, rfc7034](https://tools.ietf.org/html/rfc7034)
