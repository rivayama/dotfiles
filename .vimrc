syntax on

" Unset beep
set visualbell t_vb=

" Set Highlight Search
set hlsearch

" Set Backspace
set backspace=indent,eol,start

" Display Tab and Line end
set list
set listchars=eol:$,tab:>-

" Auto Indent
set autoindent

" Nowrap
set nowrap

" Set Ignore Search
set ignorecase

" Set fold method
set fdm=marker

" Tab Setting
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" File Encoding
set fileencodings=utf-8,cp932,euc-jp
set fileformats=unix,dos

" Default
set encoding=utf-8
set fileformat=unix

" Stop HTML Auto Indent
autocmd FileType html set indentexpr&
autocmd FileType xhtml set indentexpr&

"----------------------------
" GUI Setting
"----------------------------
if has('gui_running')

  " Color Scheme
  colorscheme molokai

  " Hide Menu and Toolbar
  set guioptions-=m
  set guioptions-=T

  " Hide Scrollbar on both side
  set guioptions-=r
  set guioptions-=L

  " Window Size
  set lines=50
  set columns=90

  " Command Line Height
  set cmdheight=1

  " Font
  set guifont=MS_Gothic:h10:cSHIFTJIS

  " No Swap, No Backup
  set noswapfile
  set nobackup

  " Yank to Clipboard
  set clipboard+=unnamed

endif

"----------------------------
" Mac GUI Setting
"----------------------------
if has('gui_macvim')

  " Color scheme
  colorscheme macvim

  " Font
  set guifont=Osaka:h14

end


"----------------------------
" Plugius
"----------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim

"----------------------------
" Key-mapping
"----------------------------
" Open and reload .vimrc or _gvimrc
if has('gui_macvim')
  nnoremap <Space>ev :<C-u>split $MYVIMRC<CR>
  nnoremap <Space>rv :<C-u>source $MYVIMRC<CR>

elseif has('gui_running')
  nnoremap <Space>ev :<C-u>split $MYGVIMRC<CR>
  nnoremap <Space>rv :<C-u>source $MYGVIMRC<CR>

else
  nnoremap <Space>ev :<C-u>split $MYVIMRC<CR>
  nnoremap <Space>rv :<C-u>source $MYVIMRC<CR>

endif

" Command-line mode keymappings:
" <C-a>, A: move to head
cnoremap <C-a> <Home>
" <C-e>, E: move to end
cnoremap <C-e> <End>
" <C-b>: previous char
cnoremap <C-b> <Left>
" <C-f>: next char
cnoremap <C-f> <Right>
" <C-d>: delete char
cnoremap <C-d> <Del>
" <C-n>: next history
cnoremap <C-n> <Down>
" <C-p>: previous history
cnoremap <C-p> <Up>
" <C-k>, K: delete to end
cnoremap <C-k> <C-\>e getcmdpos() == 1 ?
      \ '' : getcmdline()[:getcmdpos()-2]<CR>
" <C-y>: paste
cnoremap <C-y> <C-r>"

