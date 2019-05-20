# npm

## 命令

```bash
# 以下相邻的两条命令作用一样

# 安装依赖到 dependencies （通常是业务依赖）
npm i module_name -S
npm install module_name --save

# 安装依赖到 devDependencies （通常是开发工具类的依赖）
npm i module_name -D
npm install module_name --save-dev

# 安装全局包（比如 vue-cli，creare-react-app）
npm i module_name -g
npm install module_name --global
```

## .npmrc

> npm gets its config settings from the command line, environment variables, and npmrc files. [npmrc](https://docs.npmjs.com/files/npmrc)

具体的可配置条目参考 [npm-config](https://docs.npmjs.com/misc/config).

**配置镜像**

```bash
# 工程里面配置淘宝镜像
touch .npmrc

# .npmrc 文件内添加
# registry = https://registry.npm.taobao.org
# # 或者 registry = https://registry.npm.org
```
