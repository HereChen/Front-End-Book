# Front End Book

以前端面试及复习为基础, 将博客内容直接整理成 LaTeX 文档. 执行下面的命令编译博客内容:

	node run_jekyllpostparse.js
	xelatex main.tex
	xelatex main.tex

Windows 下在 CMD 中执行 nodejs.

## 内容

以找工作为出发点，以对知识的系统了解为目的，整理了关于 Web 前端的相关内容：HTML、CSS、JavaScript、HTTP、兼容性解决方案、Web 性能优化、工具、框架、资源。挑选其中的一些典型的和重要的描述. 文档内容在以[博客](http://herechen.github.io)中有.

## 文档生成方案

- Jekyll 博客转 TeX 文档:
	- 从博客头信息中解析标题, 格式化高亮代码: 采用 nodejs
	- md 文档转 TeX 文档: `kramdown -o latex some.markdown >some.tex` (在 Windows 中执行, Git 中执行无效), 命令用 nodejs 调用
- TeX 文档用 xelatex 编译为 PDF, 由于 nodejs 暂时无法看到编译错误信息, 因此不采用 nodejs 调用 xelatex 的方式编译

## 问题

- 段落换行, 表格换行
- 部分段落缩进有问题
- 后期改进可查询是否能够通过 nodejs 调用本地命令, 并且显示命令调用后的信息, 从而可以完全用 nodejs 执行所有命令.