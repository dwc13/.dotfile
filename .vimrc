" Plugin
"=========================
" To install -> Plug '<package-github>'
" Then command :PlugInstall
" Check for updates :PlugUpdate
call plug#begin()

Plug 'tyru/open-browser.vim' " opens url in browser
Plug 'http://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline' " vim status bar
Plug 'vim-airline/vim-airline-themes' " vim status bar themes

call plug#end()

" Theme
"=========================

" Color Theme
" ----------------
colorscheme elflord

" Airline Themes: For more themes https://github.com/vim-airline/vim-airline/wiki/Screenshots
" ----------------
let g:airline_theme='murmur'
"let g:airline_theme='simple'

" Maps
"=========================

" Remap Leader Key
let mapleader = ','

" Map Visual-Block, WSL <c-v> is paste
nnoremap <leader>v <C-v>

" New line 
nnoremap <S-O> o<Esc>

" NERDtree Key-maps
" ----------------
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Firefox Command: Open Window's Firefox 
" ----------------
command -nargs=1 Fire :!/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe <args>

" Open URL: Key-map to open URLs in Window's Firefox
" ----------------
map <leader>ou vi(y<Esc>:Fire <c-r>"<CR>

" Open PDF: Key-map to open PDFs in Window's Firefox
" ----------------
map <leader>op vi(y<Esc>:Fire file:/<c-r>"

" Open Markdown: Command and Key-map to open MD in a new buffer
" ----------------
command -nargs=1 OpenMD :ed /mnt/z/notes/<args>
nnoremap <leader>b vi(y<ESC>:OpenMD <c-r>"<CR>

" LaTex Command: Command and Key-map to build current .tex file to PDF
" ----------------
command TEX :w | !pdflatex %<CR>
nnoremap <leader>t :TEX<CR>

" Pandoc: Converting all .md file to .html
" ----------------
" map <leader>pw :!pandoc -f markdown -t html -s -o \*.html
" map <leader>pw :!for file in $(find . -iname "*.md"); do pandoc --from markdown --to html ${file} -o "site_html/${file%md}html"; done

" Vim Setting: Append for find command
"=========================
set path+=**/

" Syntax
"=========================
set nowrap
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

" Visual
"=========================
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
