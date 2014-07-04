"----------------------------
" Neo Bundle
"----------------------------
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build': {
    \ 'mac': 'make -f make_mac.mak',
    \ 'unix': 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'itchyny/lightline.vim'
if has('python')
  NeoBundle 'kakkyz81/evervim'
endif

" Colorschemes
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'itchyny/landscape.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"----------------------------
" Plugius
"----------------------------
" Vim-QuickRun
set splitright
let g:quickrun_config = {}
let g:quickrun_config = {'_': {
  \ 'runner': 'vimproc',
  \ 'split': 'vertical',
  \ 'outputter/buffer/close_on_empty': 1,
\ }}
nnoremap <Space>qr :<C-u>QuickRun<CR>

" Vim-fugitive
nnoremap <Space>gs :<C-u>Gstatus<CR>
nnoremap <Space>gd :<C-u>Gdiff<CR>
nnoremap <Space>ga :<C-u>Gwrite<CR>
nnoremap <Space>gc :<C-u>Gcommit<CR>
nnoremap <Space>gp :<C-u>Git push origin<CR>

" lightline.vim
let g:lightline = {
  \ 'colorscheme': 'default',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'dir', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
  \   'dir': '%.20(%{expand("%:h:s?\\S$?\\0/?")}%)',
  \ },
  \ 'component_visible_condition': {
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
  \ },
\ }

" evervim
if filereadable(expand('~/.evervim.token'))
  source ~/.evervim.token
endif
nnoremap <Space>el :<C-u>EvervimNotebookList<CR>
nnoremap <Space>et :<C-u>EvervimListTags<CR>
nnoremap <Space>ec :<C-u>EvervimCreateNote<CR>

"----------------------------
" Key-mapping
"----------------------------
" Open and reload .vimrc or _gvimrc
if has('gui_running')
  nnoremap <Space>ve :<C-u>split $MYGVIMRC<CR>
  nnoremap <Space>vr :<C-u>source $MYGVIMRC<CR>
else
  nnoremap <Space>ve :<C-u>split $MYVIMRC<CR>
  nnoremap <Space>vr :<C-u>source $MYVIMRC<CR>
endif

nnoremap <silent> <Space>ow :<C-u>setl wrap! wrap?<CR>
nnoremap <silent> <Space>on :<C-u>setl number! number?<CR>
nnoremap <silent> <Space>op :<C-u>setl paste! paste?<CR>

"----------------------------
" Command-line mode keymappings:
"----------------------------
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
" <C-h>: delete char
cnoremap <C-h> <Del>
" <C-n>: next history
cnoremap <C-n> <Down>
" <C-p>: previous history
cnoremap <C-p> <Up>
" <C-k>, K: delete to end
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
" <C-y>: paste
cnoremap <C-y> <C-r>"

"----------------------------
" Basics
"----------------------------
" Enable Syntax
syntax on

" Colorscheme
colorscheme landscape

" Unset beep
set visualbell t_vb=

" Set Highlight Search
set hlsearch

" Set Backspace
set backspace=indent,eol,start

" Display Tab and Line end
set list
set listchars=tab:▸\ ,eol:¬

" Invisible character colors 
highlight NonText ctermfg=238 ctermbg=232
highlight SpecialKey ctermfg=238 ctermbg=232

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

" Yank to Clipboard
set clipboard+=unnamed

" Show Statusline
set laststatus=2

" For Go Lang
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif

"----------------------------
" Whitespace preferences
"----------------------------
if has("autocmd")
  filetype on
  autocmd BufRead,BufNewFile *.coffee set filetype=ruby
  autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
endif

