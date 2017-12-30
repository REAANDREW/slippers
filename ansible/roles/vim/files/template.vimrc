set nocompatible | syn on
filetype off
syntax on
filetype plugin on
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

set backspace=indent,eol,start

let g:airline_powerline_fonts = 1

"http://stackoverflow.com/questions/6624043/how-to-open-or-close-nerdtree-and-tagbar-with-leader
function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTree
    else
        NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction
nnoremap <leader>\ :call ToggleNERDTreeAndTagbar()<CR>

let NERDTreeIgnore = ['\.pyc$']

"Multicursor
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1

autocmd FileType java setlocal omnifunc=javacomplete#Complete

call gitgutter#line_highlights_enable()
