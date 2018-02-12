# Vue.js

## Tips

### ES6

以下几个 ES6 功能应用于 Vue.js 将获得不错的收益[^vueES6], 特别是对于无需构建工具的情况.

1. 箭头函数: 让 this 始终指向到 Vue 实例上.
2. 模板字符串: 应用于 Vue 行内模板, 可以方便换行, 无需用加号链接. 也可以应用于变量套入到字符串中.

    ```javascript
    Vue.component({
      template: `<div>
                  <h1></h1>
                  <p></p>
                </div>`
      data: {
        time: `time: ${Date.now()}`
      }
    });
    ```

3. 模块(Modules): 应用于声明式的组件 `Vue.component`, 甚至不需要 webpack 的支持.

    ```javascript
    import component1 from './component1.js';
    Vue.component('component1', component1);
    ```

4. 解构赋值: 可应用于只获取需要的值, 减少不必要的赋值, 比如只获取 Vuex 中的 commit 而不需要 store.

    ```javascript
    actions: {
      increment ({ commit }) {
        commit(...);
      }
    }
    ```

5. 扩展运算符: 数组和对象等批量导出, 而不需要用循环语句. 比如, 将路由根据功能划分为多个文件, 再用扩展展运算符在 index 中合在一起.

[^vueES6]: [ANTHONY GORE, 4 Essential ES2015 Features For Vue.js Development, 2018-01-22](https://vuejsdevelopers.com/2018/01/22/vue-js-javascript-es6/)

### 组件重新渲染

通过设置 `v-if` 实现, 从 Dom 中剔除再加入.

```html
<demo-component v-if="ifShow"></demo-component>
```

### 绑定数据后添加属性视图未重新渲染

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

### 全局引入 SCSS 变量文件[^vueGlobalImportVariablesFile]

场景: 将常用的变量存储到 `vars.scss`, 应用变量时需要在每个需要的地方 `import`.

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

[^vueGlobalImportVariablesFile]: <https://www.reddit.com/r/vuejs/comments/7o663j/sassscss_in_vue_where_to_store_variables/?st=JC9T45PB&sh=4f87ec9d>

## Compatible

### IE `vuex requires a promise polyfill in this browser`

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
