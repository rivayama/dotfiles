" Color scheme
colorscheme desert

" Window Size
set columns=106
set lines=58

" Command Line Height
set cmdheight=1

" No Swap, No Backup
set noswapfile
set nobackup

" Font
set guifont=Consolas:h13

" Hide Scrollbar on both side
set guioptions-=r
set guioptions-=L

" Unset auto line change
set textwidth=0

" Undofile
set undodir=/tmp

" Ctrl-U
"nnoremap <C-u> :<Up>

" Show tabline
set showtabline=2
set guioptions-=e

" textwidthの再設定
au Filetype qfix_memo setlocal textwidth=0

" Qfixhowm
nnoremap <Space>mc :<C-U>call qfixmemo#EditNew()<CR>
nnoremap <Space>ml :<C-U>call qfixmemo#ListCmd("nocache")<CR>

"----------------------------
" Win GUI Setting
"----------------------------
if has('win32') && has('gui_running')

  " Color Scheme
  colorscheme molokai

  " Hide Menu and Toolbar
  set guioptions-=m
  set guioptions-=T

  " Font
  set guifont=MS_Gothic:h10:cSHIFTJIS

endif

highlight NonText guifg=#585858 guibg=#3a3a3a
highlight SpecialKey guifg=#585858 guibg=#3a3a3a
