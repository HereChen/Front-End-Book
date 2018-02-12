# Vue-CLI

1. GitHub: <https://github.com/vuejs/vue-cli>

## 代理

配置代理可解决跨域问题, 需要服务端配置跨域.

```javascript
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
