"
" VIM configurations
"
" Parts of this file taken from: http://amix.dk/vim/vimrc.html
" Additional color schemes from: http://www.vim.org/scripts/script.php?script_id=625
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load plugins first to ensure settings in this file are valid
source ~/.config/nvim/bundles.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","

set cursorline      " Current cursor line
set number

set ignorecase      " Ignore case when searching
set smartcase       " Smart case search if there is uppercase

" Spacing
set autoindent
set expandtab
set smarttab
set smartindent
set tabstop=2
set shiftwidth=2

" python doesn't use brackets, so smart indent is pointless
" also make the indentations wider so we can see
autocmd! FileType python set nosmartindent
autocmd FileType python setlocal shiftwidth=4 tabstop=4

autocmd BufNewFile,BufRead *.zcml set filetype=xml
autocmd BufNewFile,BufRead *.pt set filetype=html
autocmd BufNewFile,BufRead *.mako set filetype=mako
autocmd BufNewFile,BufRead *.md set filetype=markdown

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
" => vim-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show json quoting
set conceallevel=0
let g:vim_json_syntax_conceal=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoMake
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
"call neomake#configure#automake('nrwi', 500)
call neomake#configure#automake('w')

let g:neomake_html_enabled_makers = ['tidy']
let g:neomake_javascript_enabled_makers = ['eslint']
" Set local variable to the closest upwards node_modules
" Using 'g:' did not work because syntastic uses pwd of the opened directory
" that contains multiple sub-packages with their own eslintrc requirements
autocmd FileType javascript let b:neomake_javascript_eslint_exe=$PWD . '/' . finddir('node_modules', '.;') . '/.bin/eslint'
let g:neomake_python_checkers=['flake8']
let g:neomake_python_python_exe = '/usr/local/bin/python3'
let g:neomake_python_flake8_exe = '/usr/local/bin/flake8'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto start NERDTree (except when editing commit message)
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif

let NERDTreeIgnore=['\.o$', '\~$', '\.egg-info$', '\.pyc$', 'develop-eggs$', 'parts$', '__pycache__$', '\.DS_Store$', '\.git$', '\.class$', 'node_modules$']
"let NERDTreeShowHidden=1 " show hidden files by default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDSpaceDelims = 1       " Add spaces after comment delimiters by default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM Slime
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:slime_target = "tmux"
let g:slime_paste_file = tempname() " Using STDIN causes issues, unfortunately, so use a FILE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
