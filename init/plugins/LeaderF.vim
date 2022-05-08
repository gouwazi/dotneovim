" 显示 icon, 默认开启
let g:Lf_ShowDevIcons = 1
" 启用popup模式
let g:Lf_WindowPosition = 'popup'
" 在popup显示预览
let g:Lf_PreviewInPopup = 1
let g:Lf_PopupPreviewPosition = 'right'
" 根目录设置
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']

let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }


" 索引方式
" 使用git/hg作为索引工具, 默认是1(开启)
let g:Lf_UseVersionControlTool=1
" rg 作为额外的搜索工具
let g:Lf_DefaultExternalTool='rg'

" 设置哪些功能自动显示预览
let g:Lf_PreviewResult = {
        \ 'File': 1,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 1,
        \ 'Function': 0,
        \ 'Line': 1,
        \ 'Colorscheme': 1,
        \ 'Rg': 1,
        \ 'Gtags': 0
        \}

" 文件搜索 <shift>-f
let g:Lf_ShortcutF = "<S-F>"

" 模糊搜索

" 搜索整个项目
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" 搜索当前buffer
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
" 搜索选中的文本
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
" 重复上次搜索
noremap go :<C-U>Leaderf! rg --recall<CR>
" 当前buffer下的函数和方法
"noremap <leader>f :LeaderfFunction<cr>
