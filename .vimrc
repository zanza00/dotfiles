set nocompatible

let mapleader = ","

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" the plugin manager
Plugin 'gmarik/vundle'

" theme
Plugin 'joshdick/onedark.vim'

" fuzzy file finder
Plugin 'kien/ctrlp.vim'

" a nice status bar
Plugin 'bling/vim-airline'

" git support
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" make trailing whitespaces stand-out
Plugin 'bronson/vim-trailing-whitespace'

" fuzzy autocompletion support
Plugin 'Shougo/neocomplete.vim'

" surround things (parenthesis and friends)
Plugin 'tpope/vim-surround'

" comment with gc/gcc
Plugin 'tpope/vim-commentary'

" inline linting for multiple languages
Plugin 'scrooloose/syntastic'

" javascript/jsx support
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" nicer project drawer
Plugin 'scrooloose/nerdtree'

" autoreload buffers when files change on disk
Plugin 'djoshea/vim-autoread'

" automatically close parenthesis
Plugin 'jiangmiao/auto-pairs'

" copy buffer from vim to tmux
Plugin 'jpalardy/vim-slime'

" find stuff in files
Plugin 'rking/ag.vim'

" terraform files syntax
Plugin 'hashivim/vim-terraform'

call vundle#end()
filetype plugin indent on

set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set expandtab
set sm
set tabstop=2
set wrap
set vb

set tags=tags;/

" line numbers
set number

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" Highlight things that we find with the search
set hlsearch

" enable mouse
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

syntax on
colorscheme onedark

" slim cursor for insert mode
" block cursor for normal mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" upon hitting escape to change modes,
" send successive move-left and move-right
" commands to immediately redraw the cursor
inoremap <special> <Esc> <Esc>hl

" don't blink the cursor
set guicursor+=i:blinkwait0

" use j/k to navigate autocomplete suggestions
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" allow deleting outside of insert mode scope
set backspace=2

" apply q macro with space
nnoremap <space> @q

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 1

set wildignore+=*.swp,*.class,*.jar

" idris comment for vim-commentary
autocmd FileType idris set commentstring=--\ %s

" jsx files config
let g:jsx_ext_required=0

" 120 char delimiter on .scala files
autocmd FileType scala set cc=121

" 100 char delimiter on .java files
autocmd FileType java set cc=101

" Enable heavy omni completion.
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.java = '\k\.\k*'
let g:neocomplete#force_omni_input_patterns.scala = '\k\.\k*'

" typecheck on save
autocmd BufWritePost *.scala :EnTypeCheck

" nerdtree toggle
nmap <F9> :NERDTreeToggle<CR>

" ctags tab toggle
nmap <F8> :TagbarToggle<CR>

" jump to ctag in a vertical split with alt + ]
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" vim-slime configuration
let g:slime_target = "tmux"

" eslint syntax check for javascript files
let g:syntastic_javascript_checkers = ['eslint']

" conceal markers
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" ctrlp only current directory
let g:ctrlp_working_path_mode = 'a'

" autoclose Flow error panel when no errors are found
let g:flow#autoclose = 1
