let mapleader = " "

syntax on

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :Explore<CR>

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

set rnu 
set si
set ai
set shiftwidth=4

filetype plugin indent on
filetype indent on
