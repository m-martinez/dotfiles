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
set tabstop=4
set shiftwidth=4

" Use system clipboard (on MacOS)
set clipboard=unnamed

" this is more annoying than helpful
set nosmartindent

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
" Don't try to align with the open parenthesis
let g:pyindent_open_paren = 4

autocmd BufNewFile,BufRead *.zcml set filetype=xml
autocmd BufNewFile,BufRead *.pt set filetype=html
autocmd BufNewFile,BufRead *.mako set filetype=mako
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.mjs set filetype=javascript

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell Checking & Gammar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set spell spelllang=en_us
" set complete+=kspell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

set shell=/bin/zsh

if has("gui_running")
  set gfn=Inconsolata:h14
endif

set t_Co=256
set t_ut=
set background=dark
if &diff
  colorscheme jellybeans
else
  colorscheme codedark
endif

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
" => NeoMake - Used for asyncronously running linters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('w')

let g:neomake_html_enabled_makers = ['tidy']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_typescript_enabled_makers = ['tsc', 'eslint']
let g:neomake_typescript_tsc_exe = $PWD .'/node_modules/.bin/tsc'
let g:neomake_typescript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

" Setup a virtual environment specifically for neovim
" see: https://neovim.io/doc/user/provider.html
" see: https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#using-virtual-environments
let g:python3_host_prog = "~/.pyenv/versions/py39nvim/bin/python"

" Activate virtual env for project to make this work
let g:neomake_python_enabled_makers = ['flake8', 'mypy']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Poetv - Allows dynamic setting of Poetry virtualenv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:poetv_auto_activate = 1
let g:poetv_executables = ["poetry"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree - Directory listing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.o$', '\~$', '\.egg-info$', '\.pyc$', 'develop-eggs$', 'parts$', '__pycache__$', '\.DS_Store$', '\.git$', '\.class$', 'node_modules$']
let NERDTreeShowHidden=1 " show hidden files by default

" auto start NERDTree when vim is started with no command line arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDCommenter - Bulk commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDSpaceDelims = 1       " Add spaces after comment delimiters by default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM Slime - Output commands to another tmux panel
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:slime_target = "tmux"
let g:slime_paste_file = tempname() " Using STDIN causes issues, unfortunately, so use a FILE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabular - Aligns variable assignment visually
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctrl-P - Similar to Viscode's <cmd>-P to quickly lookup files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --smart-case'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_regexp = 1
endif
set wildignore+=*/.git/*,*/tmp/*,*.swp
