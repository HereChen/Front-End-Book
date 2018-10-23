# Vue.js

[Vue.js](https://github.com/vuejs/vue) 开发简单直观, 简单实用的东西通常寿命会比较长.

## 周边配套

1. 开发小程序: [Meituan-Dianping/mpvue](https://github.com/Meituan-Dianping/mpvue)
2. 开发原生APP: [weex](https://weex.apache.org/)

## Tips

### 本地服务通过 IP 无法访问

1. 方案1，更改 package.json 中的命令：`webpack-dev-server --port 3000 --hot --host 0.0.0.0`。
2. 方案2，更改 `config/index.js` 中 `host: 'localhost'` 为 `host: '0.0.0.0'`。

### 动态组件加载

场景：根须不同的条件加载不同的组件，效果类似 React 中，根据条件 Return 不同的视图。

```html
<component :is='ComponentName'></component>

<!-- 组件需要传参的场景 -->
<component :is='ComponentName' :yourPropName="binddingIt"></component>
```

如果需要异步加载组件，则采用

```javascript
data () {
  return {
    // 无法异步加载
    // ComponentName: MyComponent,
    ComponentName: () => import('@/components/dynamic/MyComponent')
  }
}
```

参考[vuejs-dynamic-async-components-demo](https://github.com/lobo-tuerto/vuejs-dynamic-async-components-demo)

### 组件内事件添加额外的参数

封装的组件提供的事件已经有返回的数据，需要添加额外的参数作预处理。

```javascript
// myComponent 组件内定义的事件
this.$emit('on-change', val);
```

```html
<!-- 使用组件，关键在于添加 $event -->
<myComponent @on-change="myChangeEvent($event, myParams)" />
```

```javascript
// 第一个参数为 myComponent 组件内的返回数据，第二个参数为自定义参数
myChangeEvent(val, myParams) {

}
```

### watch 对象变化

```javascript
watch: {
  form: {
    handler(val) {
      this.$emit('data-change', val);
    },
    // here
    deep: true,
  },
},
```

### extend 实现 JS 调用的组件封装

```javascript
// MyComponent/index.js
import Vue from 'vue';
// MyComponent/main.vue 用一般的组件写法编写
import mainVue from './main';
const ConfirmBoxConstructor = Vue.extend(mainVue);
const MyComponent = (options) => {
  const instance = new ConfirmBoxConstructor({
    el: document.createElement('div'),
    // 参数将赋值到 main.vue 中的 data 中，实现配置
    data: options,
  });

  document.body.appendChild(instance.$el);
};

MyComponent.myMethod = () => {
  // define here
}

export default MyComponent;
```

调用组件

```javascript
import MyComponent from 'MyComponent'
export default {
  mounted() {
    const options = {
      // custom here
    };
    MyComponent(options);
    // 方法调用
    // MyComponent.myMethod();
  }
}
```

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
