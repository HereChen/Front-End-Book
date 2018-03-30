# HTML

## 参数(input)在 form 之外

input 在 form 之外时, 在 input 元素内添加 form 属性值为 form 的 ID[^HtmlFieldsOusideForm]. 这样 input 仍然可以看做隶属于此表单, jQuery `$('#formid').serialize();` 能够获取 form 之外的输入框值. 或者在提交 (`submit`) 表单时会同样提交 `outside` 这个值.

```html
<form id="formid" method="get">

    <label>Name:</label>
    <input type="text" id="name" name="name">

    <label>Email:</label>
    <input type="email" id="email" name="email">
    <input type="submit" form="contact_form" value="send form" />
</form>
<input type="text" name="outside" form="formid">
```

注意: IE8 `$('#formid').serialize();` 无法获取 `outside` 值.

[^HtmlFieldsOusideForm]: [PLACING FORM FIELDS OUTSIDE THE FORM TAG](http://www.dreamdealer.nl/articles/form_fields_outside_a_form.html)
