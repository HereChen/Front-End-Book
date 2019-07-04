# 代码质量

## React

```bash
npm i --save-dev husky lint-staged eslint-plugin-prettier prettier
```

**`.eslintrc`**

```json
{
  "extends": "react-app",
  "plugins": ["prettier"],
  "rules": {
    "prettier/prettier": "error"
  }
}
```

**`package.json`**

```json
{
  ...
  "husky": {
    "hooks": {
      "pre-commit": "lint-staged"
    }
  },
  "lint-staged": {
    "src/**/*.{js,jsx,ts,tsx,json,css,scss}": [
      "prettier --write",
      "git add"
    ]
  }
  ...
}
```
