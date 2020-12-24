"""""""""""""""""""""""
""" START VUNDLE
"""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
Plugin 'yegappan/mru'
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""
""" END VUNDLE
"""""""""""""""""""""""

" Pending review
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-syntastic/syntastic'
"Plug 'Raimondi/delimitMate'
"Plug 'majutsushi/tagbar'
"Plug 'mhinz/vim-startify'
"Plug 'junegunn/seoul256.vim'
"Plug 'ervandew/supertab'
"Plug 'tpope/vim-sleuth'
"Plug 'ryanoasis/vim-devicons'
"Plug 'thiagoalessio/rainbow_levels.vim'
"Plug 'airblade/vim-rooter'
"Plug 'unblevable/quick-scope'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'lambdalisue/vim-rplugin' " required from lista I guess
"Plug 'lambdalisue/lista.nvim'
"Plug 'mhinz/vim-signify'
"Plug 'jeetsukumaran/vim-buffergator'
"Plug 'luochen1990/rainbow'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
"Plug 'jceb/vim-orgmode'
"Plug 'tpope/vim-speeddating' " required for orgmode

"""""""""""""""""""""""
""" START VIM-VISUAL-MULTI
"""""""""""""""""""""""
let g:VM_default_mappings = 0
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
"""""""""""""""""""""""
""" END VIM-VISUAL-MULTI
"""""""""""""""""""""""

"""""""""""""""""""""""
""" START SEMANTIC-HIGHLIGHTING
"""""""""""""""""""""""
"let s:semanticGUIColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]

"autocmd FileType php setlocal iskeyword+=$
"""""""""""""""""""""""
""" END SEMANTIC-HIGHLIGHTING
"""""""""""""""""""""""

" https://github.com/vim-ctrlspace/vim-ctrlspace
set nocompatible
set hidden
set encoding=utf-8
" end vim ctrlspace

" CoC
" https://github.com/neoclide/coc.nvim
"set cmdheight=2
"set shortmess+=c
"set signcolumn=yes
"set guicursor=
"set shell=/bin/sh

" Line numbers
"set number " Line numbers
"highlight LineNr term=bold cterm=NONE ctermfg=Black ctermbg=NONE gui=NONE guifg=Black guibg=NONE

syntax on                               " Syntax highlighting
set mouse-=a                            " Mouse off
set directory^=$HOME/.vim/tmp//         " swp file location

" Mappings
nnoremap r caw
vnoremap r <esc>caw
nnoremap <A-up> :MRU<cr>
nnoremap <C-w> :call CloseBufferOrQuit()<cr>

" Tabbing
set smarttab
set smartindent
set cindent
set autoindent
set softtabstop=4
set backspace=indent,eol,start
set copyindent
set expandtab
set tabstop=4
set shiftwidth=4


" Optimizations
set hid                                " https://github.com/neovim/neovim/issues/4524
let loaded_matchparen = 1              " https://www.reddit.com/r/vim/comments/8m0632/what_performance_related_things_do_you_have_in/
set synmaxcol=200                      " https://www.reddit.com/r/vim/comments/8m0632/what_performance_related_things_do_you_have_in/
set lazyredraw                         " https://www.reddit.com/r/vim/comments/8m0632/what_performance_related_things_do_you_have_in/

" Record last position of cursor
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction
augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Function to quickly quit vim when we're done with the final buffer
function! CloseBufferOrQuit(...) abort
  if (len(getbufinfo({'buflisted':1}))) == 1
    :quit
  else
    :bd
  endif
endfunction

" ==================

"set timeoutlen=1000 ttimeoutlen=0 " https://www.johnhawthorn.com/2012/09/vi-escape-delays/
"set hlsearch
"set incsearch
" set tagcase=smart https://robertbasic.com/blog/smarter-tag-search-in-vim/

" Graveyard
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'airblade/vim-gitgutter'
"Plug 'zefei/vim-colortuner'
"Plug 'vim-ctrlspace/vim-ctrlspace'
"Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
"Plug 'wincent/command-t'
"Plug 'lifepillar/vim-mucomplete'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'tpope/vim-surround'
"Plug 'jiangmiao/auto-pairs'
"Plug 'StanAngeloff/php.vim'
"Plug 'flazz/vim-colorschemes'
"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
"Plug 'yuttie/comfortable-motion.vim'
"Plug 'amiorin/vim-project'
"Plug 'terryma/vim-expand-region'
"Plug 'easymotion/vim-easymotion'
"Plug 'haya14busa/incsearch.vim'
"Plug 'vim-scripts/SearchComplete'
"Plug 'justinmk/vim-sneak'

