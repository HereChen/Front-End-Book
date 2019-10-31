# 跨站脚本攻击/XSS (Cross-site Scripting)

> Cross-Site Scripting (XSS) attacks are a type of injection, in which malicious scripts are injected into otherwise benign and trusted websites. [Cross-site Scripting (XSS)](https://www.owasp.org/index.php/Cross-site_Scripting_(XSS))

XSS 可以简单理解为：通过将非网站预期的 JS 注入到网站中并执行实现的攻击方式。XSS 通过将可执行的脚本注入到 Dom 中，或者提交到服务器，在服务器响应时再注入到 Dom 中。注入的方式比如: 用户输入框、富文本编辑器、URL 参数。可以直接注入 `script` 标签，也可以是作为 HTML 标签的属性。富文本编辑器通常涉及比较多的注入方式，因此比较难处理，需要服务端配合。比如 TinyMCE 处理了 `common XSS` (<https://www.tiny.cloud/docs/advanced/security/>)。

## 防范

### 输入端避免被注入

防范方式的一般方法是对用户输入进行过滤，或者在插入到 Dom 之前过滤. 客户端过滤工具，例如 [DOMPurify](https://github.com/cure53/DOMPurify)、[HTML sanitizer](https://github.com/google/closure-library/blob/master/closure/goog/html/sanitizer/htmlsanitizer.js); 服务端过滤工具, 例如 [OWASP Java HTML Sanitizer](https://www.owasp.org/index.php/OWASP_Java_HTML_Sanitizer_Project)。

### 设立白名单拒绝执行

通过在服务端配置设立白名单的方式，告诉浏览器哪些 JS 是被信任的，其余内容浏览器将拒绝执行。依赖于两个因素：服务端配置 header `Content-Security-Policy`、浏览器支持。页面 `meta` 标签也可以设置，但是有部分限制，建议在 HTTP header 设置。

**外联 JS 白名单设置** 允许当前网站的脚本和 cdn.jsdelivr.net。

```http
Content-Security-Policy: default-src "self" https://cdn.jsdelivr.net
```

**内联 JS 白名单设置** 有内联方案，但是不建议 JS 代码内联。（发现腾讯文档在用）

```html
<script nonce="6baa69890a9a99b9">
  console.log("test")
</script>
```

```http
Content-Security-Policy: script-src 'nonce-6baa69890a9a99b9'
```

**外联 JS 防篡改** 基于 [Subresource Integrity](https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity) 这个技术来实现，通过校验文件的 hash 值来判断是否篡改。

```js
// 代码来源于腾讯文档
<script text="text/javascript"
    integrity="sha256-iK3tUiGq1habTl6Kouc/8CCB6yP/r5ZxY8nhTF9PIdA= sha384-8uSazLv8e2xdojCzHipSIik8GcEH+WZv2+8UW+xWqGAvmvFMwUQx9xztU/DCc5oo"
    src="//s2.url.cn/tim/docs/sheets/static/js/chunk-alloyexcel-part2-5a8b9c3bb4.js" crossorigin="anonymous"
    data-source="1"></script>
```

```http
Content-Security-Policy: require-sri-for script;
```

## 阅读

* 检查清单: [XSS Filter Evasion Cheat Sheet, https://www.owasp.org](https://www.owasp.org/index.php/XSS_Filter_Evasion_Cheat_Sheet)
* 防范清单: [XSS (Cross Site Scripting) Prevention Cheat Sheet, https://www.owasp.org](https://www.owasp.org/index.php/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet)
* [Content Security Policy, google](https://developers.google.cn/web/fundamentals/security/csp)
* [Content Security Policy, mozilla](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP)
