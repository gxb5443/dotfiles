set t_Co=256
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'fatih/vim-go'
NeoBundle 'Shougo/deoplete.nvim', {'build': {'unix': 'make'}}
NeoBundle 'zchee/deoplete-go', {'build': {'unix': 'make'}}
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimproc.vim', {'build':{'mac':'make'}}
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax on
set autoread
set history=700
set cmdheight=2
set hid
set wildmenu
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set mat=2

syntax enable

set nobackup
set nowb
set noswapfile

set ruler

set smarttab
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set lbr
set tw=500
set ai "Auto Indent
set wrap "Auto Wrap lines
set foldcolumn=1
"set completeopt+=noinsert
set number
set relativenumber
set autoread
set linebreak

let mapleader=","

set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

map 0 ^

set colorcolumn=80

if has("gui_running")
  set guifont=Inconsoata\ for\ Powerline:h20,Monaco:h17
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"colorscheme solarized
colorscheme molokai
set background=light

inoremap ,. <esc>
vnoremap ,. <esc>

if has ('mouse')
  set mouse=a
endif

" Deocomplete
" deoplete config
let g:deoplete#enable_at_startup = 1
" disable autocomplete
"let g:deoplete#disable_auto_complete = 1
"if has("gui_running")
"    inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
"else
"    inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
"endif
"" UltiSnips config
"inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"(v)im (r)eload
nmap <silent> ,vr :so %<CR>

noremap ,ve :e ~/.config/nvim/init.vim<CR>

noremap ,l :update<CR>

" ============================
" Strip Trailing Whitespaces
" ============================
" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap ,w :StripTrailingWhitespaces<CR>

" CTRLP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlBuffer<cr>

let g:ctrlp_max_height=20
let g:ctrlp_custom_ignore='node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" Enable omni complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

" NerdTree
map <Leader>n :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 2 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
