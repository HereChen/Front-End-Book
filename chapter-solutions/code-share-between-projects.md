# 工程间代码复用

注意，这里描述的是“工程间”，而不是“项目间”。因为不同项目的工程一般不在一个代码仓库中，而同一个项目的工程可以在同一个仓库，也可以是多个仓库。

## 跨工程代码复用

如果是同一类型或采用相同打包工具的应用，可以放到同一个工程中，从而可以直接复用代码。比如下面的文件夹结构，如果是 Webpack 工程，可以配置为根据文件夹路径分别打包 3 个应用（即在打包命令中入口参数，根据参数打包），并复用 `api` 和 `util`。

```bash
.
└── src
    ├── app1  # 应用1
    ├── app2  # 应用2
    ├── app3  # 应用2
    ├── api   # 复用
    └── util  # 复用
```

如果不在一个工程中，即便抽离出来，文件夹内也无法访问文件夹外抽离出来的公共依赖。这种情况可以采用如下方式复用代码。

* 手动复制代码。
* 将公用部分挂载到全局变量中，如果是 Web 应用可以在使用依赖前将依赖挂载到 `window` 上。
* 在当前工程添加依赖的 [Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)，此种方法的前提是 [Multi-Repo]，即依赖在另外一个 git 仓库。相当于在当前工程建立一个连接指向依赖仓库，在需要的时候手动将依赖仓库里面的代码更新下来。
* 添加到依赖中（`package.json`），分为两种情况：依赖在本地、依赖在服务器上。**依赖在本地**，比较简单的方法是利用 [`npm link`](https://docs.npmjs.com/cli/link) 实现此方式，这种手动建连接的方法在工程变得庞大后会显得复杂。更为完整的方案是采用 [yarn workspaces](https://yarnpkg.com/lang/en/docs/workspaces/) 和 [lerna](https://lerna.js.org) 对多个工程进行管理，从而实现工程间的本地代码复用。**依赖在服务器上**，比如直接上传到 <npmjs.com>，或者自建自由依赖仓库。

## 场景

一个应用有 Web 端和 Native 客户端，因为业务一样，因此有相同的业务逻辑、对接相同的后端接口、常用的工具也一样。于是，可以考虑将公共的部分抽离出来复用代码。

```bash
.
├── app-web        # webpack
├── app-native     # react native
├── business-core  # 共用业务逻辑
├── api            # 接口
└── util           # 工具
```

## 方案：Monorepo 与 lerna

此方案适合不想自建私有的依赖仓库，并且希望跨工程复用代码。

* [Monorepo](https://en.wikipedia.org/wiki/Monorepo) 是指把多个工程的代码放到同一个代码仓库中。
* lerna 和 yarn workspaces 既可单独使用，也可以结合使用，前者提供了更多依赖管理功能，后者更多的是提供本地的多工程管理能力。

**步骤** 针对上面的场景，具体步骤如下。

```bash
# 1. 安装 lerna
npm i -g lerna

# 2. 初始化 lerna 工程
mkdir lerna-repo && cd $_
lerna init

# 3. 创建工程和公共依赖
lerna create -y app-web              # 应用，依赖 @demo/*
lerna create -y app-native           # 应用，依赖 @demo/*
lerna create -y @demo/business-core  # 依赖，依赖 @demo/api 和 @demo/util
lerna create -y @demo/api            # 依赖
lerna create -y @demo/util           # 依赖

# 4. 添加依赖
lerna add --scope=app-web @demo/business-core
lerna add --scope=app-web @demo/api
lerna add --scope=app-web @demo/util

lerna add --scope=app-native @demo/business-core
lerna add --scope=app-native @demo/api
lerna add --scope=app-native @demo/util

lerna add --scope=@demo/business-core @demo/api
lerna add --scope=@demo/business-core @demo/util

# 共用的工具依赖，以 eslint，husky 作为示例。安装到根目录，实现依赖和配置复用。
npm i eslint -D --registry https://registry.npm.taobao.org
npm i husky -D --registry https://registry.npm.taobao.org

# TODO: 依赖版本更新, 如何全部自动更新
# 重新拉库后安装依赖：lerna bootstrap
```

工程实例 [vuejs/vue-cli](https://github.com/vuejs/vue-cli)、[babel/babel](https://github.com/babel/babel)、[ScottLogic/StockFlux](https://github.com/ScottLogic/StockFlux)、[wowlusitong/mono-stater-kit](https://github.com/wowlusitong/mono-stater-kit)。

## 阅读

* [2019-03-18, Sebastian Weber, Why Lerna and Yarn Workspaces is a Perfect Match for Building Mono-Repos](https://doppelmutzi.github.io/monorepo-lerna-yarn-workspaces/)
