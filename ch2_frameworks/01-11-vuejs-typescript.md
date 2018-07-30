## Vue.js TypeScript

本节内容基于 @vue/cli v3.0.0-rc.4 完成。

### 项目创建

```bash
npm i -g @vue/cli
vue create typescript-demo
# 自定义配置
# babel, Router, Vuex, TypeScript, TSLint

# 本地启动
npm run serve
```

[TypeScript-Vue-Starter](https://github.com/Microsoft/TypeScript-Vue-Starter) 也提供了一个模版工程，比较基础，实际应用过程都会有遇到很多其他问题。

### 实例对应写法

```javascript
<script lang="ts">
import { Vue, Component Prop} from 'vue-property-decorator';
import Hello from '@/components/Hello.vue';

@Component({
  components: {
    'com-hello': Hello,
  }
})
export default class Demo extends Vue {
  // props
  @Prop() inVar1!: string;

  // data
  private var1!: string;
  private var2: string = 'var2';
  private var3!: boolean;
  private var4!: number[];

  // created
  private created(): void {
    // excute something
  }

  // mounted
  private mounted(): void {
    // excute something
  }

  // computed
  get somthing(): string {
    return this.var2;
  }

  // methods
  private func1(): void {
    // excute something
  }
}
</script>
```

### Vuex 定义

Vuex 的使用思路：

1. 不同功能放到不同的模块，并开启命名空间。
2. 所有的操作和命名空间名称作为变量存储在一个 types 的文件中。
3. 每一个模块都包含一个 clear 的清除操作，并在根模块下加一个清除操作，可以清楚所有的模块状态。

模块定义：

```typescript
// store/modules/moduleA.ts
import { Commit, Dispatch } from 'vuex';
import * as TYPES from '@/store/types';

// state 类型定义
interface State {
  var1: string;
}

// state
const initState: State = {
  var1: '',
}

// getters
const getters = {};

// mutations
const mutations = {
  [TYPES.SET_VAR1](state: State, payload: string) {
    state.var1 = payload;
  },

  [TYPES.MODULEA_CLEAR](state: State) {
    state.var1 = '';
  }
}

const actions = {
  [TYPES.SET_VAR1](context: {commit: Commit, dispatch: Dispatch}, var1: string) {
    context.commit(TYPES.SET_VAR1, var1);
  },

  [TYPES.MODULEA_CLEAR](context: {commit: Commit, dispatch: Dispatch}) {
    context.commit(TYPES.MODULEA_CLEAR);
  },
}

export {
  State,
}

export default {
  namespace: true,
  state: initState,
  getters,
  actions,
  mutations,
}
```

根模块定义：

```typescript
// store/index.ts
import Vue from 'vue';
import Vuex, { Dispatch, Store } from 'vuex';

import moduleA, { State as moduleAState } from '@/store/modules/moduleA';

Vue.use(Vuex);

// 根模块定义所有状态类型
interface RootState {
  [TYPES.NAMESPACE_MODULEA]: moduleAState,
}

const actions = {
  clear(context: {dispatch: Dispatch}) {
    context.dispatch(`${TYPES.NAMESPACE_MODULEA}/${TYPES.MODULEA_CLEAR}`, {}, { root: true });
  }
}

const store: Store<RootState> = new Vuex.Store({
  moudles: {
    [TYPES.NAMESPACE_MODULEA]: moduleA,
  }
  actions,
});

export default store;
```

## Vuex 调用

```typescript
<script lang="ts">
import { Vue, Component Prop} from 'vue-property-decorator';
import { Action, State } from 'vuex-class'

@Component
export default class Demo extends Vue {
  // state 映射
  @State('这里是state名', {namespace: '这里是命名空间名称'}) private stateIsLogin!: boolean;
  // action 映射
  @Action('这里是action名称', {namespace: '这里是命名空间名称'}) private actionLogin!: () => Promise<any>;
}
</script>
```

### 什么时候应用 class

有一些工具，需要单独封装，如果这个工具是一个工具集合，并且内部存在一些逻辑依赖，可采用 class 书写。比如，同一个项目的请求配置通常是一样的，这个时候可以将 axios 封装成 class，内部设置默认的配置，并提供可外部配置的方式。axios 的拦截、请求都依赖同一套配置，通过 class 可在构造器输入配置，屏蔽内部复杂性，并实现可配置。反之，类似接口层，各个 api 之间并无关联，则无需采用 class。
