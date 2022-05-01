"================================================
" init-plugins.vim - 插件配置
"================================================


"------------------------------------------------
" 插件分组
"------------------------------------------------

if !exists('g:plugin_group')
	let g:plugin_group = ['basic', 'filetypes', 'ls', 'others']
	let g:plugin_group += ['style']
endif


if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

"------------------------------------------------
" 基础插件
"------------------------------------------------

if index(g:plugin_group, 'basic') >= 0

	"括号补全
	Plug 'jiangmiao/auto-pairs'

 	" vim启动界面
 	Plug 'mhinz/vim-startify'
	
	"快捷键批量注释
	Plug 'scrooloose/nerdcommenter'

	" vim 菜单
	Plug 'skywind3000/vim-quickui'

	" vim 中文文档
	Plug 'yianwillis/vimcdoc'


endif

"------------------------------------------------
" 风格插件
"------------------------------------------------

if index(g:plugin_group, 'style') >= 0

	"--------------------------------------------
	" 主题插件
	"--------------------------------------------
	
	"vs风格 onedark
	Plug 'joshdick/onedark.vim'

	"solarized更改主题 gruvbox
	Plug 'morhetz/gruvbox'

	"solarized
	Plug 'altercation/vim-colors-solarized'

	Plug 'mhinz/vim-janah'

	"papercolor
	Plug 'NLKNguyen/papercolor-theme'              

	"nord
	Plug 'arcticicestudio/nord-vim'

	"one
	Plug 'rakr/vim-one'                            

	"吸血鬼主题
	Plug 'dracula/vim'                             

	Plug 'sainnhe/sonokai'
	Plug 'ajmwagar/vim-deus'
	Plug 'nanotech/jellybeans.vim'

	"--------------------------------------------
	" 其他
	"--------------------------------------------

	"状态栏
	Plug 'vim-airline/vim-airline'

	"高亮
	Plug 'sheerun/vim-polyglot'

	"c/c++高亮
	Plug 'octol/vim-cpp-enhanced-highlight'

	"单词增加下划线
	Plug 'itchyny/vim-cursorword'

	"代码缩进线
	Plug 'yggdroot/indentline'

endif


"------------------------------------------------
" 文件类型拓展
"------------------------------------------------

if index(g:plugin_group, 'filetypes') >= 0

	" Markdown 预览 (使用不了的话先进目录yarn install，不行再重装)
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for':['markdown', 'vim-plug'] }

	" markdown 表格自动格式化
	Plug 'dhruvasagar/vim-table-mode'

	" go插件
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}
	
endif


"------------------------------------------------
" Language server
"------------------------------------------------

if index(g:plugin_group, 'ls') >= 0

	" 补全框架和lsc
	"Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

endif


"------------------------------------------------
" 其他插件
"------------------------------------------------

if index(g:plugin_group, 'others') >= 0

	" 目录树
	Plug 'scrooloose/nerdtree'

	" 语法检查和语义错误
	Plug 'w0rp/ale'

	" vimwiki
	"Plug 'vimwiki/vimwiki'                         

	" 代码片段补全引擎
	Plug 'SirVer/ultisnips'

	" 代码片段模板，配合补全引擎
	Plug 'gouwazi/vim-snippets'
	
	" 函数列表
	" 需要安装ctags
	Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
	
	" 任务系统
	Plug 'skywind3000/asynctasks.vim'

	" 异步执行
	Plug 'skywind3000/asyncrun.vim'
	
	" vim终端
	Plug 'skywind3000/vim-terminal-help'
	
	" 代码对齐插件
	" Plug 'junegunn/vim-easy-align'
	
	" 在不同模式下自动切换中英文
	Plug 'lilydjwg/fcitx.vim'

	"任务系统
	Plug 'skywind3000/asynctasks.vim'
	
endif

call plug#end()
