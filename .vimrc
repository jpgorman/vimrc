" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Jul 28
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

set number
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp

" spacing for tabs
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" Copying
" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" - Make sure to use single quotes

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prettier/vim-prettier'
Plug 'kiddos/malokai.vim'
Plug 'dikiaap/minimalist'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasiser/vim-code-dark'
Plug 'Valloric/YouCompleteMe'

" Initialize plugin system
call plug#end()

" colors
colorscheme codedark 

" aireline settings
let g:airline_theme = 'codedark'

" Prettier
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre,TextChanged,InsertLeave *.ts,*.tsx,*.js,*.jsx,*.css,*.scss,*.less PrettierAsync

" Fuzzy finder ctrl-p
set runtimepath^=~/.vim/plugged/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|__regression__|diff_output)|(\.(swp|ico|git|svn))$'

" Javascript libraries syntax highlighting
let g:used_javascript_libs = 'react,jquery'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1

function! FindReplace()
  call inputsave()
  let find = input('Enter thing to replace:')
  let replace = input('Enter replacement:')
  call inputrestore()
  execute '%s/'.find.'/'.replace.'/g'
endfunction

" remaps
nnoremap ,e :Exp<enter>
nnoremap ,w :w<enter>
nnoremap ,b :ls<CR>:buffer<Space>
nnoremap ,r :call FindReplace()<cr>
nnoremap ,d :bd<enter>

