"----------- Vundle Plugin -----------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'vim-scripts/Mark--Karkat'
Plugin 'vim-scripts/Tabmerge'
"Plugin 'vim-scripts/CCTree'
"Plugin 'vim-scripts/Conque-GDB'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'python-mode/python-mode'
"Plugin 'vim-scripts/CCTree'
"Plugin 'ervandew/supertab'

" Highlights
Plugin 'nathanalderson/yang.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" ColorSchemes
Plugin 'sjl/badwolf'
Plugin 'morhetz/gruvbox'
Plugin 'vim-scripts/pyte'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rakr/vim-one'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'elzr/vim-json'
Plugin 'xolox/vim-colorscheme-switcher' "change color schemes with <F8> & <Shift-F8> keys
Plugin 'xolox/vim-misc' "needed by vim-colorscheme-switcher
Plugin 'mfukar/robotframework-vim' 

" Games
Plugin 'uguu-org/vim-matrix-screensaver'
Plugin 'vim-scripts/TeTrIs.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

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

"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_max_files = 0
"let g:ctrlp_user_command = ['.svn/','cat %s/cscope.files']
"
set tags=$NG_ROOT/tags,tags; " tell Vim where to find your tags
"set tags=tags;/

" Status Line {
    set laststatus=2            " display the status line always
    set statusline=
    set statusline+=%f\:        " filename
    set statusline+=%l          " line number
    set statusline+=(%L)\       " total lines
    set statusline+=%P\         " percent through file
    set statusline+=%m\         " modified flag
    set statusline+=%r\         " read only flag
    set statusline+=buffer\:%-10.3n\    " buffer number
"}
set cursorline    " highlight cursor line
set number        " always show line numbers
set showmatch     " show the matching part of the pair for [] {} and ()

" Tabs
set tabstop=4     " a tab is 4 spaces
set expandtab     " expand tabs into spaces: Enter <tabstop> spaces when pressing <TAB> key
set shiftwidth=4  " when using the >> or << commands, shift lines by 4 spaces
set softtabstop=4
set autoindent

set fileformat=unix
set ignorecase    " ignore case when searching
set incsearch     " incremental search (start search while typing)
set hlsearch      " highlights search text
set showcmd       " count lines in Visual Mode
set mouse=a       " enable using the mouse if terminal emulator
"set paste         " identation corected paste from clipboard
"set nocscopetag
"set hidden        " becomes hidden when it is abandoned.
"set t_ti=""      " NO!!! very dangerus comand
set foldmethod=syntax " fold functions on 1st level if its opening brace on first column
set foldnestmax=2
"set foldlevelstart=1 " apo pou na ksekinisi to folding
set nobuflisted   "prevent a buffer from being added to the buffer list

" it skata kanoun auta?
set showmode      " always show what mode we're currently editing in
set clipboard=unnamed           " normal OS clipboard interaction
"set ttymouse=xterm2

au BufNewFile,BufRead *.py 
	\ set foldmethod=indent |
	\ set foldlevel=1 |
	\ set textwidth=79

let mapleader=","

colorscheme badwolf

"nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-k> <C-W>k

"map <C-]> g] " list tags(not jump imediatly


"open a NERDTree automatically when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" \-a grep the word to current dir
nnoremap <leader>a :silent execute "grep! -R --include=\*.{c,cpp,h,py} --exclude-dir=./SS_6WIND* " . shellescape('<cword>') .  " ."<cr>:copen 12<cr>:redraw!<cr>
nnoremap <leader>A :silent execute "grep! -R --include=\*.{c,cpp,h,py} --exclude-dir=./SS_6WIND* " . shellescape('<cWORD>') .  " ."<cr>:copen 12<cr>:redraw!<cr>


"" opens search results in a window w/ links and highlight the matches
"command! -nargs=+ Grep execute 'silent grep! -I -r -n --exclude *.{json} . -e <args>' | copen | execute 'silent /<args>'
"
"" Check if NERDTree is open or active
"function! rc:isNERDTreeOpen()        
"  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction
"
"" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
"" file, and we're not in vimdiff
"function! rc:syncTree()
"  if &modifiable && rc:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeFind
"    wincmd p
"  endif
"endfunction
"
"" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call rc:syncTree()

set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
"source ~/.vimrc

    if has('nvim')
        tnoremap <Esc> <C-\><C-n>
    endif
