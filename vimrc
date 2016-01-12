"" ==============================
"" Monte-Python IDE .vimrc config
"" ==============================

"" Plugin management
"" =================
filetype off " Temporary
set rtp +=~/.vim/bundle/Vundle.vim " Runtime path
call vundle#begin()
  " List all plugins
  Plugin 'VundleVim/Vundle.vim', {'pinned': 1} 
  Plugin 'The-NERD-tree'
  Plugin 'Syntastic'
  Plugin 'ervandew/supertab'
call vundle#end()

"" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

"" Python tabs and linewidth
"" =========================
set tabstop=4      "Makes a tab equal to four spaces (python standard)
set expandtab     "Makes the tab key insert {tabstop} spaces
set softtabstop=4  " insert/delete 4 spaces when hitting TAB/BS
set shiftwidth=4  " Operation >>/<< indents/deindents 4 columns
set shiftround  " round indent to multiples of 'shiftwidth'
set autoindent  " align new line with previous line indent

"" Alter global settings
"" =====================
set nowrap
set ruler
syntax on             " Text coloring based on syntax
filetype on  " Have VIM recognize filetypes
filetype plugin on  " Enable filetype based plugins
filetype indent on " Enable indentation by filetype

set number  " Turns on line numbers by default
"set mouse=a " Allow mouse interactions with the window
"set ttymouse=xterm " Fix rh7 mouse bug
"set clipboard=unnamed  " Make copy/paste work from/to VIM work
set bs=2 " Fix backspace setting
"set wildmenu " Show autocomplete options in command box
set pastetoggle=<F5> " Use F5 to turn on paste mode (disables autoindent)
set statusline=%F%m%r%h%w\ (%Y)\ Column:%v\ \ Line:%l/%L
set laststatus=2 " Always show status bar

"" Better searching
set hlsearch  " Highlight search results
set incsearch " Search as you type
set ignorecase " Ignore case
set smartcase

"" Colorscheme/appearance
hi normal ctermfg=white ctermbg=black
hi Comment ctermfg=grey ctermbg=black


"" Custom key-bindings with custom mapleader
"" =========================================
map <space> <leader>

"" Alter Normal mode VIM commands
nnoremap <leader>q :qa!<CR>
"" Tabs
nnoremap <leader>t :tabe
nnoremap <leader><PageUp> :tabn<CR>
nnoremap <leader><PageDown> :tabp<CR>
"" New Splits
nnoremap <leader>s :vsp<CR>
nnoremap <leader>x :sp<CR>
"" Window motion
nnoremap <leader><down> <c-w>j
nnoremap <leader><up> <c-w>k
nnoremap <leader><right> <c-w>l
nnoremap <leader><left> <c-w>h
""Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv
"" Map sort function to key
vnoremap <leader>s :sort<CR>


"" File type specific settings
"" ===========================
"" Recognize .mpy files as python syntax
au BufRead,BufNewFile *.mpy set filetype=mpython    " Make it recognize .mpy files as python
au FileType mpython setlocal syntax=python

"" Python
au FileType python set number
au FileType python set foldmethod=indent  " Turn on code-folding with everything pre-folded
au FileType python set foldlevel=99 " Start unfolded, use <z><c> to fold/unfold
"au FileType python highlight Comment ctermbg=black guibg=#e2f0ff
  "" Code completion
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview  " Rearrange the completion results
"au FileType python set omnifunc=pythoncomplete#Complete "Tell vim to use that function

" LaTex files
au FileType tex set textwidth=80

"" Multiple
au FileType mpython,python,tex set colorcolumn=81
au FileType mpython,python,tex highlight ColorColumn ctermbg=green
au FileType python,mpython hi ExtraWhitespace ctermbg=grey guibg=red
au FIleType python,mpython match ExtraWhitespace /\s\+$/


"map <buffer> <S-e> :w<CR>:!/bin/env mpython_iq % <CR> " Execute mpython file
"                                                      " being edited with <Shift> + e


"" Custom Functions
"" ================
"" Strip trailing whitespace (call as :StripWS)
function! s:StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction
command! StripWS call s:StripTrailingWhitespace()


"" Plugin configuration
"" ====================
nnoremap <leader>n :NERDTree
let g:NERDTreeDirArrows=0

"" Supertab
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview  " Rearrange the completion results
let g:SuperTabClosePreviewOnPopupClose = 1 " Close help window when done

"" Syntastic
nnoremap <leader><F1> :SyntasticReset<CR>
"  Show errors in location list buffer
let g:syntastic_always_populate_loc_list = 1
"""  Show location list buffer when errors present, hide it otherwise
let g:syntastic_auto_loc_list = 1
"  Change size of location list buffer display
let g:syntastic_loc_list_height = 4
"  Check when you first open a file, as well as whenever you write
let g:syntastic_check_on_open = 1
"  Don't bother checking when quitting
let g:syntastic_check_on_wq = 0
" Set python/mpython to use pyflakes only
let g:syntastic_mpython_checkers = ['pyflakes', 'python']
let g:syntastic_python_checkers = ['pyflakes', 'python']
"" Update status line to show warnings
set statusline+=\\\%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
