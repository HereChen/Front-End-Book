# 垂直居中和水平居中

## flex 水平垂直居中

```css
{
  display: flex;
  align-items: center;
  justify-content: center;
}
```

## 块元素垂直居中：transform

此方案存在兼容性问题（Firefox 43 不支持, Chrome 46 支持）。另外，Chrome 应用 `transform` 出现字体模糊，建议使用 `flex`。

```css
{
  width: 250px;
  height: 250px;
  position: relative;
  top: 50%;
  transform: translateY(-50%);
}
```

## 块元素垂直居中：绝对定位

```css
{
  width: 250px;
  height: 250px;
  position: absolute;
  top: 50%;
  margin-top: -125px;
}
```

## 内联元素垂直居中

```css
{
  /* 方案一: 块元素内容会居中, 需要设置高度 */
  display: table-cell;
  vertical-align: middle;

  /* 方案二: 一般单行文本的上下居中 */
  line-height: 50px;
}
```

## 块元素的水平居中

```css
{
  width: 100px;
  margin-left: auto;
  margin-right: auto;
}
```
