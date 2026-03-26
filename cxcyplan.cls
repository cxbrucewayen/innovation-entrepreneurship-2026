% 中国国际大学生创新创业计划书 LaTeX 文档类
% 本文件由温州大学硕士学位论文模板（wzuthesis.cls）改造而来
% 原作者：温州大学 LaTeX 模板开发者
% 改造目的：适配中国国际大学生创新创业计划书格式规范
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{cxcyplan}[2026/03/26 v1.0 中国国际大学生创新创业计划书文档类]
\newcommand{\newclearpage}{\clearpage} % 设置文章为电子版格式（不添加多余空白页）
\DeclareOption{print-both-sides}{ % 设置文章为双面打印格式（添加多余空白页保证每个表格、章节开头为奇数页面）
    \renewcommand{\newclearpage}{
        \clearpage{
            \pagestyle{empty}
            \cleardoublepage
        }
    }
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\LoadClass[
    a4paper,
    12pt,
    openany,
    zihao=-4
]{ctexbook}


% 页面布局
\RequirePackage[top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry} % 设置页边距
\setlength{\topmargin}{-1cm} % 设置上边距
% % 页眉页脚
\RequirePackage{fancyhdr} % 页眉页脚设置

% % 行距和段落缩进
\RequirePackage{setspace} % 设置行距



% % 目录样式
\RequirePackage[notlof,notlot,nottoc,numbib]{tocbibind} %table of content
\RequirePackage{tocloft}


% % 颜色设置
\RequirePackage{xcolor} % 用于颜色设置

% 已移除：minted 代码高亮宏包及相关配置（\RequirePackage{minted}、\usemintedstyle{pastie}、\definecolor{code}），创新创业计划书不需要代码高亮功能

% % 特殊符号
\RequirePackage{gensymb} % 用于插入一些特殊符号

% % 表格制作
\RequirePackage{booktabs} % 用于三线表制作
\RequirePackage{multirow} % 用于合并表格行
\RequirePackage{makecell} % 用于单元格内换行和加粗等
\RequirePackage{longtable} % 用于长表格制作
\RequirePackage{colortbl} % 用于设置表格颜色
\RequirePackage{array}

% % 图片插入
\RequirePackage{graphicx} % 用于插入图片
\RequirePackage{wrapfig} % 用于图片的环绕排版
\RequirePackage[labelsep=space]{caption}
\RequirePackage[font=footnotesize]{subcaption} % 用于插入子图片

\RequirePackage[absolute]{textpos} %绝对位置控制

% % 符号说明
\RequirePackage{nomencl} % 用于制作符号说明

% % 伪代码
\RequirePackage[onelanguage,linesnumbered,algochapter,ruled,vlined]{algorithm2e}

% % 代码插入
\RequirePackage{listings} % 用于插入代码
% % 时间设置
\RequirePackage{datetime}

% % 字体设置

\setmonofont{Consolas}
% \RequirePackage{newtxtext}
\RequirePackage{bm} % 用于设置数学公式字体


\RequirePackage{ragged2e} % 实现两端对齐
\RequirePackage[section]{placeins}
\RequirePackage{enumitem}


\RequirePackage[bottom, perpage]{footmisc}
\usepackage{pifont} % 提供 \ding 命令用于带圈数字
\renewcommand{\thefootnote}{\ding{\numexpr171+\value{footnote}}}


\usepackage{fontspec}

%\setmainfont{Times New Roman}[
%  Path = ./fonts/,
%  Extension = .ttf,
%  UprightFont = times,
%  BoldFont = timesbd,
%  ItalicFont = timesi,
%  BoldItalicFont = timesbi
%]

\setmainfont{Times New Roman}[
UprightFont = *,
BoldFont = * Bold,
ItalicFont = * Italic,
BoldItalicFont = * Bold Italic
]


\setCJKmainfont{AdobeSongStd-Light.otf}
[
    Path=./fonts/,
    % BoldFont   =AdobeHeitiStd-Regular.otf,
    % ItalicFont =AdobeKaitiStd-Regular.otf
    AutoFakeBold,
    AutoFakeSlant
]
\setCJKsansfont{AdobeHeitiStd-Regular.otf}
[
    Path=./fonts/,
    AutoFakeBold,
    AutoFakeSlant
]
\setCJKmonofont{AdobeFangsongStd-Regular.otf}
[
    Path =./fonts/,
]
\setCJKfamilyfont{zhsong}{AdobeSongStd-Light.otf}
[
    Path = ./fonts/,
    BoldFont   = AdobeHeitiStd-Regular.otf,
    ItalicFont = AdobeKaitiStd-Regular.otf
]
\setCJKfamilyfont{zhhei}{AdobeHeitiStd-Regular.otf}%AdobeHeitiStd-Regular.otf
[
    Path = ./fonts/,
    AutoFakeBold,
    AutoFakeSlant
]
\setCJKfamilyfont{zhkai}{AdobeKaitiStd-Regular.otf}
[
    Path = ./fonts/,
    AutoFakeBold,
    AutoFakeSlant
]
\setCJKfamilyfont{zhfs}{AdobeFangsongStd-Regular.otf}
[
    Path = ./fonts/,
    AutoFakeBold,
    AutoFakeSlant
]
\newCJKfontfamily{\xingkai}{华文行楷}[
   %Path = ./fonts/,       % 字体文件所在路径（若文件在fonts文件夹下）
   %Extension = .ttf,      % 字体文件扩展名（避免重复写.ttf）
  % 行楷通常无需单独指定粗体（本身无粗体变种），若有对应粗体文件可保留
  BoldFont = 楷体  %华文行楷.ttf  % 注意：行楷一般无粗体，此行为可选
]


% 插图和表格标题设置
\RequirePackage[font=footnotesize,tableposition=top]{caption} % 设置插图和表格标题字体和位置

% 参考文献设置
\RequirePackage[numbers,sort&compress]{natbib} % 设置参考文献格式

% 设定时间为中文日期
\ctexset{today=small}


\AtBeginDocument{
    \hypersetup{
        citecolor=green,
        filecolor=black,
        linkcolor=black,
        urlcolor=black,
        CJKbookmarks=true,
        pdftitle={\@ctitle},
        pdfauthor={\@cauthor},
        pdfcreator={LaTeX with hyperref package, using SCUT undergraduate Thesis LaTeX Template by Shevon}
    }
    \noheadpagestyle
}
\pagestyle{fancy}

% 1.5倍行距（正式计划书行距规范）
\renewcommand{\baselinestretch}{1.5}

% 有序与无序列表环境
\setlist[enumerate]{nosep}
\renewcommand\labelenumi{\theenumi)}
%\renewcommand\labelenumi{\theenumi.}
\setlist[itemize]{nosep}
\setlist[description]{nosep}

% 默认页面页眉页脚样式
% 页眉章节标记：使用中文数字，格式与正文标题一致（一、标题）
\renewcommand{\chaptermark}[1]{%
  \markboth{\songti \chinese{chapter}、#1}{}%
}

\fancypagestyle{plain}{% 样式中间变量
}

\fancypagestyle{main}{
    \fancyhf{}
    % 已移除：盲审条件判断（\ifdefined\blind），创新创业计划书不需要盲审模式
    % 页眉显示创新创业计划书标题，五号宋体居中
    \fancyhead[c]{\zihao{5}\songti 中国国际大学生创新创业计划书}
    \fancyfoot[C]{\zihao{5}\thepage}
    \renewcommand{\headrulewidth}{1pt}
    \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{nohead}{
    \fancyfoot[C]{\zihao{5}\thepage}
    \fancyhead{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

%修改中间变量
\newcommand\mainpagestyle{\cleardoublepage\pagestyle{main}\let\ps@plain\ps@main}
\newcommand\noheadpagestyle{\cleardoublepage\pagestyle{nohead}\let\ps@plain\ps@nohead}

% F8 目录标题：小2号黑体居中
\renewcommand{\cfttoctitlefont}{\hfill\zihao{3} \bfseries\heiti}
\renewcommand{\cftlottitlefont}{\hfill\zihao{3}\bfseries\heiti}
\renewcommand{\cftloftitlefont}{\hfill\zihao{3}\bfseries\heiti}

% 如果要加粗，放 \bfseries
% 目录中章节标题：四号宋体
% F9 目录内容：宋体四号
\renewcommand{\cftchapfont}{\bfseries\zihao{4}\songti}
\renewcommand{\cftchappagefont}{\bfseries\zihao{4}\songti}

% 目录中其他内容：小四号宋体
\renewcommand{\cftsecfont}{\zihao{-4}\songti}
\renewcommand{\cftsecpagefont}{\zihao{-4}\songti}
\renewcommand{\cftsubsecfont}{\zihao{-4}\songti}
\renewcommand{\cftsubsecpagefont}{\zihao{-4}\songti}
% 目录章节编号宽度：适配中文编号格式
\setlength{\cftchapnumwidth}{2em}     % 章号「一、」约占 2em
\setlength{\cftsecindent}{2em}        % 节级缩进（与章号宽度对齐）
\setlength{\cftsecnumwidth}{3em}      % 节号「（一）」约占 3em
\setlength{\cftsubsecindent}{5em}     % 子节缩进 = 章号(2em) + 节号(3em)
\setlength{\cftsubsecnumwidth}{2em}   % 子节号「1. 」约占 2em

% 插图目录
\renewcommand{\listfigurename}{图\ 目\ 录}
\renewcommand{\cftfigfont}{\zihao{-4}\songti}
\renewcommand{\cftfigpagefont}{\zihao{-4}\songti}

% 表格目录
\renewcommand{\listtablename}{表\ 目\ 录}
\renewcommand{\cfttabfont}{\zihao{-4}\songti}
\renewcommand{\cfttabpagefont}{\zihao{-4}\songti}

\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftafterlottitle}{\hfill}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftdotsep}{1.2}
\renewcommand{\cftnodots}{\cftdotsep}
\cftsetpnumwidth{1.2em}

% 目录标题到目录正文的间距调整
\setlength{\cftaftertoctitleskip}{0.5cm}
\setlength{\cftafterloftitleskip}{0.6cm}
\setlength{\cftafterlottitleskip}{0.6cm}


% 表格与图片标题设定
% https://blog.csdn.net/uncle_gy/article/details/78313861
% https://tex.stackexchange.com/questions/101591/setting-font-size-for-caption-package
%\setlength\heavyrulewidth{0.2em} % 表格线宽
% F19 图题表题 宋体五号
\DeclareCaptionFormat{scutcaption}{\fontsize{10.5}{10.5}\selectfont#1#2#3}
\captionsetup{format=scutcaption}
\DeclareCaptionLabelFormat{opening}{#2)}
\subcaptionsetup[figure]{labelformat=opening}

% 目录设定，使用tocloft宏包
\setcounter{secnumdepth}{3} % depth of toc, 2
%\setcounter{tocdepth}{1}
% 如果要在目录中显示子章节请换用下面这行(目录中显示到x.y.z章)，如果不用这行默认显示到x.y章。
\setcounter{tocdepth}{2}

% 参考文献引用标记格式：右上角，带方括号
\RequirePackage{gbt7714}
\newcommand\overcite[1]{{\setcitestyle{super}\cite{#1}}}


% 相关信息宏定义
% 保留：\ctitle（计划书标题）、\cauthor（计划书负责人）、\cdata（完成日期）
\newcommand\ctitle[1]{\def\@ctitle{#1}}
\newcommand\cauthor[1]{\def\@cauthor{#1}} % 计划书负责人姓名
\newcommand\cdata[1]{\def\@cdata{#1}}   % 完成日期

% 创新创业计划书专用元信息宏定义
% ① 项目副标题
\newcommand\csubtitle[1]{\def\@csubtitle{#1}}
\def\@csubtitle{}
% ② 联系电话
\newcommand\cphone[1]{\def\@cphone{#1}}
\def\@cphone{}
% ③ 所属赛道
\newcommand\csaidao[1]{\def\@csaidao{#1}}
\def\@csaidao{}
% ④ 组别
\newcommand\czubie[1]{\def\@czubie{#1}}
\def\@czubie{}
% ⑤ 所在省份
\newcommand\cprovince[1]{\def\@cprovince{#1}}
\def\@cprovince{}
% ⑥ 所在学校（若原 cls 已有则跳过 newcommand，此处确认定义存在）
\newcommand\cschool[1]{\def\@cschool{#1}}
\def\@cschool{}
% ⑦ 公司名称（默认为空，封面中条件显示）
\newcommand\ccompany[1]{\def\@ccompany{#1}}
\def\@ccompany{}
% ⑧ 扉页内容长文本（设置提示性默认值）
\newcommand\cflypage[1]{\def\@cflypage{#1}}
\def\@cflypage{请在此填写项目核心简介}


% 已移除：\inputcode、\code 命令及 codeblock 环境（依赖 minted 宏包），创新创业计划书不需要代码块功能

% 封面生成函数（创新创业计划书专用封面）
\newcommand\makeCover{
    \begin{titlepage}
        \thispagestyle{empty}
        \begin{center}
            % ① 显示温大LOGO，宽度为页面宽度的30%
            \includegraphics[width=0.3\textwidth]{title.png}

            \vspace{1cm}

            % ② 项目名称（一号黑体加粗）
            {\heiti \zihao{1} \bfseries \@ctitle}

            \vspace{0.5cm}

            % ③ 副标题（三号宋体）
            {\songti \zihao{3} \@csubtitle}

            \vspace{2cm}

            % ④⑤⑥ 信息表：右对齐标签，左对齐内容
            \begin{tabular}{rl}
                所属赛道：& \@csaidao \\
                组\hspace{2\ccwd}别：& \@czubie \\
                所在省份：& \@cprovince \\
                所在学校：& \@cschool \\
                姓\hspace{2\ccwd}名：& \@cauthor \\
                联系电话：& \@cphone \\
                % ⑥ 公司名称：仅在非空时显示
                \ifx\@ccompany\empty \else 公司名称：& \@ccompany \\ \fi
            \end{tabular}
        \end{center}

        \vfill

        % ⑧ 底部日期（四号宋体居中）
        \begin{center}
            {\songti \zihao{4} \@cdata}
        \end{center}
    \end{titlepage}
}

% 扉页生成函数（项目简介扉页，紧跟封面之后）
\newcommand\makeFlyPage{
    \newpage
    \thispagestyle{empty}       % 扉页无页眉页脚、无页码
    \vspace*{3cm}               % 带星号版本确保页面起始处也生效
    \begin{center}
        {\heiti \zihao{3} \bfseries 项目简介}
    \end{center}
    \vspace{1cm}
    {\songti \zihao{4} \linespread{1.8}\selectfont % linespread 必须在文字前调用
    \@cflypage}
    \newpage                    % 确保后续内容（目录等）从新页开始
}

% 已移除：\makedisclaim 函数体（独创性声明 + 授权声明），创新创业计划书不使用声明页



% 已移除：\makecabstract 函数体（中文摘要页）、\makeeabstract 函数体（英文摘要页）、\makeabstract 函数体（摘要入口），创新创业计划书不使用摘要页

\newcommand\maketableofcontents{
    % \pagenumbering{roman}       % 从 i 开始编号（罗马数字）
    % \thispagestyle{empty}       % 目录页本身不要页码
    \vspace*{-2.8cm}
    \renewcommand{\contentsname}{\zihao{3} \heiti \centerline{目\hspace{\ccwd}录}}
    { % 局部作用域，仅影响目录
        \linespread{1.2}\selectfont % 1.2倍行距
        \addcontentsline{toc}{chapter}{目\hspace{\ccwd}录}
        \tableofcontents
    }
    \newpage
}

% 已移除：\makelistoffiguretable 函数体（图表目录生成），创新创业计划书不需要独立图表目录页



\renewcommand\mainmatter{
    \@mainmattertrue
    \pagenumbering{arabic}
    \ctexset {
        % 一级标题：「一、项目概述」，居中三号黑体加粗
        chapter = {
            fixskip    = true,
            format     = {\centering\zihao{3}\heiti\bfseries},  % 居中三号黑体加粗
            number     = {\chinese{chapter}},                   % 中文数字：一、二、三…
            name       = {,、},                                 % 编号后加顿号，无前缀
            aftername  = {},                                    % 章号与标题之间无额外间距
            beforeskip = {10pt},
            afterskip  = {20pt},
        },
        % 二级标题：「（一）项目背景」，左对齐四号黑体
        section = {
            format     = {\zihao{4}\heiti},                     % 左对齐四号黑体
            number     = {\chinese{section}},                   % 中文数字：一、二…
            name       = {（,）},                               % 圆括号包裹编号
            aftername  = {},                                    % 编号与标题之间无额外间距
            beforeskip = {0.5\baselineskip},
            afterskip  = {0.5\baselineskip plus 0.3\baselineskip minus 0.3\baselineskip},
        },
        % 三级标题：「1. 具体内容」，左对齐四号黑体
        subsection = {
            format     = {\zihao{4}\heiti},                     % 左对齐四号黑体
            number     = {\arabic{subsection}},                 % 阿拉伯数字：1、2、3…
            name       = {},                                    % 无前缀/后缀
            aftername  = {. },                                  % 数字后加点和空格：「1. 」
            beforeskip = {0.5\baselineskip},
            afterskip  = {0.5\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip},
        },
        % 四级标题：小四号黑体（不常用）
        subsubsection = {
            fixskip    = true,
            format     = {\zihao{-4}\heiti},
            aftername  = \hspace{0.5em},
            beforeskip = {0.5\baselineskip},
            afterskip  = {0.5\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip},
        }
    }
    \zihao{-4}\songti \linespread{1.5}\selectfont % 1.5倍行距，正文进入时生效
    %\pagestyle{plain}
    \mainpagestyle
}

\renewcommand\backmatter{
    \@mainmatterfalse
    \setcounter{chapter}{0}
    \setcounter{section}{0}
    \ctexset {
        chapter = {
          fixskip = true,
          format={\centering\zihao{3}\heiti},
          nameformat = {\zihao{3}\heiti},
          beforeskip = {10pt},
          afterskip = {20pt},
          titleformat = {\zihao{3}\heiti}
         },
        section = {
          format = {\zihao{4}\heiti},
          aftername = \hspace{0.5em},
          nameformat = {\zihao{4}\heiti},
          titleformat = {\zihao{4}\heiti},
          beforeskip = {0.5\baselineskip},
          afterskip = {0.5\baselineskip plus 0.3\baselineskip minus 0.3\baselineskip},
         },
        subsection = {
                format = {\zihao{4}\heiti},
                aftername = \hspace{0.5em},
                nameformat = {\zihao{4}\heiti},
                titleformat = {\zihao{4}\heiti},
                beforeskip = {0.5\baselineskip},
                afterskip = {0.5\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip},
            },
        subsubsection = {
                fixskip = true,
                format = {\zihao{-4}\heiti},
                aftername = \hspace{0.5em},
                nameformat = {\zihao{-4}\heiti},
                titleformat = {\zihao{-4}\heiti},
                beforeskip = {0.5\baselineskip},
                afterskip = {0.5\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip},
            }
    }
    \zihao{-4}\songti \linespread{1.5}\selectfont % 1.5倍行距，后记进入时生效


}



% 参考文献
% 标题小五号黑体加冒号
% 内容小五号宋体
\newcommand\makereferences{
    \begingroup

    % 引用样式
    \bibliographystyle{gbt7714-numerical}
    % \nocite{*}
    % F15 参考文献内容 宋体五号
    {\zihao{-4}\songti\linespread{1.5}\bibliography{main}}    % 引用文献列表
    \endgroup
}


% 附录样式
\renewcommand\appendix{\par
    \@mainmattertrue
    % \fancypagestyle{plain}{
    %     \fancyhead[R]{\zihao{-5} 附录\thechapter \leftmark}
    % }
    \setcounter{chapter}{0}
    \setcounter{section}{0}
    \gdef\@chapapp{\appendixname}
    \gdef\thechapter{\@Alph\c@chapter}
    \gdef\CTEX@prechapter{\CTEX@preappendix}
    \gdef\CTEX@thechapter{\CTEX@appendix@number}
    \gdef\CTEX@postchapter{}
    \renewcommand\thefigure{\Alph{chapter}-\arabic{figure}}
    \renewcommand\thetable{\Alph{chapter}-\arabic{table}}
}


\def\equationautorefname{式}%
\def\footnoteautorefname{脚注}%
\def\itemautorefname{项}%
\def\figureautorefname{图}%
\def\tableautorefname{表}%
\def\partautorefname{篇}%
\def\appendixautorefname{附录}%
\def\chapterautorefname{章}%
\def\sectionautorefname{节}%
\def\subsectionautorefname{小节}%
\def\subsubsectionautorefname{小小节}%
\def\paragraphautorefname{段落}%
\def\subparagraphautorefname{子段落}%
\def\FancyVerbLineautorefname{行}%
\def\theoremautorefname{定理}%

% 设置公式的编号为短杠形式
\renewcommand\theequation{%
    公式\thechapter-\arabic{equation}}
% 设置图, 表的编号为短杠形式
\renewcommand\thefigure{\arabic{chapter}-\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}-\arabic{table}}


% 超链接
\RequirePackage[hidelinks, hyperfootnotes=true]{hyperref} % 用于制作超链接

% 已移除：\makeblindpage 函数体（盲审封面），创新创业计划书不需要盲审封面

\def\makefirstpage{
    % 已移除：盲审条件判断（\ifdefined\blind ... \else ... \fi），创新创业计划书不需要盲审模式
    \pagenumbering{Roman}
    \makeCover            % 生成封面
    \makeFlyPage          % 生成附页（项目概况页）
    \maketableofcontents  % 生成目录
}

