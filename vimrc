set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'} " golang
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-commentary'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""""""
" theme
""""""""""""""""""""""""""""""""
syntax enable
colorscheme molokai


""""""""""""""""""""""""""""""""
" encoding
""""""""""""""""""""""""""""""""
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8


""""""""""""""""""""""""""""""""
" customer
""""""""""""""""""""""""""""""""
set nu              " show number of line
set numberwidth=4   " width of line number
set ts=4            " tab 4 space
set tabstop=4
set shiftwidth=4
set expandtab
set cmdheight=1     " height of cmd line (how many lines)
set nobackup        " don't produce backup file
set noswapfile      " don't produce swap file
set ignorecase      " ignore case when searching
set showmatch       
set ruler           " show where mouse is
set cursorline      " highlight current line
let mapleader=","
set pastetoggle=<F9> 
set backspace=indent,eol,start
set mouse=i
filetype plugin on
filetype on

""""""""""""""""""""""""""""""""
" needtree setting
""""""""""""""""""""""""""""""""
set laststatus=2    " location of status information
set statusline=%F\ [FORMAT:%{&ff}]\ [LINE:%l(%p%%)-COL:%v(%c)]\ \ %m%r\

""""""""""""""""""""""""""""""""
" needtree setting
""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""
" split
""""""""""""""""""""""""""""""""
map <Leader>sp :split<CR>
map <Leader>w <c-w>w<CR>
map <Leader>q :q<CR>


""""""""""""""""""""""""""""""""
" golang setting
""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
autocmd BufWritePre *.go :GoFmt
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
au FileType go nmap <Leader>g <Plug>(go-def)

""""""""""""""""""""""""""""""""
" templeate files
""""""""""""""""""""""""""""""""
autocmd BufNewFile *.go 0r ~/.vim/template/go.tpl  " golang
autocmd BufNewFile *.py 0r ~/.vim/template/py.tpl  " python
