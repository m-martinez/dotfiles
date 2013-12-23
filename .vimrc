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

let NERDTreeIgnore=['\.o$', '\~$', '\.egg-info$', '\.pyc$', 'develop-eggs$', 'bin$', 'parts$', '__pycache__$']

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
set tabstop=2
set shiftwidth=2

autocmd BufNewFile,BufRead *.zcml set filetype=xml
autocmd BufNewFile,BufRead *.pt set filetype=html
autocmd BufNewFile,BufRead *.mako set filetype=mako

" python doesn't use brackets, so smart indent is pointless
" also make the indentations wider so we can see
autocmd! FileType python set nosmartindent
autocmd FileType python setlocal shiftwidth=4 tabstop=4

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
set textwidth=0
set wrapmargin=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

set t_Co=256

set shell=/bin/zsh

if has("gui_running")
  set gfn=Inconsolata:h14
endif

set background=dark
colorscheme jellybeans

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM Slime peferences
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:slime_target = "tmux"

" Using STDIN causes issues, unfortunately, so use a FILE
let g:slime_paste_file = tempname()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabular preferences
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

let g:syntastic_python_checkers=['flake8']
