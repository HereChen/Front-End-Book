# puppeteer

> [GoogleChrome/puppeteer](https://github.com/GoogleChrome/puppeteer/)

## demo: 下载网页上的图片

依赖 nodejs v10 or later.

```bash
# 安装 cnpm 是为了下载 Chromium
npm install -g cnpm
npm init
cnpm i puppeteer
cnpm install chalk
cnpm install filenamify

node --experimental-modules app.mjs
```

```javascript
// app.mjs
import puppeteer from "puppeteer";
import devices from 'puppeteer/DeviceDescriptors';
import fs from "fs";
import chalk from 'chalk';
import url from "url";
import filenamify from "filenamify";

const URL = url.URL;
const log = console.log;

const config = {
  // 网站地址
  website: "http://news.163.com/special/fdh5_sleeping/",
  // 设置为 false 可以通过手动点击, 下载需要交互后才会出现的图片
  headless: false,
  // 是否是移动端
  isMobile: true,
}

/**
 * 启动浏览器, 进行基本的配置
 * @param {object} param 配置参数
 * @param {function} callback 要处理的业务
 */
const launchChrome = async ({
  website = "https://www.baidu.com",
  headless = true,
  isMobile = false
}, callback = () => {}) => {
  // 打开浏览器
  const browser = await puppeteer.launch({
    headless
  });

  // 打开页面
  const page = await browser.newPage();

  if (isMobile) {
    // 模拟移动端设备
    const iPhoneX = devices['iPhone X'];
    await page.emulate(iPhoneX);
  }

  callback(page);

  await page.goto(website);
  await page.screenshot({
    path: "website.png"
  });

  if (headless) {
    await browser.close();
  }
};


launchChrome(config, (page) => {
  const folder = config.folder || filenamify(new URL(config.website).hostname);

  // 如果放图片的文件夹不存在
  if (!fs.existsSync(folder)) {
    fs.mkdirSync(folder);
  }

  // 处理
  page.on("response", async resp => {
    const type = resp.headers()["content-type"];
    const request = await resp.request();
    const url = new URL(request.url());

    try {
      if (type.indexOf("image") > -1) {
        // 下载文件
        const buffer = await resp.buffer();
        const saveFileName = `${folder}/${filenamify(`${url.origin}${url.pathname}`)}`;
        fs.writeFileSync(saveFileName, buffer);
        log(`${chalk.green('success')}: ${url}, ${saveFileName}`);
      }
    } catch (e) {
      log(`${chalk.red('error')}: ${url.href}`);
      log(chalk.red(e));
    }
  });
});
```

## 应用截图 diff

> [Automatic visual diffing with Puppeteer, Monica Dinculescu, 2018, meowni.ca](https://meowni.ca/posts/2017-puppeteer-tests/)

用于检查不同屏幕尺寸下是否展示一致。分两个大步骤:

1. 获取截图: 用 Puppeteer 获取屏幕尺寸下、不同路由的屏幕截图.
2. diff 图片: 用 [mapbox/pixelmatch](https://github.com/mapbox/pixelmatch#nodejs) 将宽屏和窄屏下截图和标准尺寸的截图 diff.
