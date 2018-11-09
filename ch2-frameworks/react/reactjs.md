# React

```bash
npm install -g create-react-app
create-react-app my-app
```

[React](https://reactjs.org/) 与 Vue 类似，主要专注于视图层，结合其他的库实现扩展，比如路由、数据状态维护等。

## 常用依赖

1. 路由: [React Router](https://github.com/ReactTraining/react-router)
2. 类型检查: [prop-types](https://github.com/facebook/prop-types)
3. 数据管理: [React Redux](https://github.com/reactjs/react-redux)

### UI

- [element-react](https://eleme.github.io/element-react/)
- [ant-design](https://ant.design/)

### 优化

- [reselector](https://github.com/reactjs/reselect)
- [immutable.js](https://github.com/facebook/immutable-js)
- [seamless-immutable.js](https://github.com/rtfeldman/seamless-immutable)

## 文件组织

## React 与 Redux

引入 Redux 用于应用状态维护，为了方便与 React 结合，因此会同时引入 React Redux。用户在视图层（React）操作，触发事件（action），事件触发 reducer，在 reducer 中决定如何返回新的状态，状态的更新触发视图的更新。从而实现了单向的数据流。

reducer 和 action 分文件夹放置，reducer 通过 combineReducers 合并，然后再通过 createStore 创建 store。store 通过 Provider 放置在 App 的顶层元素，并分发给所有子组件。对每个具体的功能，分别按需引入需要的 state （reducer 中定义）和 action，并用 connect 将此两项和视图层（react 实现）连接起来，实现完整的组件。由此，实现了数据、视图、事件之间的分离，通过 connect 实现连接。

reducer 是什么呢？reducer 按照 Redux 的输入书写。每次输入确定的数据，通过 reducer 处理，能够得到固定的输出。也就是说 reducer 中不包含随机因素或者环境因素，因此称之为纯函数。

## create-react-app 工程构建

需求：

1. 不暴露 create-react-app 配置项（并支持 Sass、支持热加载）
2. 区分环境变量

### 不暴露 create-react-app 配置项

create-react-app 2.0 无需配置即可支持 Sass, Sass 支持需安装 `node-sass` 和 `sass-loader`。

```javascript
// config-overrides.js
const { injectBabelPlugin, getLoader } = require('react-app-rewired');
const rewireReactHotLoader = require('react-app-rewire-hot-loader');

module.exports = function override(config, env) {
  // do stuff with the webpack config...
  config = injectBabelPlugin(['import', { libraryName: 'antd-mobile', style: 'css' }], config);
  config = rewireReactHotLoader(config, env);
  return config;
};
```

1. 覆盖配置：<https://mobile.ant.design/docs/react/use-with-create-react-app-cn>
2. 热加载：[react-app-rewire-hot-loader](https://github.com/cdharris/react-app-rewire-hot-loader)
3. Sass: [antd-mobile-samples](https://github.com/ant-design/antd-mobile-samples/blob/master/create-react-app/config-overrides.js)

### 环境变量

配置变量以 `REACT_APP_` 开头，例如 `REACT_APP_ENVIRONMENT=PRODUCTION`。

```bash
# 默认配置
.env

# 开发配置
.env.development

# 生产配置
.env.production
```

1. 环境变量配置：[Adding Development Environment Variables In .env](https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#adding-development-environment-variables-in-env)

## 性能优化

### 文件大小分析

通过对打包的文件大小的分析, 针对性的做优化, 比如用 CDN 资源替换部分第三方的库.

```javascript
// ./config-overrides.js
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;

const injectBundleAnalyzerPlugin = (config) => {
  config.plugins.push(
    new BundleAnalyzerPlugin()
  )
  return config;
}

module.exports = function override(config, env) {
  // do stuff with the webpack config...
  // ...
  if (process.env.REACT_APP_ENVIRONMENT === 'production') {
    config = injectBundleAnalyzerPlugin(config);
  }
  // ...
  return config;
};
```

### 生产环境下 CDN 替换

通过 CDN 替换可以减小打包的大小, 同时提高资源的访问速度.

```html
<!-- ./public/index.html -->
<% if (process.env.REACT_APP_ENVIRONMENT === 'production') { %>
  <script crossorigin src="https://cdn.jsdelivr.net/npm/react@16.6.1/umd/react.production.min.js"></script>
  <script crossorigin src="https://cdn.jsdelivr.net/npm/react-dom@16.6.1/umd/react-dom.production.min.js"></script>
<% } %>
```

```javascript
// ./config-overrides.js
const externalLibrarys = (config) => {
  config.externals = {
    "react": "React",
    "react-dom": "ReactDOM"
  };
  return config;
}

module.exports = function override(config, env) {
  // do stuff with the webpack config...
  // ...
  if (process.env.REACT_APP_ENVIRONMENT === 'production') {
    config = externalLibrarys(config);
    config = injectBundleAnalyzerPlugin(config);
  }
  return config;
};
```

## 扩展

1. 关于 actionTypes, actions, reducer 文件分割的提议:[GitHub, erikras/ducks-modular-redux](https://github.com/erikras/ducks-modular-redux)
2. React 生命周期及方法图:[wojtekmaj/react-lifecycle-methods-diagram](https://github.com/wojtekmaj/react-lifecycle-methods-diagram)
