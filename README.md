# Front End Book

以前端面试及复习为基础, 将博客内容直接整理成 LaTeX 文档.

## 内容

以找工作为出发点，以对知识的系统了解为目的，整理了关于 Web 前端的相关内容：HTML、CSS、JavaScript、HTTP、兼容性解决方案、Web 性能优化、工具、框架、资源。挑选其中的一些典型的和重要的描述。

## 写作

以[博客](http://herechen.github.io)为根据，主要是整理和编写的工作。编辑上，用 pandoc 从 markdown 转成 tex 文件，目前有诸多问题没解决：

- 工作流程的自动化（直接从博客目录生成 tex）
- book 模板的改善
- 代码样式（jekyll 标签的替换和 latex 样式）
- `kramdown -o latex some.markdown >some.tex` 直接转 tex 文件未成功（OK, 不使用 git，换用 cmd）

## 问题

- 段落换行, 表格换行
- 部分段落缩进有问题