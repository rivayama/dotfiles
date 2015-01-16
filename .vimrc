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
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-submode'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'takahirojin/gbr.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'amdt/vim-niji'

NeoBundleLazy 'toyamarinyon/vim-swift'
NeoBundleLazy 'sjl/gundo.vim'
NeoBundleLazy 'Shougo/vimproc', {
  \ 'build': {
    \ 'mac': 'make -f make_mac.mak',
    \ 'unix': 'make -f make_unix.mak',
  \ },
\ }

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
"NeoBundle 'junegunn/seoul256.vim'
"NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'rivayama/twiga.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

syntax on
colorscheme twiga

" My color setting
highlight Normal ctermbg=none
highlight NonText ctermfg=238 ctermbg=232
highlight SpecialKey ctermfg=238 ctermbg=232

"----------------------------
" Plugius
"----------------------------
" Vim-QuickRun
nnoremap <Space>qr :<C-u>QuickRun<CR>
let g:quickrun_config = {
  \'_': {
    \ 'runner': 'vimproc',
    \ 'split': 'vertical',
    \ 'outputter/buffer/close_on_empty': 1,
  \ },
\ }

" Vim-fugitive
nnoremap <Space>gs :<C-u>Gstatus<CR>
nnoremap <Space>gl :<C-u>Glog --<CR>
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

" Unite-outline
nnoremap <Space>uo :<C-u>Unite -vertical -no-quit -winwidth=40 outline<Return>

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
nnoremap <silent> <Esc><Esc> :<C-u>setl hlsearch! hlsearch?<Return>

let mapleader = "t"
nnoremap <silent> <Leader>e :<C-u>tabedit .tmp<CR>
nnoremap <silent> <Leader>c :<C-u>tabclose<CR>
nnoremap <silent> <Leader>n :<C-u>tabnext<CR>
nnoremap <silent> <Leader>p :<C-u>tabprevious<CR>

" Keep cursor position after add/remove an indent
nnoremap >> :<C-u>><CR><C-o>
nnoremap << :<C-u><<CR><C-o>

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
set splitright

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

" Rename or copy file
function! s:move(file, act) 
  let file = a:file
  let act = a:act
  if file !~# '/'
    let file = expand('%:h') . '/' . file 
  endif
  if filereadable(file)
    echo '"' . file . '"is already exists. Overwrite? [y/N]' 
    if getchar() !=? 'y'
      echo "Aborted..."
      return
    endif
  endif
  let dir = fnamemodify(file, ':h')
  if !isdirectory(dir)
    call mkdir(dir, 'p') 
  endif
  execute 'saveas ' . file 
  if act ==# 'mv' 
    call delete(expand('#'))
  endif
endfunction
command! -nargs=1 -complete=file CopyFile call s:move(<q-args>, 'cp')
command! -nargs=1 -complete=file MoveFile call s:move(<q-args>, 'mv')
nnoremap <Space>cp :<C-u>CopyFile<Space>
nnoremap <Space>mv :<C-u>MoveFile<Space>

" Use better diff
set diffexpr=MyDiff()
function! MyDiff()
  let opt = ""
  if &diffopt =~ "iwhite"
    let opt = opt . "-b "
  endif
  silent execute "!~/.vim/git-diff-normal-format " . opt . v:fname_in . " " . v:fname_new . " > " . v:fname_out
  redraw!
endfunction

" vimgrep
set grepprg=grep\ -nri\ --exclude-dir=.svn\ --exclude-dir=.git
autocmd QuickFixCmdPost grep cwindow

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
