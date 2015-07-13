set nocompatible              " be iMproved, required
set laststatus=2
set t_Co=256

let g:ycm_global_ycm_extra_conf = '~/dev/.ycm_extra_conf.py'

inoremap  zz <c-o>:u<cr>
inoremap <F5> <c-o>:w<cr>

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'gmarik/Vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'

call vundle#end()            " required
filetype plugin indent on    " required

