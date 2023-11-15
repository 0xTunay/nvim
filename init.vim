:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set paste
:set nopaste
:set syntastic_enable=1
call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/ryanoasis/vim-devicons.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/rafi/awesome-vim-colorschemes.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'

source /home/tunay/.local/share/nvim/plugged/awesome-vim-colorschemes/colors/space-vim-dark.vim
call plug#end()

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу
if !has('nvim') | set viminfo+=n~/.config/vim/viminfo | endif

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-T> :NERDTreeToggle<CR>
