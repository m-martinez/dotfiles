"
" Vundle bundles
"
" These are here separately to avoid VIM runtime issues becasue the plugins
" wouldn't exist in the first place.  This file will be loaded in the main
" VIM configuration, but this file will be used via the installation process.
"
" More information about Vundle:
"   https://github.com/VundleVim/Vundle.vim
"
" In regards to keeping separate configuration files:
"   http://www.gmarik.info/blog/2011/chicken-or-egg-dilemma/
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.local/share/nvim/bundle/Vundle.vim
call vundle#begin('~/.local/share/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Run asynchronous programs (e.g. linting, syntax checking)
Plugin 'neomake/neomake'

" Themes
Plugin 'tomasiser/vim-code-dark'
Plugin 'nanotech/jellybeans.vim'

" Editor-like functionality
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'preservim/nerdcommenter'
Plugin 'vim-scripts/taglist.vim'
Plugin 'jpalardy/vim-slime'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'

" Syntax checking
Plugin 'editorconfig/editorconfig-vim'

" Syntax highlighting
" CSS
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'

" Python
Plugin 'vim-scripts/mako.vim'
Plugin 'vim-scripts/VST'
Plugin 'petobens/poet-v'
Plugin 'cespare/vim-toml'

" Javascript
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'jparise/vim-graphql'
Plugin 'mxw/vim-jsx'

" Databases
Plugin 'exu/pgsql.vim'

" Scala
Plugin 'derekwyatt/vim-scala'

" PHP
Plugin 'StanAngeloff/php.vim'

" Neo4j
Plugin 'neo4j-contrib/cypher-vim-syntax'

" Terraform
Plugin 'hashivim/vim-terraform'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
