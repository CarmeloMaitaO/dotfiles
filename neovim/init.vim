" Enviroment
set termguicolors
set textwidth=79
set colorcolumn=+1
set wrap linebreak
autocmd BufNewFile,BufRead * setlocal formatoptions+=t

" Plugins
call plug#begin()
Plug 'dylanaraps/wal.vim'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'morhetz/gruvbox'
Plug 'kovetskiy/sxhkd-vim'
call plug#end()

" Plugins scripts
lua require'colorizer'.setup()
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Colorscheme
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'soft'
set background=dark
"set background=light
colorscheme gruvbox
"colorscheme wal "set notermguicolor

" Mappings: Plugins
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Mappings: User
nnoremap <C-s> :w!<CR>
nnoremap <C-q> :q!<CR>
nnoremap <C-x> :wq!<CR>
nnoremap <C-c> :!make<CR>
