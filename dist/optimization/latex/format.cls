%% settings

\usepackage{url}
\usepackage{xcolor}

% Chinese
% \usepackage{xeCJK}

% inlucde image
\usepackage{graphicx}

% figure force location
% refer: http://tex.stackexchange.com/questions/8625/force-figure-placement-in-text
\usepackage{float}

% url and url wrap
% refer: http://tex.stackexchange.com/questions/3033/forcing-linebreaks-in-url
\PassOptionsToPackage{hyphens}{url}\usepackage{hyperref}

% image path
\graphicspath{{latex/assets/}}

% line space
\linespread{1.25}

% indent
\usepackage{indentfirst}
\setlength{\parindent}{2em}

% list item space
% refer:
% http://tex.stackexchange.com/questions/86054/how-to-remove-the-whitespace-before-itemize-enumerate
\usepackage{enumitem}
\setlist[enumerate]{nosep, noitemsep} % {noitemsep, topsep=0pt}
\setlist[itemize]{nosep, noitemsep}

% code
% inline code
\newcommand{\code}{\texttt}
% verbatim global font size
\makeatletter
\def\verbatim{\small\@verbatim \frenchspacing\@vobeyspaces \@xverbatim}
\makeatother
% code listings
% refer:
% http://tex.stackexchange.com/questions/179926/pandoc-markdown-to-pdf-without-cutting-off-code-block-lines-that-are-too-long
% http://tex.stackexchange.com/questions/174569/code-not-wrapping-in-listings-even-though-breaklines-true
% http://tex.stackexchange.com/questions/116534/lstlisting-line-wrapping
\usepackage{listings}
\lstset{
    basicstyle=\ttfamily\small,
    columns=flexible, % code copy
    numbers=left,
    numberstyle=\tiny,
    stepnumber=1,
    numbersep=5pt,
    backgroundcolor=\color{black!10},
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2,
    captionpos=b,
    breaklines=true,
    postbreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\color{red}\hookrightarrow\space}},
    breakatwhitespace=false,
    breakautoindent=true,
    linewidth=\textwidth
}

% bibliography
\bibliographystyle{plain}


% markdown to latex fix
% \tightlist error
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
% longtable error
% refer: http://tex.stackexchange.com/questions/228755/undefined-control-sequence-on-left-parenthesis-after-midrule-in-longtable
\usepackage{longtable,booktabs}
