set t_Co=256

" Skip init if vim-small
if 0 | endif

" get vimpath if symlinked
"let $VIMPATH = fnamemodify(resolve(expand('<sfile>:p')), 'h:h')
"let $VIMPATH = fnamemodify(expand('<sfile>:p:h'), 'h:h')
let $VIMPATH = expand('<sfile>:p:h')

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('fatih/vim-go', {'on_ft': ['go']})
  call dein#add('majutsushi/tagbar')
  call dein#add('w0rp/ale')
  call dein#add('maxbrunsfeld/vim-yankstack')
  call dein#add('scrooloose/nerdtree', {'on_map': {'n': '<Plug>'}})
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neosnippet', {'on_event': 'InsertCharPre', 'on_ft': ['snippet']})

  call dein#end()
  call dein#save_state()
endif

function! s:source_file(path, ...) abort
	let use_global = get(a:000, 0, ! has('vim_starting'))
	let abspath = resolve(expand($VIMPATH.'/config/'.a:path))
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

call s:source_file('general.vim')

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

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\   'lua': ['luacheck'],
\
\}
filetype plugin indent on
syntax enable

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
" Deocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:deoplete#enable_at_startup = 1

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
