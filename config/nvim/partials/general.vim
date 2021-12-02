
" Setting Leader keys
"---------------------------------------------------------
let mapleader=" "
let g:mapleader=" "

" General Settings
"---------------------------------------------------------
" General {{{
syntax on
"set mouse=nv                 " Disable mouse in command-line mode
set mouse=a
set modeline                 " automatically setting options from modelines
set report=0                 " Don't report on line changes
set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path=.,**                " Directories to search when using gf
set virtualedit=block        " Position cursor anywhere in visual block
set synmaxcol=1000           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set nobackup
set nowb
set noswapfile
set backspace=eol,start,indent
set showcmd
set showmode
set lazyredraw

set autoread
if has('patch-7.3.541')
	set formatoptions+=j       " Remove comment leader when joining lines
endif

if has('vim_starting')
	set encoding=utf-8
	scriptencoding utf-8
endif

" What to save for views:
set viewoptions-=options
set viewoptions+=slash,unix

" What to save in sessions:
set sessionoptions-=blank
set sessionoptions-=options
set sessionoptions-=globals
set sessionoptions-=folds
set sessionoptions-=help
set sessionoptions-=buffers
set sessionoptions+=tabpages

if has('clipboard')
	set clipboard& clipboard+=unnamedplus
endif

" }}}
" Wildmenu {{{
" --------
if has('wildmenu')
	set nowildmenu
	set wildmode=list:longest,full
	set wildoptions=tagfile
	set wildignorecase
	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
	set wildignore+=__pycache__,*.egg-info
endif" }}}
" Vim Directories {{{
" ---------------
set undofile swapfile nobackup
set directory=$VARPATH/swap//,$VARPATH,~/tmp,/var/tmp,/tmp
set undodir=$VARPATH/undo//,$VARPATH,~/tmp,/var/tmp,/tmp
set backupdir=$VARPATH/backup/,$VARPATH,~/tmp,/var/tmp,/tmp
set viewdir=$VARPATH/view/
set nospell spellfile=$VIMPATH/spell/en.utf-8.add

" History saving
" ---------------
set history=2000
if has('nvim')
	"  ShaDa/viminfo:
	"   ' - Maximum number of previously edited files marks
	"   < - Maximum number of lines saved for each register
	"   @ - Maximum number of items in the input-line history to be
	"   s - Maximum size of an item contents in KiB
	"   h - Disable the effect of 'hlsearch' when loading the shada
	set shada='300,<50,@100,s10,h
else
	set viminfo='300,<10,@50,h,n$VARPATH/viminfo
    endif

" Tabs and Indents
" -----------------------------
set textwidth=80        " Text width set to 80 chars before wrap
set autoindent          " Use same indenting on new lines
set smartindent         " Automatic indenting on new lines
set smarttab            " Tabs inserts blank according to tab width
set tabstop=2           " Number of spaces for a tab
set shiftwidth=2        " Number of spaces to use in autoindent
set shiftround          " Round indent to multiple of shift width

" Searching
" -----------------------------
set ignorecase          " Search ignoring case
set smartcase           " Keep case when searching with *
set infercase           " Adjust case in insert completion
set incsearch           " Incremental Searching
set hlsearch            " Highlight Search results
set wrapscan            " Jumps back to top of file
set showmatch           " Jump to matching brackets
set matchpairs+=<:>     " Adds HTML brakcets to pair matching
set matchtime=1         " Tenths of a second to show matching parenths
set cpoptions-=m        " showmatch will wait 0.5s or until a char is typed

" Behavior
" -----------------------------
set nowrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,usetab    " Jump to the first open window in any tab
set switchbuf+=vsplit           " Switch buffer behavior to vsplit
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore white
set showfulltag                 " Show tag and tidy search in completion
set complete=.                  " No wins, buffs, tags, include scanning
set completeopt=menuone         " Show menu even for one item
set completeopt+=noselect       " Do not select a match in the menu

if has('patch-7.4.775')
	set completeopt+=noinsert
endif

if exists('+inccommand')
	set inccommand=nosplit
endif

" Editor
" -----------------------------
set noshowmode          " Don't show mode in cmd window
set shortmess=aoOTI     " Shorten messages and don't show intro
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=5     " Keep at least 5 lines left/right
set number              " Show line numbers
set relativenumber      " Show relative line numbers
set noruler             " Disable default status ruler
set list                " Show hidden characters

set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winheight=1         " Minimum height for active window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

set noshowcmd           " Don't show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set noequalalways       " Don't resize windows on split or close
set laststatus=2        " Always show a status line
set colorcolumn=80      " Highlight the 80th character limit
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set display=lastline
set colorcolumn=80

syntax enable

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5
set pyxversion=3                                                                "Always use python 3

augroup vimrc
  autocmd!
  autocmd BufWritePre * call s:strip_trailing_whitespace()                      "Auto-remove trailing spaces
  autocmd InsertEnter * set nocul                                               "Remove cursorline highlight
  autocmd InsertLeave * set cul                                                 "Add cursorline highlight in normal mode
  autocmd FocusGained,BufEnter * silent! exe 'checktime'                        "Refresh file when vim gets focus
  autocmd FileType vim inoremap <buffer><silent><C-Space> <C-x><C-v>
  autocmd FileType markdown setlocal spell
  autocmd FileType json setlocal equalprg=python\ -m\ json.tool
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd VimEnter * call s:set_path()
augroup END

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

function! s:strip_trailing_whitespace()
  if &modifiable
    let l:l = line('.')
    let l:c = col('.')
    call execute('%s/\s\+$//e')
    call histdel('/', -1)
    call cursor(l:l, l:c)
  endif
endfunction

function! s:set_path() abort
  let l:dirs = filter(systemlist('find . -maxdepth 1 -type d'), {_,dir ->
        \ !empty(dir) && empty(filter(split(&wildignore, ','), {_,v -> v =~? dir[2:]}))
        \ })

  if !empty(l:dirs)
    let &path = &path.','.join(map(l:dirs, 'v:val[2:]."/**/*"'), ',')
  endif
endfunction
