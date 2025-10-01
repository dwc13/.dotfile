"==================================================
" Plugin
"==================================================
" To install -> Plug '<package-github>'
" Then command :PlugInstall
" Check for updates :PlugUpdate
call plug#begin()

Plug 'http://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc

" Vim Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' " vim status bar themes

" Tablulate my code
Plug 'godlygeek/tabular'

" VIM WHICH KEY
Plug 'liuchengxu/vim-which-key'

call plug#end()

"==================================================
" Theme
"==================================================

" Color Theme
" ------------------------------------------------
colorscheme elflord

" Airline Themes: For more themes https://github.com/vim-airline/vim-airline/wiki/Screenshots
" ------------------------------------------------
let g:airline_theme='murmur'
"let g:airline_theme='simple'

"==================================================
" Maps
"==================================================

" Remap Leader Key
let mapleader = ' '

" Map Visual-Block, WSL <c-v> is paste
nnoremap <leader>v <C-v>

" New line 
nnoremap <S-O> o<Esc>

" Move line Up or Down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Buffer Key-maps: More information https://mkaz.blog/working-with-vim/buffers/
" ------------------------------------------------
" Write and delete buffer
" map <leader>bd :w | bd
" Next Buffer
" map <leader>bh :w | bp
" Previous Buffer
" map <leader>bl :w | bn

" NERDtree Key-maps
" ------------------------------------------------
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Vim Which Key
" ------------------------------------------------
nnoremap <silent> <leader> :WhichKey ','<CR>
set timeoutlen=500

"  " LaTex Command: Command and Key-map to build current .tex file to PDF
"  " ------------------------------------------------
"  command -nargs=1 TEX :w | !pdflatex -jobname=<args> % && rm -r ./*.log ./*.aux ./*.out
"  nnoremap <leader>tr :TEX <c-r>=strftime('%Y%m%d')<CR>-DCarrillo-resume
"  " nnoremap <leader>tf :TEX %
"  
"  " Pandoc: Converting all .md file to .html
"  " ------------------------------------------------
"  " map <leader>pw :!pandoc -f markdown -t html -s -o \*.html
"  " map <leader>pw :!for file in $(find . -iname "*.md"); do pandoc --from markdown --to html ${file} -o "site_html/${file%md}html"; done

"==================================================
" Setting
"==================================================

" Path: Append for find command
set path+=**/

"==================================================
" Syntax
"==================================================
set nowrap
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

"==================================================
" Visual
"==================================================
set wmnu " wildmenu
set nu
set relativenumber
set cursorline
set nohls
set noeb
set vb
set showcmd
set scrolloff=12
set nuw=6
set conceallevel=2
