## 优先级

优先级**从高到低**，分三个层次描述。

1. 作者/用户/浏览器样式。作者样式指网页本身的样式，或者开发者编写的样式；用户样式指浏览网页的用户自己添加的样式表(通过浏览器设置)；浏览器样式指浏览器提供的默认样式。
    1. 标有 `!important` 的用户样式。
    2. 标有 `!important` 的作者样式。
    3. 作者样式。
    4. 用户样式。
    5. 浏览器样式。

2. 作者样式：内部样式（internal）、内联样式（inline）、外部样式（external）。内部样式 style 标签中声明的样式；内联样式指元素属性 style 中的样式；外部样式指通过 link 链接的外部文件中样式。
    1. 内联样式（行内样式）
    2. 内部样式
    3. 外部样式

    外部样式和内部样式在优先级相同的情况下，后定义的会覆盖先定义的。

3. CSS 选择器
    1. ID 选择器：`#idname`
    2. 伪类：`:hover`
    3. 属性选择器：`input[type="text"]`
    4. 类选择器：`.classname`
    5. 元素(类型)选择器（包括伪元素）：`input`, `:after`
    6. 通用选择器：`*`

reference: [Cameron Moll, 精通CSS（第2版）](http://book.douban.com/subject/4736167/)，[优先级, mdn](https://developer.mozilla.org/zh-CN/docs/Web/CSS/Specificity), [INLINE VS INTERNAL VS EXTERNAL CSS](https://vineetgupta22.wordpress.com/2011/07/09/inline-vs-internal-vs-external-css/)
