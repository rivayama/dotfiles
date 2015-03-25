" Color scheme
colorscheme desert

" Window Size
set columns=80
set lines=48

" Command Line Height
set cmdheight=1

" No Swap, No Backup
set noswapfile
set nobackup

" Font
set guifont=Menlo-Regular:h13

" Hide Scrollbar on both side
set guioptions-=r
set guioptions-=L

" Unset auto line change
set textwidth=0

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
