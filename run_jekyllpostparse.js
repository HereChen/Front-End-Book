const jk = require('./jekyll-post-parse/jekyllpostparse').jekyllpostparse;
const exec = require('child_process').exec;
const fs = require('fs');
const path = require('path');

// notes
// kramdown -o latex some.markdown >some.tex
// xelatex *.tex
// sh compile.sh

var post_folder_in;		// 博客文件所在文件夹
var post_extension;		// 博客文件扩展名

var post_files; 		// 博客 markdown 文件
var post_tex_list = [];	// 文档转换后的 tex 文件(包含相对令)
var post_folder_out;	// 博客文件格式化后输出文件夹
var post_folder_tex;	// 转换为 tex 后文件所在目录
var chapter_include_str;// 所有章节合成的字符串
var chapters_file;

function GetPostMarkdownFileList(folder, extension){
	if ( folder[folder.length-1] != "/"){
		folder = folder + "/";
	}
	var files = fs.readdirSync(folder);
	var post_list = [];
	for(var i in files) {
		var file_name = files[i];
	    if(path.extname(file_name) === extension) {
		   	post_list.push(file_name);
	    }
	}

	return post_list;
}

function execute(cmd){
	exec(cmd, function(error, stdout, stderr) {
	// command output is in stdout
});
};

function CreateIfFolderNotExist(folder){
	// create folder if not exist
	if (!fs.existsSync(folder)){
	    fs.mkdirSync(folder);
	}
}

chapters_file = "sections.tex";
post_folder_tex = "section/";
post_folder_out = "_posts_out/";
post_folder_in = '_posts/';
post_extension = ".md";
post_files = GetPostMarkdownFileList(post_folder_in, post_extension);

// create folder if not exist
CreateIfFolderNotExist(post_folder_out);
CreateIfFolderNotExist(post_folder_tex);

// jekyll post convert to tex
post_files.forEach(function(entry){
	var kramdown_script;
	var infile = post_folder_in + "/" + entry;
	var outfile = post_folder_out + "/" + entry;
	var outtex = post_folder_tex + "/" + entry.substring(0, entry.lastIndexOf(".")+1) + 'tex';
	
	// 替换路径中的 '//' 为 '/'
	outtex = outtex.replace(/\/\//g, "/"); 
	// 替换文件名中横线为下划线(横线 latex 无法编译)
	// outtex = outtex.replace(/-/g, "_"); 

	post_tex_list.push(outtex);
	jk(infile, outfile);
	// kramdown -o latex some.markdown >some.tex
	kramdown_script = "kramdown -o latex " + outfile + " >" + outtex;
	execute(kramdown_script);
});

// 写入 chapters.tex 文件内容
chapter_include_str = "";
for (var i = 0; i < post_tex_list.length; i++){
	var tex_file = post_tex_list[i];
	tex_file = tex_file.substring(0, tex_file.lastIndexOf(".")); // 不包含后缀 '.tex'
	chapter_include_str = chapter_include_str + "\\input{" + tex_file + "}\n";
}
fs.writeFile(chapters_file, chapter_include_str);

// compile book
// sh compile.sh
// var compile_script = "xelatex main.tex";
// var compile_no = 2;
// for (var i = 0; i < compile_no; i++){
// 	execute(compile_script);
// }
