"================================================
" 按键设置
"================================================

" leader键 -> 空格
let mapleader=" "             

" F2 打开函数列表
noremap <F2> :LeaderfFunction!<cr>

" F5 运行文件
"nnoremap <silent> <F5> :call ExecFile()<cr>
nnoremap <silent> <F5> :AsyncTask file-run<cr>

" F6 测试项目
"nnoremap <silent> <F6> :call TestProject()<cr>
nnoremap <silent> <F6> :AsyncTask project-test<cr>

" F7 编译项目
"nnoremap <silent> <F7> :call CompileProject()<cr>
nnoremap <silent> <F7> :AsyncTask project-build<cr>

" F8 运行项目
"nnoremap <silent> <F8> :call RunProject()<cr>
nnoremap <silent> <F8> :AsyncTask project-run<cr>

" F9 编译文件
"nnoremap <silent> <F9> :call CompileFile()<cr>
nnoremap <silent> <F9> :AsyncTask file-build<cr>

" F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(20)<cr>

"一键编译
func! Compile()
endfunc

" F5 运行当前文件，输出到内置终端
func! ExecFile()
    exec "w"
	let cmd = ''
	if index(['c', 'cpp', 'rust', 'go'], &ft) >= 0
		" native 语言，把当前文件名去掉扩展名后作为可执行运行
		" 写全路径名是因为后面 -cwd=? 会改变运行时的当前路径，所以写全路径
		" 加双引号是为了避免路径中包含空格
		let cmd = '"$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
	elseif &ft == 'python'
		" 关闭 python 缓存，实时看到输出
		let $PYTHONUNBUFFERED=1 
		let cmd = 'python "$(VIM_FILEPATH)"'
	elseif &ft == 'javascript'
		let cmd = 'node "$(VIM_FILEPATH)"'
	elseif &ft == 'perl'
		let cmd = 'perl "$(VIM_FILEPATH)"'
	elseif &ft == 'ruby'
		let cmd = 'ruby "$(VIM_FILEPATH)"'
	elseif &ft == 'php'
		let cmd = 'php "$(VIM_FILEPATH)"'
	elseif &ft == 'lua'
		let cmd = 'lua "$(VIM_FILEPATH)"'
	elseif &ft == 'zsh'
		let cmd = 'zsh "$(VIM_FILEPATH)"'
	elseif &ft == 'ps1'
		let cmd = 'powershell -file "$(VIM_FILEPATH)"'
	elseif &ft == 'vbs'
		let cmd = 'cscript -nologo "$(VIM_FILEPATH)"'
	elseif &ft == 'sh'
		let cmd = 'bash "$(VIM_FILEPATH)"'
	elseif &ft == 'markdown'
		"Markdown预览，在浏览器中打开
		exec 'MarkdownPreview'
	else
		return
	endif
	" -mode=term: 输出到 内置终端，而不是 quickfix window
	" -raw: 输出内容直接显示到 内置终端 不匹配 errorformat
	" -rows=20: 终端行数20，即高度
	" -focus=0: 焦点不切换到终端
	" -save=2: 保存所有改动过的文件
	" -cwd=$(VIM_FILEDIR): 运行初始化目录为文件所在目录
	exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -focus=0 -rows=20 -mode=term '. cmd
endfunc

" F6 测试项目
func! TestProject()
	if &ft == 'c' || &ft == 'cpp'
		exec 'AsyncRun -cwd=<root> -raw -save=2 -focus=0 -rows=20 -mode=term make test'
	elseif &ft == 'go'
		exec 'AsyncRun -raw -save=2 -mode=term -focus=0 -rows=20 go test "%:p:h" '
	elseif &ft == 'rust'
		exec 'AsyncRun -cwd=<root> -raw -save=2 -focus=0 -mode=term -rows=20 cargo test'
	elseif 
		return
	endif
endfunc


" F7 编译项目
func! CompileProject()
	if &ft == 'c' || &ft == 'cpp'
		exec 'AsyncRun -cwd=<root> -raw -save=2 -focus=0 -rows=20 -mode=term make'
	elseif &ft == 'go'
		exec 'AsyncRun -raw -save=2 -mode=term -focus=0 -rows=20 go build "%:p:h" '
	elseif &ft == 'rust'
		exec 'AsyncRun -cwd=<root> -raw -save=2 -focus=0 -mode=term -rows=20 cargo build'
	elseif 
		return
	endif
endfunc

" F8 运行项目
func! RunProject()
	if &ft == 'c' || &ft == 'cpp'
		exec 'AsyncRun -cwd=<root> -raw -save=2 -focus=0 -rows=20 -mode=term make run'
	elseif &ft == 'go'
		exec 'AsyncRun -raw -save=2 -mode=term -focus=0 -rows=20 go run "%:p:h" '
	elseif &ft == 'rust'
		exec 'AsyncRun -cwd=<root> -raw -save=2 -focus=0 -mode=term -rows=20 cargo run'
	elseif 
		return
	endif
endfunc

" F9 编译文件
func! CompileFile()
	exec "w"
	if &ft == 'c'
		exec 'AsyncRun -raw -mode=term -focus=0 -rows=20 gcc -Wall "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
	elseif &ft == 'cpp'
		exec 'AsyncRun -raw -mode=term -focus=0 -rows=20 g++ -Wall "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
	elseif &ft == 'go'
		exec 'AsyncRun -raw -mode=term -focus=0 -rows=20 go build -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" "$(VIM_FILEPATH)"'
	elseif &ft == 'rust'
		exec 'AsyncRun -raw -mode=term -focus=0 -rows=20 rustc "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
	elseif
		return
	endif
endfunc

"自动导入缺失的包
function AutoImports()
    exec "w"
    if &filetype == 'go'
        exec "silent! !goimports -w %"
    endif
endfunction

" Ultinsnips
" Ctrl-a 触发代码片段补全
" Ctrl-j/k 跳转上/下一个位置
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" <leader>rn 重命名
nmap <leader>rn <Plug>(coc-rename)
" <C-b> 跳转到定义处 <C-o>返回 
nmap <C-b> <Plug>(coc-definition)
