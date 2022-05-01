"================================================
" init-style.vim - 显示样式设置
"================================================

"------------------------------------------------
" 显示设置
"------------------------------------------------

" 显示行号
set number

" 设置显示制表符等隐藏字符
set list

" 水平分割窗口时， 默认在右边显示新窗口
set splitright


"------------------------------------------------
" 颜色主题
"------------------------------------------------

" 设置背景
" light/dark
set background=dark

" 允许 256 色
set t_Co=256
" 开启真彩
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" 设置颜色主题
colorscheme one 
let g:airline_theme='one'

"----------------------------------------------------------------------
" 终端设置，隐藏行号和侧边栏
"----------------------------------------------------------------------
"if has('terminal') && exists(':terminal') == 2
	"if exists('##TerminalOpen')
		"augroup VimUnixTerminalGroup
			"au! 
			"au TerminalOpen * setlocal nonumber signcolumn=no
		"augroup END
	"endif
"endif


"----------------------------------------------------------------------
" quickfix 设置，隐藏行号
"----------------------------------------------------------------------
augroup VimInitStyle
	au!
	au FileType qf setlocal nonumber
augroup END
