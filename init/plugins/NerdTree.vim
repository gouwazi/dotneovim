" 窗口大小
let g:NERDTreeWinSize=25
"let g:NERDTreeDirArrowExpandable = ' '
"let g:NERDTreeDirArrowCollapsible = ' '
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" 隐藏行号
augroup VimInitStyle
		au!
		au FileType qf setlocal nonumber
augroup END
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
"显示隐藏文件
let g:NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']  
