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

reducer 和 action 分文件夹放置，reducer 通过 combineReducers 合并，然后再通过 createStore 创建 store。store 通过 Provider 放置在 App 的顶层元素，并分发给所有子组件。对每个具体的功能，分别按需引入需要的 state （reducer 中定义）和 action，并用 connect 将此两项和视图层（react 实现）连接起来，实现完整的组件。由此，实现了数据、视图、事件之间的分离，通过 connect 实现连接。

## 扩展

1. [GitHub, erikras/ducks-modular-redux](https://github.com/erikras/ducks-modular-redux)
