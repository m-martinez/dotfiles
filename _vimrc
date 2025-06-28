"
" VIM configurations
"
" Parts of this file taken from: http://amix.dk/vim/vimrc.html
" Additional color schemes from: http://www.vim.org/scripts/script.php?script_id=625
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","

set cursorline      " Current cursor line
set number
set ruler

set ignorecase      " Ignore case when searching
set smartcase       " Smart case search if there is uppercase

" Spacing
set autoindent
set expandtab
set smarttab
set smartindent
set tabstop=4
set shiftwidth=4

" Use system clipboard (on MacOS)
set clipboard=unnamed

" this is more annoying than helpful
set nosmartindent

" Enable bracketed mode so that paste is auto-toggled
" https://vi.stackexchange.com/a/25315
if &t_BE == ''
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    let &t_PS = "\e[200~"
    let &t_PE = "\e[201~"
endif

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

set shell=/bin/zsh

set t_Co=256
set t_ut=
set background=dark

colorscheme codedark

set encoding=utf8
try
  lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell Checking & Gammar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set spell spelllang=en_us
set complete+=kspell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: editorconfig-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

packadd! editorconfig

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: vim-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show json quoting
set conceallevel=0
let g:vim_json_syntax_conceal=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_python_auto_uv = 1

let g:ale_linters = { 'python': ['mypy', 'pylint', 'ruff'], }
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['ruff_format'], }

autocmd ColorScheme * highlight ALEVirtualTextError Error
autocmd ColorScheme * highlight ALEVirtualTextWarning Warning


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: NERDTree - Directory listing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.swp$', '\.o$', '\~$', '\.egg-info$', '\.pyc$', 'develop-eggs$', 'parts$', '__pycache__$', '\.DS_Store$', '\.git$', '\.class$', 'node_modules$']
let NERDTreeShowHidden=1 " show hidden files by default

" auto start NERDTree when vim is started with no command line arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: NERDCommenter - Bulk commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDSpaceDelims = 1       " Add spaces after comment delimiters by default


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: VIM Slime - Output commands to another tmux panel
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:slime_target = "tmux"
let g:slime_paste_file = tempname() " Using STDIN causes issues, unfortunately, so use a FILE


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: Tabular - Aligns variable assignment visually
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
