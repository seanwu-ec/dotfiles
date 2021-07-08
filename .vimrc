set t_Co=256
set nocompatible
filetype off
set number
set incsearch
set hlsearch
set ruler
set showmatch

set ignorecase
set smartcase

syntax on

" Vundle stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'preservim/nerdtree'
Plugin 'google/vim-searchindex'
Plugin 'airblade/vim-gitgutter'

call vundle#end()     
filetype plugin indent on 

" vim-plug
"call plug#begin('~/.vim/plugged')

"Plug 'vim-airline/vim-airline'
"Plug 'majutsushi/tagbar'

"call plug#end()


nmap <F8> :TagbarToggle<CR>
nmap <F9> :Files<CR>
nnoremap <F5> :match StatusLineTerm /<C-R><C-W>/<CR>
nmap ,n :NERDTreeFind<CR>

"colorscheme darkblue
colorscheme gruvbox
set background=dark


"colorscheme molokai 
"let g:molokai_original = 1
"let g:rehash256 = 1

