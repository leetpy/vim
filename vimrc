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
Plugin 'kien/ctrlp.vim'
Plugin 'taglist'

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
colorscheme monokai


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
set colorcolumn=80  " line length marker
set cmdheight=1     " height of cmd line (how many lines)
set nobackup        " don't produce backup file
set noswapfile      " don't produce swap file
set ignorecase      " ignore case when searching
set showmatch       
set ruler           " show where mouse is
set cursorline      " highlight current line
let mapleader=","
set pastetoggle=<F9> 
set mouse=v         " availabe: a, v, i
set backspace=indent,eol,start
filetype plugin on
filetype on

""""""""""""""""""""""""""""""""
" toggle number
""""""""""""""""""""""""""""""""
nmap <Leader>n :set invnumber<CR>

""""""""""""""""""""""""""""""""
" toggle mouse
""""""""""""""""""""""""""""""""
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

map <Leader>m :call ToggleMouse()<CR>

""""""""""""""""""""""""""""""""
" needtree setting
""""""""""""""""""""""""""""""""
map <F3> :NERDTreeToggle<CR>
set laststatus=2    " location of status information
set statusline=%F\ [FORMAT:%{&ff}]\ [LINE:%l(%p%%)-COL:%v(%c)]\ \ %m%r\
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""""
" split
""""""""""""""""""""""""""""""""
map sp :split<CR>
map vp :vsplit<CR>
map <TAB> <c-w><c-w>
map <Leader>w <c-w>w<CR>
map <Leader>q :q<CR>
map <Leader>qo :only<CR>


""""""""""""""""""""""""""""""""
" taglist 
""""""""""""""""""""""""""""""""
map <F2> :Tlist<CR>
let Tlist_Use_Right_Window =1
let Tlist_Exit_OnlyWindow = 1


""""""""""""""""""""""""""""""""
" golang setting
""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
autocmd BufWritePre *.go :GoFmt
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
au FileType go nmap <Leader>g <Plug>(go-def)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

""""""""""""""""""""""""""""""""
" build 
""""""""""""""""""""""""""""""""
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype go nnoremap <F4> :w <bar> exec '!go run '.shellescape('%')<CR>
autocmd filetype sh nnoremap <F4> :w <bar> exec '!sh '.shellescape('%')<CR>
autocmd filetype rst nnoremap <F4> :w <bar> exec '!make clean;make html '<CR>
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

""""""""""""""""""""""""""""""""
" templeate files
""""""""""""""""""""""""""""""""
autocmd BufNewFile *.go 0r ~/.vim/template/go.tpl  " golang
autocmd BufNewFile *.py 0r ~/.vim/template/py.tpl  " python
autocmd BufNewFile *.sh 0r ~/.vim/template.sh.tpl  " shell


if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
