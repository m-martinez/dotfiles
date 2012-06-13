runtime bundle/vim-pathogen/autoload/pathogen.vim

"
" Parts of this file taken from: http://amix.dk/vim/vimrc.html
" Additional color schemes from: http://www.vim.org/scripts/script.php?script_id=625

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree preferences
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDTreeIgnore=['\.o$', '\~$', '\.egg-info$', '\.pyc$']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't try to be vi
set nocompatible

set ruler
set cursorline
set number

" Default spacing
set autoindent
set expandtab
set smarttab
set smartindent
set tabstop=4
set shiftwidth=4

" Exception for indeing is xml/html, since it can get unwieldly
autocmd FileType html,xml setlocal shiftwidth=2 tabstop=2

" Enfore 80 characters (still want to see 80th character)
set winwidth=80
"set colorcolumn=80

autocmd BufNewFile,BufRead *.zcml set filetype=xml
autocmd BufNewFile,BufRead *.pt set filetype=xml

" Strip  whitespace
autocmd BufWritePre * :%s/\s\+$//e

let mapleader = ","

" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=2 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Wrapping
set wrap
set linebreak
set nolist " list disables line break
set textwidth=0
set wrapmargin=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable "Enable syntax hl

set gfn=Menlo:h14
set shell=/bin/bash

colorscheme lucius

set encoding=utf8
try
  lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile
