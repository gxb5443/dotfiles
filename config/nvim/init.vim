set t_Co=256

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

"dein Configuration -----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let $VIMPATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
let $VARPATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache').'/vim')


" Search and use environments specifically made for Neovim.
"if isdirectory($VARPATH.'/venv/neovim2')
"	let g:python_host_prog = $VARPATH.'/venv/neovim2/bin/python'
"endif
if isdirectory($VARPATH.'/venv/neovim3')
	let g:python3_host_prog = $VARPATH.'/venv/neovim3/bin/python'
endif
let g:python3_host_skip_check = 1

" Required:
"set runtimepath^=/Users/gianfranco.biondi/.config/nvim/bundle/repos/github.com/Shougo/dein.vim
set runtimepath+=/Users/gianfranco.biondi/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(expand('/Users/gianfranco.biondi/.cache/dein'))
    call dein#begin(expand('/Users/gianfranco.biondi/.cache/dein'))

    " Let dein manage dein
    " Required:
    " call dein#add('Shougo/dein.vim')
    call dein#add('/Users/gianfranco.biondi/.cache/dein/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
    " You can specify revision/branch/tag.
    call dein#add('fatih/vim-go', {'on_ft': ['go']})
    call dein#add('majutsushi/tagbar')
    call dein#add('dense-analysis/ale')
    call dein#add('Raimondi/delimitMate')
    call dein#add('Shougo/neoinclude.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('zchee/deoplete-go', {'on_ft': ['go'], 'build': 'make'})
    call dein#add('zchee/deoplete-jedi', {'on_ft': ['python']})
    call dein#add('zchee/deoplete-clang', {'on_ft': ['cc','cpp']})
    call dein#add('Shougo/neocomplcache')
    call dein#add('Shougo/neosnippet', {'on_event': 'InsertCharPre', 'on_ft': ['snippet']})
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('tpope/vim-fugitive')
    call dein#add('mhinz/vim-signify')
    call dein#add('junegunn/fzf.vim')
    call dein#add('flazz/vim-colorschemes')
    call dein#add('scrooloose/nerdtree', {'on_map': {'n': '<Plug>'}})
    call dein#add('jistr/vim-nerdtree-tabs', {'on_source': ['nerdtree']})
    call dein#add('Xuyuanp/nerdtree-git-plugin', {'on_source': ['nerdtree']})
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('maxbrunsfeld/vim-yankstack')
    " call dein#add('Konfekt/FastFold')
    " call dein#add('Konfekt/FoldText')
    call dein#add('luochen1990/rainbow')
    call dein#add('joereynolds/gtags-scope')
    call dein#add('Shougo/context_filetype.vim', {'lazy': 1})
    " call dein#add('Shougo/neco-syntax', {'on_source': ['deoplete.nvim']})
    call dein#add('jremmen/vim-ripgrep')
    call dein#add('rhysd/vim-clang-format', {'on_ft': ['c','cc','cpp','proto']})


    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    " Required:
    call dein#end()
    call dein#save_state()
    "call dein#load_toml('dein.toml')
endif

" Required:
filetype off                    " Reset filetype detection first ...
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

function! s:source_file(path, ...) abort
	let use_global = get(a:000, 0, ! has('vim_starting'))
	let abspath = resolve(expand($VIMPATH.'/nvim/config/'.a:path))
	if ! use_global
		execute 'source' fnameescape(abspath)
		return
	endif

	let content = map(readfile(abspath),
		\ "substitute(v:val, '^\\W*\\zsset\\ze\\W', 'setglobal', '')")
	let tempfile = tempname()
	try
		call writefile(content, tempfile)
		execute printf('source %s', fnameescape(tempfile))
	finally
		if filereadable(tempfile)
			call delete(tempfile)
		endif
	endtry
endfunction

" Set augroup
augroup MyAutoCmd
	autocmd!
	autocmd CursorHold *? syntax sync minlines=300
augroup END

call s:source_file('plugins/all.vim')
call s:source_file('general.vim')
call s:source_file('theme.vim')
call s:source_file('movement.vim')
call s:source_file('udf.vim')
call s:source_file('filetype.vim')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:deoplete#enable_at_startup = 1
call s:source_file('plugins/deoplete.vim')

let g:delimitMate_expand_cr = 1
let g:neosnippet#data_directory = $VARPATH.'/snippets'
let g:neosnippet#enable_snipmate_compatibity = 1
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#expand_word_boundary = 1
autocmd MyAutoCmd InsertLeave * NeoSnippetClearMarkers
au FileType go let b:delimitMate_matchpairs = "(:),[:],{:}"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YankStack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

map <c-f> :FZF<cr>
map <c-b> :Buffers<cr>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr><Paste>

let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_enter = 0
let g:ale_completion_enabled = 0

"let g:ale_sign_warning = '--'
"let g:ale_sign_error = '>>'
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '⤫'

let g:ale_linters = {
    \ 'go': ['gopls'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\   'lua': ['luacheck'],
\   'cpp': ['clang-format'],
\}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"
let g:go_list_type = "quickfix"
let g:go_autodetect_gopath = 1
let g:go_gocode_autobuild = 1

let g:go_auto_type_info = 1

let g:go_addtags_transform = "snakecase"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

let g:go_auto_sameids = 1

let g:go_fmt_fail_silently = 0
au FileType go nmap <leader>t <Plug>(go-test)

au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)

let g:go_term_mode = "split"

nmap ,, :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rainbow Parenthesis
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightgreen', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}

let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_rrhelper = 1
let g:loaded_ruby_provider = 1
let g:loaded_shada_plugin = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
