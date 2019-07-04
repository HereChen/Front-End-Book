# 跨站脚本攻击/XSS (Cross-site Scripting)

> Cross-Site Scripting (XSS) attacks are a type of injection, in which malicious scripts are injected into otherwise benign and trusted websites. [Cross-site Scripting (XSS)](https://www.owasp.org/index.php/Cross-site_Scripting_(XSS))

XSS 通过将可执行的脚本注入到 Dom 中, 或者提交到服务器, 在服务器响应时再注入到 Dom 中. 注入的方式比如: 用户输入框、富文本编辑器、URL 参数. 可以直接注入 `script` 标签, 也可以是作为 HTML 标签的属性. 富文本编辑器通常涉及比较多的注入方式, 因此比较难处理, 需要服务端配合. 比如 TinyMCE 处理了 `common XSS` (<https://www.tiny.cloud/docs/advanced/security/>).

防范方式的一般方法是对用户输入进行过滤, 或者在插入到 Dom 之前过滤. 客户端过滤工具, 例如 [DOMPurify](https://github.com/cure53/DOMPurify)、[HTML sanitizer](https://github.com/google/closure-library/blob/master/closure/goog/html/sanitizer/htmlsanitizer.js); 服务端过滤工具, 例如 [OWASP Java HTML Sanitizer](https://www.owasp.org/index.php/OWASP_Java_HTML_Sanitizer_Project).

* 检查清单: [XSS Filter Evasion Cheat Sheet, https://www.owasp.org](https://www.owasp.org/index.php/XSS_Filter_Evasion_Cheat_Sheet)
* 防范清单: [XSS (Cross Site Scripting) Prevention Cheat Sheet, https://www.owasp.org](https://www.owasp.org/index.php/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet)
