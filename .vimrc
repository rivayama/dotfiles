if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('kien/ctrlp.vim')
call dein#add('rking/ag.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-rhubarb')
call dein#add('tpope/vim-dispatch')
call dein#add('thoughtbot/vim-rspec')
call dein#add('scrooloose/nerdtree')
call dein#add('kana/vim-submode')
call dein#add('chrisbra/vim-diff-enhanced')
call dein#add('junegunn/vim-easy-align')
call dein#add('tomtom/tcomment_vim')
call dein#add('itchyny/lightline.vim')
call dein#add('rivayama/twiga.vim')
call dein#add('nanotech/jellybeans.vim')
call dein#add('mxw/vim-jsx')
call dein#end()

syntax on
colorscheme twiga

"----------------------------
" Plugius
"----------------------------
" Vim-fugitive
nnoremap <Space>gs :<C-u>Gstatus<CR>
nnoremap <Space>gb :<C-u>Gbrowse<CR>
nnoremap <Space>gw :<C-u>Gwrite<CR>
nnoremap <Space>gl :<C-u>Glog --<CR>
nnoremap <Space>gp :<C-u>Git push origin --no-verify<CR>
autocmd QuickFixCmdPost *grep* cwindow

" lightline.vim
let g:lightline = {
  \ 'colorscheme': 'twiga',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'fugitive': '%{exists("*fugitive#head")?"\ue0a0 ".fugitive#head():""}',
  \ },
  \ 'component_visible_condition': {
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
  \ },
  \ 'separator':    { 'left': "\ue0b0", 'right': "\ue0b2" },
  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
\ }
call twiga#lightline()

" Ctrl-p
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra' 
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)

" NERD Tree
map <C-n> :NERDTreeToggle<CR>

" vim-rspec
let g:rspec_command = "Dispatch bundle exec rspec {spec}"
nmap <silent><leader>f :call RunCurrentSpecFile()<CR>
nmap <silent><leader>c :call RunNearestSpec()<CR>
nmap <silent><leader>l :call RunLastSpec()<CR>

nnoremap <silent><Space>] :<C-u>vertical resize +30<CR>
nnoremap <silent><Space>[ :<C-u>vertical resize -30<CR>

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
  nnoremap <Space>ve :<C-u>vsplit $MYVIMRC<CR>
  nnoremap <Space>vr :<C-u>source $MYVIMRC<CR>
endif

nnoremap <Space>p :CtrlP ./

nnoremap <silent> <Space>oc :<C-u>set number! list!<CR>
nnoremap <silent> <Space>ow :<C-u>setl wrap! wrap?<CR>
nnoremap <silent> <Space>on :<C-u>setl number! number?<CR>
nnoremap <silent> <Space>op :<C-u>setl paste! paste?<CR>
nnoremap <silent> <Space>oe :<C-u>setl expandtab! expandtab?<CR>
nnoremap <silent> <Esc><Esc> :<C-u>nohl<CR>

let mapleader = "t"
nnoremap <silent> <Leader>e :<C-u>tabedit .tmp<CR>
nnoremap <silent> <Leader>c :<C-u>tabclose<CR>
nnoremap <silent> <Leader>n :<C-u>tabnext<CR>
nnoremap <silent> <Leader>p :<C-u>tabprevious<CR>

nnoremap <C-]> g<C-]>
nnoremap <C-[> :pop<CR>

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
cnoremap <C-y> <C-r>

" Indentation
nnoremap <silent> <Space>t2 :<C-u>setl tabstop=2 softtabstop=2 shiftwidth=2<CR>
nnoremap <silent> <Space>t4 :<C-u>setl tabstop=4 softtabstop=4 shiftwidth=4<CR>
nnoremap <silent> <Space>t8 :<C-u>setl tabstop=8 softtabstop=8 shiftwidth=8<CR>

"----------------------------
" Basics
"----------------------------
" Preferences
set visualbell t_vb=
set number
set nowrap
set autoindent
set splitright
" set ambiwidth=double

filetype plugin indent on

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
    if nr2char(getchar()) !=? 'y'
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

" vimgrep
set grepprg=grep\ -nri\ --exclude-dir=.svn\ --exclude-dir=.git
autocmd QuickFixCmdPost grep cwindow

"----------------------------
" Whitespace preferences
"----------------------------
if has("autocmd")
  filetype on
  autocmd BufRead,BufNewFile *.coffee set filetype=ruby
  autocmd BufRead,BufNewFile *.slim set filetype=ruby
  autocmd BufRead,BufNewFile *.json set filetype=javascript
  autocmd BufRead,BufNewFile *.ts set filetype=javascript
  autocmd BufRead,BufNewFile *.tsx set filetype=javascript
  autocmd BufRead,BufNewFile *.conf set filetype=conf
  autocmd BufRead,BufNewFile *.hbs set filetype=html
  autocmd BufRead,BufNewFile *.liquid set filetype=yaml
  autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType scheme setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType xhtml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType swift setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 noexpandtab
endif
