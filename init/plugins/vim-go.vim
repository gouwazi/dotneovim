" " 关闭gopls,否则和coc同时使用会开两个gopls进程
let g:go_gopls_enabled = 1
let g:go_gopls_options=['-remote=:37374']
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_referrers_mode = 'gopls'
let g:go_fmt_command = 'goimports'
let g:go_autodetect_gopath = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
" 在保存时自动格式化并导入未添加的包 - gopls
"autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
"augroup go
  "autocmd!
  "autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
"augroup END
