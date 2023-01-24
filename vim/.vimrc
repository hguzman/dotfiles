set nocompatible " be iMproved

" For vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Dependencies of snipmate
Plugin 'SirVer/ultisnips'
" Bundle "MarcWeber/vim-addon-mw-utils"
" Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
" Git tools
Bundle 'tpope/vim-fugitive'
" Dependency managment
Bundle 'gmarik/vundle'
" Rails :/
Bundle 'tpope/vim-rails.git'
" Snippets for our use :)
" Bundle 'garbas/vim-snipmate'
" Commenting and uncommenting stuff
Bundle 'tomtom/tcomment_vim'
" Molokai theme
Bundle 'tomasr/molokai'
" Vim Ruby
Bundle 'vim-ruby/vim-ruby'
" Surround your code :)
Bundle 'tpope/vim-surround'
" Every one should have a pair (Autogenerate pairs for "{[( )
Bundle 'jiangmiao/auto-pairs'
" Tab completions
Bundle 'ervandew/supertab'
" Fuzzy finder for vim (CTRL+P)
Bundle 'kien/ctrlp.vim'
" For tests
Bundle 'janko-m/vim-test'
" Navigation tree
Bundle 'scrooloose/nerdtree'
" Dispatching the test runner to tmux pane
Bundle 'tpope/vim-dispatch'

Bundle 'plasticboy/vim-markdown'

Bundle 'christoomey/vim-sort-motion'

Plugin 'mattn/emmet-vim'

Plugin 'thoughtbot/vim-rspec'

" Para Ggrep ]q
Plugin 'tpope/vim-unimpaired'
" Coloca una barra en la parte de abajo
Plugin 'itchyny/lightline.vim'
" Para el tema de manejar el buffer
" Plugin 'sjbach/lusty'
Plugin 'mileszs/ack.vim'
Plugin 'dart-lang/dart-vim-plugin'
" Dart support
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'


call vundle#end() 

set tags=./tags; " Set tags directory
set autoindent " Auto indention should be on


" filetype plugin indent on
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Ruby stuff: Thanks Ben :)
" ================
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml,markdown,html,css set ai sw=2 sts=2 et
	autocmd FileType html,css,eruby EmmetInstall
augroup END
" ================

" Syntax highlighting and theme

syntax enable

" configuración barra
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" Split your windows
let g:UltiSnipsEditSplit="vertical"

" Configs to make Molokai look great
set background=dark
let g:molokai_original=1
let g:rehash256=1
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
set t_Co=256
colorscheme molokai

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Lovely linenumbers
" Relative number
set nu rnu
set ruler

" fold lines
set foldmethod=manual

" My leader key
let mapleader=","

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set switchbuf=useopen,split
" Atajos
map <c-t> <esc>:tabnew<cr>

command! SortCSS :g#\({\n\)\@<=#.,/}/sort

" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>
nmap ; :buffers<CR>

" Open a new Tab and search for something
nmap <leader>b :tab split<CR>:Ack ""<left>
" Imediately search for the word under de cursor in a new tab
" nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

" Buffer switching
map <leader>p :bp<CR> " \p previous buffer
map <leader>n :bn<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer

map <Leader>c :call <CR>
nmap <silent> <leader>c :TestFile<CR>
nmap <silent> <leader>s :TestNearest<CR>
map <leader>t :A<CR> " \t to jump to test file
map <leader>r :r<cr> " \t to jump to related file

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

set laststatus=2

" Don't be a noob, join the no arrows key movement
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>

" noremap   <Up>     <NOP>

noremap   <Up>    :echoe "Use k"<CR>
noremap   <Down>  :echoe "Use j"<CR>
noremap   <Left>  :echoe "Use h"<CR>
noremap   <Right> :echoe "Use l"<CR>

" Autocomplete
inoremap <C-Space> <C-x><C-o>

" Removing escape
ino jk <esc>
cno jk <c-c>
vno v <esc>

" highlight the current line
set cursorline
" Highlight active column
set cuc cul"

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" Cambia el tamaño de la letra en consola
set guifont=Monaco:h16


" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif

" Ruby hash syntax conversion
nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>

" nmap <Leader><CR> :nohlsearch<cr>
map <leader>w :update<CR>
map <leader>q :NERDTreeToggle<CR>

set clipboard=unnamed

if has('nvim')
  let test#strategy = "neovim"
else
  let test#strategy = "dispatch"
endif

