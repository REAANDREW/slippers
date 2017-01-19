set nocompatible | syn on
filetype off
syntax on
filetype plugin indent on

set t_Co=256
set t_ut=
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set number
set showcmd
set cursorline
set showmatch
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set laststatus=2
set encoding=utf-8

colorscheme jellybeans

"Code Folding
nnoremap <space> za
 
""NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nmap <silent> <C-D> :NERDTreeToggle<CR>
