set t_Co=256
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/gianfranco.biondi/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/gianfranco.biondi/.cache/dein')
  call dein#begin('/Users/gianfranco.biondi/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/gianfranco.biondi/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('dense-analysis/ale')
  "call dein#add('Shougo/defx.nvim')
  call dein#add('junegunn/fzf.vim')

  call dein#add('morhetz/gruvbox')

  "call dein#add('vim-airline/vim-airline')
  "call dein#add('vim-airline/vim-airline-themes')
  call dein#add('itchyny/lightline.vim')

  "call dein#add('neoclide/coc.nvim')
  call dein#add('neoclide/coc.nvim', {'merged':0, 'build': 'yarn install --frozen-lockfile'})
  call dein#add('josa42/coc-sh', {'merged':0, 'build': 'yarn install --frozen-lockfile'})
  call dein#add('neoclide/coc-json', {'merged':0, 'build': 'yarn install --frozen-lockfile'})
  call dein#add('neoclide/coc-yaml', {'merged':0, 'build': 'yarn install --frozen-lockfile'})
  call dein#add('clangd/coc-clangd', {'merged':0, 'build': 'yarn install --frozen-lockfile'})
  call dein#add('neoclide/coc-git', {'merged':0, 'build': 'yarn install --frozen-lockfile'})
  call dein#add('fannheyward/coc-markdownlint')

  call dein#add('kyazdani42/nvim-web-devicons') " for file icons
  call dein#add('kyazdani42/nvim-tree.lua')
  " old version that runs on neovim 0.4.x
  "call dein#add('ryanoasis/vim-devicons') " for file icons
  "call dein#add('kyazdani42/nvim-tree.lua', { 'rev': 'afc86a9623024be6f7d761e4363c833b46c44ca5' })
  "
  call dein#add('fatih/vim-go')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
