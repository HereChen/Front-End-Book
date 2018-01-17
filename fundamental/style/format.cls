% for convert
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
\usepackage{inputenc,fontenc,longtable}

\usepackage{amsmath,supertabular}

% page layout
% 页面
% \usepackage[centering,paperwidth=180mm,paperheight=230mm,%
% body={390pt,530pt},marginparsep=10pt,marginpar=50pt]{geometry}
% body 137mmx186mm

% header, footer
\usepackage{fancyhdr}

% picture
% 图片
\usepackage{graphicx}
% 图片表格居中
\makeatletter
\g@addto@macro\@floatboxreset\centering
\makeatother

% symbolic
% 符号
\usepackage{trfsigns,mathabx}

% color
% 颜色
\usepackage{color,xcolor}
\definecolor{commentcolor}{RGB}{34,139,34}
\definecolor{codecolor}{RGB}{34,139,34}

% background
% 背景
\usepackage{framed}
\definecolor{shadecolor}{gray}{0.92}
% 用于shaded的背景

% url
% 链接
\usepackage{url,hyperref}
\hypersetup{pdftitle = {Chen},
    colorlinks = true,
    pdfborder = 0 0 0,
    breaklinks = false}

% code
% 代码
\usepackage{listings}
\lstset{numbers = none,                       % 代码行号
  % numberstyle = \scriptsize,
  % frameround = fttt,
  columns = flexible,                         % 确保复制粘贴代码是正常的                          
  frame = lines,                              % 边框 trBL single
  backgroundcolor = \color{white},            % 背景颜色
  language = MATLAB,
  keywordstyle = \color{blue},                % 关键词颜色
  commentstyle = \color{commentcolor},        % 注释颜色
  basicstyle = \linespread{1}\ttfamily\footnotesize, % 代码字体
  emph = {warning,pcode},                     % 自定义关键词
  emphstyle = \color{blue},                   % 自定义关键词颜色
  showspaces = false,                         % 不显示空格字符
  xleftmargin=17pt,
  framexleftmargin=17pt,
  framexrightmargin=5pt,
  %framexbottommargin=2pt,
  texcl = false}                              % LaTeX 禁用
% 在对应的设置中加入 nolol=true 以不列入目录中
% 只要不加入caption就不会录入目录

% table
% 表格
\usepackage{multirow,arydshln,multicol,booktabs,float}

% paragraph
% 段落
\setlength\parindent{0pt}
\setlength{\parskip}{2.0pt}   % 段间距
\linespread{1.3}              % 行间距

% font
% 字体
\usepackage{xeCJK}

% definition note
% 定义注意事项
\usepackage{amsthm}
\theoremstyle{remark}
\newtheorem{nota}{Note}[section]
\newcommand{\notation}[1]{\nota{\kai #1}}

% item
% list item space
% refer: http://tex.stackexchange.com/questions/86054/how-to-remove-the-whitespace-before-itemize-enumerate
\usepackage{mdwlist}          % item 压缩
\usepackage{enumitem}
\setlist[enumerate]{noitemsep} % {noitemsep, topsep=0pt}
\setlist[itemize]{noitemsep}

% multiple column
% 多栏
\usepackage{multicol}