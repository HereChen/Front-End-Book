exports.jekyllpostparse = function(infile, outfile){
// 两个参数：输入文件，输出文件
// 一个参数：文件路径

    String.prototype.replacetitle = replacetitle;
    String.prototype.replacehlt = replacehlt;

    var fs = require("fs");
    fs.readFile(infile, 'utf-8', function(err,data){  
        if(err){  
            console.log("error");  
        }else{ 
            var handle_data = data;
            handle_data = handle_data.replacetitle().replacehlt();
            fs.writeFile(outfile, handle_data);
            console.log("Finished.");
        }
    });
}

function replacetitle(){
/* replacetitle: parse header
input: 
---
date: 2015-10-17 17:37:10 PM
title: 前端系列之 JavaScript
categories: technology
---
234

output:
# 前端系列之 JavaScript

234
*/
    var arr, len, i, result;
    var sp = {
        line: "---", 
        title: "title:"
    };
    arr = this.toString().split(sp.line);
    len = arr.length;
    result = [];

    if ( len != 1 ){
        if ( arr[1].indexOf(sp.title) !== -1 ){
            result[0] = "#" + arr[1].split(sp.title)[1].split("\n")[0];
        } else{
            console.warn("no title in file");
            return arr; // no title
        }
        for (i = 1; i < len-1; i++){
            result[i] = arr[i+1];
        }
    }

    return result.join('\n');
}

function replacehlt(){
/* replace highlight tag with space for code block
1. convert jekyll code block to markdown
2. delete highlight tag, and add four blank spaces to code.

input:
{% highlight javascript %}
typeof foo == 'undefined'
{% endhighlight %}

output:
    typeof foo == 'undefined'
*/

    var filter = {
            start: "{% highlight",
            end: "{% endhighlight"
        };
    var flag = 0;
    var addcontent = "    ";

    // add four blank spaces, delete highlight tag
    var arr, line, i, len, result;
    arr = this.toString().split('\n').slice(0);
    len = arr.length;
    result = [];
    for (i = 0; i < len; i++){
        line = arr[i];
        if ( line.indexOf(filter.start) !== -1 ){
            flag = 1;
            line = ''; // delete
        }
        else if( line.indexOf(filter.end) !== -1 ){
            flag = 0;
            line = ''; // delete
        }
        else{
            if ( flag === 1 ){
                line = addcontent + line; // add 
            }
            result.push(line);
        }
    }
    
    return result.join('\n');
}