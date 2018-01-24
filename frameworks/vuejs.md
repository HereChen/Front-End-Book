# Vue.js

## Tips

### 组件重新渲染

通过设置 `v-if` 实现, 从 Dom 中剔除再加入.

```html
<demo-component v-if="ifShow"></demo-component>
```

### `v-for` 数值更改界面无刷新

如果存在异步请求, 在数据上添加属性的情况, 需要先预处理好获取的数据, 然后在将其赋值到 data 中变量. 数据绑定后, 再添加属性, 不会触发界面渲染.

```javascript
API.getSomething().then(res => {
  // 1. 先添加属性
  // handle 表示对数据的处理, 包括对象中属性的添加
  const handledRes = handle(res);
  // 2. 然后绑定到 data 中的变量
  this.varInDate = handledRes;
});
```

### 全局引入 SCSS 变量文件

> [SASS/SCSS in Vue: where to store variables?](https://www.reddit.com/r/vuejs/comments/7o663j/sassscss_in_vue_where_to_store_variables/?st=JC9T45PB&sh=4f87ec9d]

场景: 将常用的变量存储到 `vars.scss`, 应用变量时需要在每个需要的地方 `import`.

**参考解决方案**

1. `npm install sass-resources-loader --save-dev`
2. 更改 `build/webpack.base.conf.js`, 适用于 vue-cli.

```json
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

## Compatible

**IE `vuex requires a promise polyfill in this browser`**

```bash
npm install --save-dev babel-polyfill
```

```javascript
// build/webpack.base.conf.js
entry: {
  app: [
    'babel-polyfill',
    './src/main.js'
  ]
}
```

[vuex requires a promise polyfill in this browser](https://github.com/vuejs-templates/webpack/issues/474)
