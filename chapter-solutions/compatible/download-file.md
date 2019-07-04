# 文件下载

1. 场景: 当文件链接不是实际地址, 而是接口, 下载文件的时候需要通过编程触发.
2. 基本思路: 触发下载的基本思路是创建一个 `a` 标签, 将文件接口或文件数据附上去, 然后触发点击事件.
3. 问题: 将文件接口附到 `href` 属性上, 这种方式在 Firefox 上不兼容, 会直接打开接口地址, 但不会下载.

具体解决逻辑如下.

```javascript
// [How to open a pdf downloaded from an API with JavaScript](https://blog.jayway.com/2017/07/13/open-pdf-downloaded-api-javascript/)
function downloadFile (fileUrl, fileName) {
  fetch(fileUrl).then(function(res) {
    return res.blob();
  }).then(function(fileBlob) {
    METHODS.downloadBlob(fileBlob, fileName);
  });
}

/**
  * blob流下载
  * @param blob 文件
  * fileName 文件名
  */
function downloadBlob (blob, fileName) {
  var newBlob = new Blob([blob]);

  // for IE
  if (window.navigator.msSaveOrOpenBlob) {
    navigator.msSaveBlob(newBlob, fileName);
  } else {
    const data = window.URL.createObjectURL(newBlob);

    const link = document.createElement('a');
    link.href = data;
    link.download = fileName;
    document.body.appendChild(link);    // for firefox
    link.click();
    // delay for firefox
    setTimeout(function() {
      document.body.removeChild(link);  // for firefox
      window.URL.revokeObjectURL(data);
    }, 100);
  }
}
```
