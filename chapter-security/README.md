# Security

1. [OWASP Top 10 Application Security Risks - 2017](https://www.owasp.org/index.php/Top_10-2017_Top_10)
2. [OWASP/CheatSheetSeries](https://github.com/OWASP/CheatSheetSeries)
3. [appsecco/dvna](https://github.com/appsecco/dvna)

    > Damn Vulnerable NodeJS Application (DVNA) is a simple NodeJS application to demonstrate OWASP Top 10 Vulnerabilities and guide on fixing and avoiding these vulnerabilities.

## Unrestricted File Upload (文件上传漏洞)

文件上传漏洞是指用户上传可执行的文件到服务器, 并获取服务器权限 (webshell). 比如: 微软的 Word/Excel/Powerpoint 可通过 VBA Macro 和 OLE package 嵌入病毒; Adobe PDF 可以通过附件嵌入病毒; 图片文件可以将可执行文件伪装成图片.

**解决方法** 前端只能通过文件类型 (`File.type`) 初步限制, 限制不合法的文件类型上传. 实际解决需要在服务端判断文件是否包含病毒, 或者将上传的文件夹设置为不可执行.

* <https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Protect_FileUpload_Against_Malicious_File.md>
* <https://www.owasp.org/index.php/Unrestricted_File_Upload>
