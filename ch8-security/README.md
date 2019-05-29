# Security

1. [OWASP Top 10 Application Security Risks - 2017](https://www.owasp.org/index.php/Top_10-2017_Top_10)
2. [OWASP/CheatSheetSeries](https://github.com/OWASP/CheatSheetSeries)
3. [appsecco/dvna](https://github.com/appsecco/dvna)

    > Damn Vulnerable NodeJS Application (DVNA) is a simple NodeJS application to demonstrate OWASP Top 10 Vulnerabilities and guide on fixing and avoiding these vulnerabilities.

## 点击劫持(Clickjacking)

点击劫持可以理解为, 以欺骗的方式诱导用户在某网站上进行操作. 欺骗的方式, 例如: 高仿网站; 将目标网站用 iframe 嵌入, 并置为透明. 欺骗的目的, 例如: 诱导用户登录获取授权.

**X-Frame-Options** 页面嵌套(被 `<frame>`、`<iframe>`、`<embed>`、`<object>` 嵌套) header 配置. 可以配置 3 个值:

* `DENY`: 不允许页面被嵌套.
* `SAMEORIGIN`: 只允许同源嵌套(嵌套页面与被嵌套的页面同源).
* `ALLOW-FROM`: 用于设置允许嵌套的源(origin, 体现为域名、IP、协议、端口)

设置可参照 [X-Frame-Options, developer.mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options). 需要注意, `X-Frame-Options` 只能在服务端设置, 通过 HTML `meta` 标签设置无效.

> Furthermore, X-Frame-Options must be sent as an HTTP header field and is explicitly ignored by user agents when declared with a meta http-equiv tag. [HTTP Header Field X-Frame-Options, rfc7034](https://tools.ietf.org/html/rfc7034)

## Unrestricted File Upload (文件上传漏洞)

文件上传漏洞是指用户上传可执行的文件到服务器, 并获取服务器权限 (webshell). 比如: 微软的 Word/Excel/Powerpoint 可通过 VBA Macro 和 OLE package 嵌入病毒; Adobe PDF 可以通过附件嵌入病毒; 图片文件可以将可执行文件伪装成图片.

**解决方法** 前端只能通过文件类型 (`File.type`) 初步限制, 限制不合法的文件类型上传. 实际解决需要在服务端判断文件是否包含病毒, 或者将上传的文件夹设置为不可执行.

1. <https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Protect_FileUpload_Against_Malicious_File.md>
2. <https://www.owasp.org/index.php/Unrestricted_File_Upload>
