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

## 扩展

1. 关于 actionTypes, actions, reducer 文件分割的提议:[GitHub, erikras/ducks-modular-redux](https://github.com/erikras/ducks-modular-redux)
2. React 生命周期及方法图:[wojtekmaj/react-lifecycle-methods-diagram](https://github.com/wojtekmaj/react-lifecycle-methods-diagram)
