" deoplete for nvim
" ---

"call deoplete#custom#option('profile', v:true)
"call deoplete#enable_logging('DEBUG', 'deoplete.log')

" General settings " {{{
" ---
"let g:deoplete#auto_complete_delay = 1000  " Default is 50
" let g:deoplete#auto_refresh_delay = 500  " Default is 500
let g:deoplete#enable_at_startup = 1
autocmd InsertEnter * call deoplete#enable()

let g:neosnippet#enable_snipmate_compatibility = 1

let g:deoplete#enable_camel_case = 1
let g:deoplete#max_abbr_width = 35
let g:deoplete#max_menu_width = 21
call deoplete#custom#option('skip_chars', ['(', ')', '<', '>'])

let g:jedi#auto_vim_configuration = 1
"let g:deoplete#sources#jedi#enable_cache = 1
"let g:deoplete#sources#jedi#statement_length = 31
"let g:deoplete#sources#jedi#show_docstring = 0
"let g:deoplete#sources#jedi#short_types = 1


"let g:deoplete#sources#ternjs#filetypes = [
"	\ 'jsx',
"	\ 'javascript.jsx',
"	\ 'vue',
"	\ 'javascript'
"	\ ]

"let g:deoplete#sources#ternjs#timeout = 3
"let g:deoplete#sources#ternjs#types = 1
"let g:deoplete#sources#ternjs#docs = 1
set completeopt+=noinsert,noselect

call deoplete#custom#source('_', 'min_pattern_length', 2)
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

" }}}
" Limit Sources " {{{
" ---

"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"let g:deoplete#sources = get(g:, 'deoplete#sources', {})
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"let g:deoplete#sources#go#pointer = 1
"let g:deoplete#sources#go#align_class = 1
call deoplete#custom#source('go', 'gocode_binary', $GOPATH.'/bin/gocode')
call deoplete#custom#source('go', 'sort_class', ['package', 'func', 'type', 'var', 'const'])
call deoplete#custom#source('go', 'pointer', 1)
call deoplete#custom#source('go', 'align_class', 1)
" let g:deoplete#sources.go = ['vim-go']
" let g:deoplete#sources.javascript = ['file', 'ternjs']
" let g:deoplete#sources.jsx = ['file', 'ternjs']

call deoplete#custom#option('ignore_sources', {'python': ['syntax' ,'buffer', 'member', 'tag']})

" call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

" }}}
" Omni functions and patterns " {{{
" ---
" let g:deoplete#keyword_patterns = {}
" let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'

call deoplete#custom#source('omni', 'functions', {
		\ 'css': ['csscomplete#CompleteCSS'],
		\ 'html': ['htmlcomplete#CompleteTags'],
		\ 'markdown': ['htmlcomplete#CompleteTags'],
		\})

call deoplete#custom#var('omni', 'input_patterns', {
		\ 'xml': '<[^>]*',
		\ 'md': '<[^>]*',
		\ 'css': '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
		\ 'scss': '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
		\ 'sass': '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
		\ 'python': '',
		\ 'javascript': '',
		\})

" }}}
" Ranking and Marks " {{{
" Default rank is 100, higher is better.
call deoplete#custom#source('omni',          'mark', '⌾')
call deoplete#custom#source('flow',          'mark', '⌁')
call deoplete#custom#source('padawan',       'mark', '⌁')
call deoplete#custom#source('TernJS',        'mark', '⌁')
call deoplete#custom#source('go',            'mark', '⌁')
call deoplete#custom#source('jedi',          'mark', '⌁')
call deoplete#custom#source('vim',           'mark', '⌁')
call deoplete#custom#source('neosnippet',    'mark', '⌘')
call deoplete#custom#source('tag',           'mark', '⌦')
call deoplete#custom#source('around',        'mark', '↻')
call deoplete#custom#source('buffer',        'mark', 'ℬ')
call deoplete#custom#source('tmux-complete', 'mark', '⊶')
call deoplete#custom#source('syntax',        'mark', '♯')
call deoplete#custom#source('member',        'mark', '.')

call deoplete#custom#source('padawan',       'rank', 660)
call deoplete#custom#source('go',            'rank', 650)
call deoplete#custom#source('vim',           'rank', 640)
call deoplete#custom#source('flow',          'rank', 630)
call deoplete#custom#source('TernJS',        'rank', 620)
call deoplete#custom#source('jedi',          'rank', 610)
call deoplete#custom#source('omni',          'rank', 600)
call deoplete#custom#source('neosnippet',    'rank', 510)
call deoplete#custom#source('member',        'rank', 500)
call deoplete#custom#source('file_include',  'rank', 420)
call deoplete#custom#source('file',          'rank', 410)
call deoplete#custom#source('tag',           'rank', 400)
call deoplete#custom#source('around',        'rank', 330)
call deoplete#custom#source('buffer',        'rank', 320)
call deoplete#custom#source('dictionary',    'rank', 310)
call deoplete#custom#source('tmux-complete', 'rank', 300)
call deoplete#custom#source('syntax',        'rank', 200)

" }}}
" Matchers and Converters " {{{
" ---

" Default sorters: ['sorter_rank']
" Default matchers: ['matcher_length', 'matcher_fuzzy']

call deoplete#custom#source('_', 'converters', [
	\ 'converter_remove_paren',
	\ 'converter_remove_overlap',
	\ 'converter_truncate_abbr',
	\ 'converter_truncate_menu',
	\ 'converter_auto_delimiter',
	\ ])

" }}}
" Key-mappings and Events " {{{
" ---

autocmd MyAutoCmd CompleteDone * silent! pclose!

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<Up>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>" : "\<C-u>"

" Undo completion
" inoremap <expr><C-g> deoplete#undo_completion()

" Redraw candidates
inoremap <expr><C-g> deoplete#refresh()
inoremap <expr><C-l> deoplete#complete_common_string()

" <CR>: If popup menu visible, expand snippet or close popup with selection,
"       Otherwise, check if within empty pair and use delimitMate.
inoremap <silent><expr><CR> pumvisible() ?
	\ (neosnippet#expandable() ? neosnippet#mappings#expand_impl() : deoplete#close_popup())
		\ : (delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" : "\<CR>")

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<Down>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#manual_complete()))

smap <silent><expr><Tab> pumvisible() ? "\<Down>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#manual_complete()))

inoremap <expr><S-Tab>  pumvisible() ? "\<Up>" : "\<C-h>"

function! s:is_whitespace() "{{{
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}
" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
