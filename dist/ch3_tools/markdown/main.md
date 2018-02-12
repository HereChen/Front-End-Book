Visual Studio Code
==================

1.  主页: <https://code.visualstudio.com/>
2.  快捷键:
    <https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf>

基本用法
--------

1.  命令搜索工具: `F1`.
2.  扩展安装: `ext install extensionname`

Vue.js 配置
-----------

### 代码高亮

1.  安装 Vetur 扩展.

### ESLint 问题自动修复

``` {.json}
{
  "eslint.enable": true,
  "eslint.options": {
    "extensions": [
      ".html",
      ".js",
      ".vue"
    ]
  },
  "eslint.validate": [{
      "language": "html",
      "autoFix": true
    },
    {
      "language": "vue",
      "autoFix": true
    },
    {
      "language": "javascript",
      "autoFix": true
    }
  ]
}
```

Vue-CLI
=======

1.  GitHub: <https://github.com/vuejs/vue-cli>

代理
----

配置代理可解决跨域问题, 需要服务端配置跨域.

``` {.javascript}
// config/index.js
proxyTable: {
  '/api': {
      target: 'http://stage.xxxx.com',
      changeOrigin: true,
      pathRewrite: {
      '^/api': '/api'
      }
  }
}
```
