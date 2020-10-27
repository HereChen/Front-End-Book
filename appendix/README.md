# 附录

* [freeCodeCamp/devdocs](https://github.com/freeCodeCamp/devdocs) 离线文档，Web 应用，可作为 PWA 安装。
* [Module ngx_http_ssi_module](http://nginx.org/en/docs/http/ngx_http_ssi_module.html)

  可以在 nginx 层面处理 HTML 里面的逻辑，然后响应请求。具体一点，可以作条件判断，文件替换等。

  ```html
  <!-- https://github.com/jitsi/jitsi-meet/blob/master/index.html -->
  <script><!--#include virtual="/interface_config.js" --></script>
  <script><!--#include virtual="/logging_config.js" --></script>
  ```
