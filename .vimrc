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
NeoBundleLazy 'Shougo/vimproc', {
  \ 'build': {
    \ 'mac': 'make -f make_mac.mak',
    \ 'unix': 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-surround'
NeoBundleLazy 'toyamarinyon/vim-swift'
NeoBundleLazy 'sjl/gundo.vim'
NeoBundle 'kana/vim-submode'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'takahirojin/gbr.vim'

" Colorschemes
"NeoBundle 'flazz/vim-colorschemes'
"NeoBundle 'croaker/mustang-vim'
"NeoBundle 'hickop/vim-hickop-colors'
"NeoBundle 'AlxHnr/clear_colors'
"NeoBundle 'sk1418/last256'
"NeoBundle 'Tuurlijk/typofree.vim'
"NeoBundle 'depuracao/vim-darkdevel'
"NeoBundle 'toupeira/vim-desertink'
"NeoBundle 'dsolstad/vim-wombat256i'
"NeoBundle 'w0ng/vim-hybrid'
"NeoBundle 'tomasr/molokai'
"NeoBundle 'romainl/Apprentice'
"NeoBundle 'itchyny/landscape.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'rivayama/twiga.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

syntax on
colorscheme twiga
highlight Normal ctermbg=none
highlight NonText ctermfg=238 ctermbg=232
highlight SpecialKey ctermfg=238 ctermbg=232

"----------------------------
" Plugius
"----------------------------
" Vim-QuickRun
set splitright
let g:quickrun_config = {
  \'_': {
    \ 'runner': 'vimproc',
    \ 'split': 'vertical',
    \ 'outputter/buffer/close_on_empty': 1,
  \ },
  \ 'phpunit': {
    \ 'outputter': 'phpunit',
    \ 'command': 'phpunit',
    \ 'exec': '%c %o %s',
  \ },
  \ 'swift': {
    \ 'command': 'swift',
    \ 'cmdopt': '-sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -i',
  \ }
\ }
nnoremap <Space>qr :<C-u>QuickRun<CR>

" Vim-fugitive
nnoremap <Space>gs :<C-u>Gstatus<CR>
nnoremap <Space>gd :<C-u>Gdiff<CR>
nnoremap <Space>ga :<C-u>Gwrite<CR>
nnoremap <Space>gc :<C-u>Gcommit<CR>
nnoremap <Space>gp :<C-u>Git push origin<CR>
autocmd QuickFixCmdPost *grep* cwindow

" lightline.vim
let g:lightline = {
  \ 'colorscheme': 'twiga',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
  \ },
  \ 'component_visible_condition': {
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
  \ },
\ }

" Ctrl-p
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra' 
nnoremap <Space>p :<C-u>CtrlPBookmarkDir<CR>
nnoremap <Space>pa :<C-u>CtrlPBookmarkDirAdd

" Gundo.vim
nnoremap <Space>gu :GundoToggle<CR>

" vim-submode
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>+')
call submode#map('winsize', 'n', '', '-', '<C-w>-')

"----------------------------
" Key-mapping
"----------------------------
" Open and reload .vimrc or .gvimrc
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

let mapleader = "t"
nnoremap <silent> <Leader>e :<C-u>tabedit tmp<CR>
nnoremap <silent> <Leader>c :<C-u>tabclose<CR>
nnoremap <silent> <Leader>n :<C-u>tabnext<CR>
nnoremap <silent> <Leader>p :<C-u>tabprevious<CR>

" Command-line mode:
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
cnoremap <C-y> <C-r>"

"----------------------------
" Basics
"----------------------------
" Preferences
set visualbell t_vb=
set number
set nowrap
set autoindent

set hlsearch
set ignorecase

set fdm=marker
set backspace=indent,eol,start
set clipboard+=unnamed
set noswapfile

" Show Invisibles
set list
set listchars=tab:▸\ ,eol:¬

" Tab Setting
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" File Encoding and dafaults
set fileencodings=utf-8,cp932,euc-jp
set fileformats=unix,dos
set encoding=utf-8
set fileformat=unix

" Stop HTML Auto Indent
if has("autocmd")
  autocmd FileType html set indentexpr&
  autocmd FileType xhtml set indentexpr&
endif

" Show Statusline
set laststatus=2

" For Go Lang
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif

" rename current file
function! RenameFile(...)
  let s:copy = 0
  let s:file_name = a:1
  if a:1 =~ '-c' 
    let s:copy = 1
    let s:file_name = a:2
  endif
  let s:file_path = expand('%:h')
  exec ":file " . s:file_path . '/' . s:file_name
  if s:copy != 1 
    exec ":w"
    call delete(expand('#'))
  endif
endfunction
command! -nargs=+ Rename call RenameFile(<f-args>)
nnoremap <Space>mv :<C-u>Rename<Space>
nnoremap <Space>cp :<C-u>Rename -c<Space>

" diff
set diffexpr=MyDiff()
function! MyDiff()
  let opt = ""
  if &diffopt =~ "iwhite"
    let opt = opt . "-b "
  endif
  silent execute "!~/.vim/git-diff-normal-format " . opt . v:fname_in . " " . v:fname_new . " > " . v:fname_out
  redraw!
endfunction

"----------------------------
" Whitespace preferences
"----------------------------
if has("autocmd")
  filetype on
  autocmd BufRead,BufNewFile *.coffee set filetype=ruby
  autocmd BufRead,BufNewFile *.json set filetype=javascript
  autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType xhtml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType scss setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType swift setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
endif

