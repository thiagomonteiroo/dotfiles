syntax enable

set guicursor=i:block    
set autoindent
set inccommand=split
set modifiable
set hlsearch incsearch ignorecase smartcase
set cursorline
set encoding=utf-8
set relativenumber
set nocompatible
set scrolloff=8
set backspace=indent,eol,start
set tabstop=4
set expandtab smarttab
set shiftwidth=4
set laststatus=2
set showmatch
set noerrorbells
set autowrite
set nowrap
set nobackup
set showmode showcmd
set smartindent
set number
set t_Co=256

let mapleader="\<space>"
nnoremap <leader>f :Telescope file_browser<cr>  
nnoremap <leader>; A;<esc>  

if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
call plug#end()

set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='dark'

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#CursorColumn#
set statusline+=\ %F
set statusline+=\ %m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\|%{&fileformat}
set statusline+=\ %p%%
set statusline+=\ %l:%c
