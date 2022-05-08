call wilder#setup({'modes': [':', '/', '?']})
" 自定义渲染器
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ 'left':  [ ' ', wilder#popupmenu_devicons(),],
      \ 'right': [ ' ', wilder#popupmenu_scrollbar(),],
      \ 'border': 'rounded',
      \ 'pumblend': 20,
      \ })),)
