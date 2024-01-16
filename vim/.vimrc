let mapleader = " "

syntax on

nnoremap <leader>s :w<CR>
nnoremap <leader>qf :q!<CR>
nnoremap <leader>sq :wq<CR>
nnoremap <leader>e :Explore<CR>

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

set number
set si
set ai
set shiftwidth=4

filetype plugin indent on
filetype indent on
