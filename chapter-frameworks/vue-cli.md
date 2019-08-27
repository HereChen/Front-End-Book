# Vue-CLI

> <https://github.com/vuejs/vue-cli>

```bash
npm install -g @vue/cli
```

## 代理

配置代理可解决跨域问题, 需要服务端配置跨域.

```javascript
// vue.config.js
module.exports = {
  devServer: {
    proxy: {
      '^/api': {
        target: 'http://stage.xxxx.com',
        changeOrigin: true,
        pathRewrite: {
        '^/api': '/api'
        }
      }
    }
  }
}
```

## 全局引入 SCSS 变量文件[^vueGlobalImportVariablesFile]

### 问题

将常用的变量存储到 `vars.scss`, 应用变量时需要在每个需要的地方 `import`, 比较麻烦.

### 方法1: sass-resources-loader

1. `npm install sass-resources-loader --save-dev`
2. 更改 `build/webpack.base.conf.js`, 适用于 vue-cli.

```javascript
{
    test: /\.vue$/,
    loader: 'vue-loader',
    options: {
        loaders: {
            sass: ['vue-style-loader', 'css-loader', {
                loader: 'sass-loader',
                options: {
                    indentedSyntax: true
                }
            }, {
                loader: 'sass-resources-loader',
                options: {
                    resources: path.resolve(__dirname, "./styles/vars.scss")
                }
            }],
            scss: ['vue-style-loader', 'css-loader', 'sass-loader', {
                loader: 'sass-resources-loader',
                options: {
                    resources: path.resolve(__dirname, "./styles/vars.scss")
                }
            }]
        }
        // other vue-loader options go here
    }
}
```

[^vueGlobalImportVariablesFile]: <https://www.reddit.com/r/vuejs/comments/7o663j/sassscss_in_vue_where_to_store_variables/?st=JC9T45PB&sh=4f87ec9d>

### 方法2: vue-cli 3

```javascript
// https://cli.vuejs.org/guide/css.html#passing-options-to-pre-processor-loaders
// vue.config.js
module.exports = {
  css: {
    loaderOptions: {
      sass: {
        data: `@import "@/variables.scss";`
      }
    }
  }
}
```
