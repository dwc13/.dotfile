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
Plug 'vimwiki/vimwiki' " Personal wiki to write notes

call plug#end()

" Theme
"=========================
colorscheme elflord
" For more themes https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme='murmur'
"let g:airline_theme='simple'

" Command line
"=========================
set wmnu " wildmenu

" vimwiki 
set nocompatible
filetype plugin on
syntax on"
"    :Vimwiki2HTML -- Convert current wiki link to HTML.
"    :VimwikiAll2HTML -- Convert all your wiki links to HTML.
"    :help vimwiki-commands -- List all commands.
"    :help vimwiki -- General vimwiki help docs.
let g:vimwiki_list = [{'path': '~/dwc-notes', 'template_path': '~/dwc-notes/templates/',
          \ 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md',
          \ 'path_html': '~/dwc-notes/site_html/', 'custom_wiki2html': 'vimwiki_markdown',
          \ 'html_filename_parameterization': 1,
          \ 'template_ext': '.tpl'}]

" Syntax
"=========================
set nowrap
set tabstop=2
set sw=2
set autoindent

" Visual
"=========================
set nu
set relativenumber
set cursorline
set nohls
set noeb
set vb
set showcmd
set scrolloff=12
set nuw=6

" Maps
"=========================

" Remap Leader Key
let mapleader = ','

" Mapping of VimWiki
" 	more information https://github.com/vimwiki/vimwiki#key-bindings
" :h vimwiki-local-mappings
"
" Basic VimWiki key bindings
"    <Leader>ww -- Open default wiki index file.
"    <Leader>wt -- Open default wiki index file in a new tab.
"    <Leader>ws -- Select and open wiki index file.
"    <Leader>wd -- Delete wiki file you are in.
"    <Leader>wr -- Rename wiki file you are in.
"    <Enter> -- Follow/Create wiki link.
"    <Shift-Enter> -- Split and follow/create wiki link.
"    <Ctrl-Enter> -- Vertical split and follow/create wiki link.
"    <Backspace> -- Go back to parent(previous) wiki link.
"    <Tab> -- Find next wiki link.
"    <Shift-Tab> -- Find previous wiki link.

"Shift + 'o' for new line 
nnoremap <S-O> o<Esc>

" NERDtree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

