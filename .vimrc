"==================================================
" Plugin
"==================================================
" To install -> Plug '<package-github>'
" Then command :PlugInstall
" Check for updates :PlugUpdate
call plug#begin()

Plug 'tyru/open-browser.vim' " opens url in browser
Plug 'http://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc

" Vim Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' " vim status bar themes

" Markdown-preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Tablulate my code
Plug 'godlygeek/tabular'

" Vim Markdown
Plug 'preservim/vim-markdown'

" Limelight Focusing Viewing on Code Block
Plug 'junegunn/limelight.vim'

" Goyo Focusing Viewing on File
Plug 'junegunn/goyo.vim'

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

" Vim Markdown Themes: For settings https://github.com/preservim/vim-markdown
" ------------------------------------------------
let g:vim_markdown_folding_disabled = 1

" Limelight: Focusing Coloring, More information https://github.com/junegunn/limelight.vim
" ------------------------------------------------
"  More Color name (:help cterm-colors)
let g:limelight_conceal_ctermfg = "LightGrey"
" let g:limelight_conceal_ctermfg = 210

" Goyo: Focusing Screen Size
" ------------------------------------------------
let g:goyo_width = 120

"==================================================
" Maps
"==================================================

" Remap Leader Key
let mapleader = ','

" Map Visual-Block, WSL <c-v> is paste
nnoremap <leader>v <C-v>

" New line 
nnoremap <S-O> o<Esc>

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

" Firefox Command: Open Window's Firefox 
" ------------------------------------------------
command -nargs=1 Fire :!/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe <args>

" Open URL: Key-map to open URLs in Window's Firefox
" ------------------------------------------------
map <leader>ou vi(y<Esc>:Fire <c-r>"<CR>

" Open PDF: Key-map to open PDFs in Window's Firefox
" ------------------------------------------------
" map <leader>op vi(y<Esc>:Fire file:/<c-r>"
map <leader>op vi(y<Esc>:Fire file:///Z:/notes/<c-r>"<CR>

" Open Markdown: Command and Key-map to open MD 
" ------------------------------------------------
" Open in new buffer
command -nargs=1 OpenMD :ed /mnt/z/notes/<args>
nnoremap <leader>om vi(y<ESC>:OpenMD <c-r>"<CR>
" Open in Firefox
nnoremap <leader>of :Fire file:///Z:/notes/%<CR><CR>

" Open Markdown: Command and Key-map to open MD in a new buffer
" ------------------------------------------------
" command Obsidian :!/mnt/c/Users/carri/AppData/Local/Obsidian/Obsidian.exe

" Markdown-Preview: Open Markdown Preview
" ------------------------------------------------
map <leader>mp :MarkdownPreview<CR>

" LaTex Command: Command and Key-map to build current .tex file to PDF
" ------------------------------------------------
command -nargs=1 TEX :w | !pdflatex -jobname=<args> % && rm -r ./*.log ./*.aux ./*.out
nnoremap <leader>tr :TEX <c-r>=strftime('%Y%m%d')<CR>-DCarrillo-resume
" nnoremap <leader>tf :TEX %

" Pandoc: Converting all .md file to .html
" ------------------------------------------------
" map <leader>pw :!pandoc -f markdown -t html -s -o \*.html
" map <leader>pw :!for file in $(find . -iname "*.md"); do pandoc --from markdown --to html ${file} -o "site_html/${file%md}html"; done

" Custom Snippets
" ------------------------------------------------
nnoremap <leader>sp :-1read $HOME/.dotfile/snippets/paper-notes-temp.md<CR>
nnoremap <leader>sm :-1read $HOME/.dotfile/snippets/meetings-temp.md<CR>
nnoremap <leader>sd :-1read $HOME/.dotfile/snippets/definition-temp.md<CR>
nnoremap <leader>sa :-1read $HOME/.dotfile/snippets/author-temp.md<CR>

"==================================================
" Setting
"==================================================

" Path: Append for find command
" ------------------------------------------------
set path+=**/

" Markdown-preview
" ------------------------------------------------
" vim will refresh markdown when buffer save or leave insert mode
let g:mkdp_refresh_slow = 1

" specify browser to open preview page
" let g:mkdp_browser="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"
" let g:mkdp_browser="/mnt/c/Program\ Files\ \(x86\)/Microsoft/Edge/Application/msedge.exe"
let g:mkdp_browser = "firefox"
" let g:mkdp_browser="edge"

" custom markdown style
let g:mkdp_markdown_css = "/home/dom/.dotfile/markdown.css"
let g:vim_markdown_new_list_item_indent = 0

"==================================================
" Syntax
"==================================================
set nowrap
filetype plugin indent on
set tabstop=4
set shiftwidth=4
" set autoindent
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
