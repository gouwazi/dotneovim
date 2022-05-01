"================================================
" 按键设置
"================================================

" leader键 -> 空格
let mapleader=" "             

" F5 运行文件
nnoremap <silent> <F5> :AsyncTask file-run<cr>

" F6 测试项目
nnoremap <silent> <F6> :AsyncTask project-test<cr>

" F7 编译项目
nnoremap <silent> <F7> :AsyncTask project-build<cr>

" F8 运行项目
nnoremap <silent> <F8> :AsyncTask project-run<cr>

" F9 编译文件
nnoremap <silent> <F9> :AsyncTask file-build<cr>

" F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(20)<cr>

" 打开/关闭 coc-explorer
nnoremap <space>e :CocCommand explorer<CR>
