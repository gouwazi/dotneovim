"=================================================
"
" init-basic.vim - 基础配置
"
"=================================================

"------------------------------------------------
" 基础设置
"------------------------------------------------

" 禁用vi兼容模式
set nocompatible

" 设置 Backspace 键模式
set bs=eol,start,indent
" 解决插入模式下delete/backspce键失效问题
"set backspace=2

" 开始文件类型检测
" 等效于三个命令
" filetype on 			打开文件类型检测功能
" filetype plugin on 	允许根据文件类型加载插件
" filetype indent on 	允许根据文件类型设置缩进
filetype plugin indent on

" 关闭自动换行
set nowrap

" 状态栏
" 0: 永不
" 1: 只有在有至少两个窗口时
" 2: 总是
" 3: 共用一个状态栏(nvim >= 0.7)
set laststatus=3

" 显示光标当前位置
set ruler

" 开启行号显示
set number

" 高亮显示当前行
set cursorline

" 高亮显示当前列
set cursorcolumn              

" 允许使用鼠标
"  n 普通模式和终端模式
"  v 可视模式
"  i 插入模式
"  c 命令行模式
"  h 编辑帮助文件时，所有前面的模式
"  a 所有前面的模式
"  r |hit-enter| 和 |more-prompt| 提示时
set mouse=a

"------------------------------------------------
" 搜索设置
"------------------------------------------------

" 高亮搜索结果
set hlsearch

" 查找输入时动态增量显示查找结果
set incsearch                 

" 忽略大小写
set ignorecase                

" 智能忽略大小写
set smartcase


"------------------------------------------------
" 语法高亮设置
"------------------------------------------------

" 开启语法高亮功能
syntax enable

"允许用指定语法高亮配色方案替换默认方案
syntax on

"------------------------------------------------
" 编码设置
"------------------------------------------------

if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8

	" 文件默认编码
	set fileencoding=utf-8

	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif


"------------------------------------------------
" 其他设置
"------------------------------------------------

"" 未保存或者只读时，弹出确认
set confirm

" 命令选项菜单
set wildmenu

set updatetime=100

" 保持光标上下显示的行数
set scrolloff=5                

set autoread
set autowrite

"记住上次打开的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
autocmd BufNewFile *.py 0put =\"#!/usr/bin/python\<nl>\"|$
