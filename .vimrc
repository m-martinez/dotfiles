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

let NERDTreeIgnore=['\.o$', '\~$', '\.egg-info$', '\.pyc$', 'develop-eggs$', 'bin$', 'parts$']

" do not show hidden files by default
let NERDTreeShowHidden=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist preferences
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50

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
autocmd FileType mako,html,xml setlocal shiftwidth=2 tabstop=2

autocmd BufNewFile,BufRead *.zcml set filetype=xml
autocmd BufNewFile,BufRead *.pt set filetype=html
autocmd BufNewFile,BufRead *.mako set filetype=mako

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
set nowrap
set nolist " list disables line break
set textwidth=500
set wrapmargin=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

set shell=/bin/zsh

if has("gui_running")
  set gfn=Inconsolata:h14
endif

set background=dark
colorscheme grb256

set encoding=utf8
try
  lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" turn off file backup, that's what git is for
set nobackup
set nowb
set noswapfile
