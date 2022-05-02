"================================================
" init.vim - 初始化配置
"================================================


"------------------------------------------------
" 模块加载
"------------------------------------------------

" 加载基础配置
source ~/.config/nvim/init/basic.vim

" 设定tabsize
source ~/.config/nvim/init/tabsize.vim

" 加载插件
source ~/.config/nvim/init/plugins.vim

" 界面样式
source ~/.config/nvim/init/style.vim

" 自定义键位
source ~/.config/nvim/init/keymaps.vim

" 加载插件配置
for file in split(glob('~/.config/nvim/init/plugins/*.vim'), '\n')
	exe 'source' file
endfor

lua require('init')
