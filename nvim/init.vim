" Turn the syntax highlight on
syntax on

" Set tabstop and shit
set expandtab 
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Keybinds
nnoremap <leader>e :Ex<CR>
tnoremap <Esc><Esc> <C-\><C-n>

" Always open terminal in a horizontal split at the **bottom**
command! BT :botright split | resize 10 | terminal

" Open terminal on the right side
command! RT :rightbelow vsplit | vertical resize 40 | terminal

" Start terminal in insert mode automatically
autocmd TermOpen * startinsert

" Set copy to clipboard for nvim
set clipboard+=unnamedplus

" Set indent settings
set autoindent
set smartindent

" Set colorscheme
colorscheme habamax

" Turn off the auto-add comment signature
set formatoptions-=ro

" Set color
set termguicolors

" set the mouse
set mouse=a 

" Turn the line number on
set number

" Disable compatibility with vi
set nocompatible 

" Enable filetype detection 
filetype on 
filetype plugin on 
filetype indent on 

" Search down into subfolder
" Provides tabs-completion for all file related-tasks
set path+=**

" Display all matching files when tab complete
set wildmenu 

" Display status bar
set laststatus=2

" Automatically wrap text that extends beyond the screen
set wrap

" Set encoding to a particular type
set encoding=utf-8

