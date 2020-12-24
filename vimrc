" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
    Plug 'VundleVim/Vundle.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'jaxbot/semantic-highlight.vim'                  " highlight distinct words instead of keywords
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}   " multiple cursors like sublime
    Plug 'yegappan/mru'                                   " most recently used files
    Plug 'mhinz/vim-startify'                             " a better starpage
    Plug 'vim-airline/vim-airline'                        " fancy line
    Plug 'vim-airline/vim-airline-themes'                 " airline themes
    Plug 'airblade/vim-gitgutter'                         " git gutter
    Plug 'luochen1990/rainbow'                            " Highlight matching parents different colors
    Plug 'airblade/vim-rooter'                            " Set project root to current file
    Plug 'joshdick/onedark.vim'                           " color theme
    Plug 'sheerun/vim-polyglot'                           " language packs
    Plug 'vim-syntastic/syntastic'                        " language checking tool
    Plug 'ervandew/supertab'                              " tag completion
    Plug 'Raimondi/delimitMate'                           " matching delimiters
    Plug 'ryanoasis/vim-devicons'                         " icons in buffers etc
    Plug 'lambdalisue/lista.nvim'                         " line filtering per file
call plug#end()

" Pending review
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'majutsushi/tagbar'
"Plug 'tpope/vim-sleuth'
"Plug 'unblevable/quick-scope'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'jeetsukumaran/vim-buffergator'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'

"""""""""""""""""""""""
""" START VIM-VISUAL-MULTI
"""""""""""""""""""""""
let g:VM_default_mappings = 0
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n

let g:VM_mouse_mappings = 1               " some text
let g:VM_highlight_matches = 'underline'   " some text
"""""""""""""""""""""""
""" END VIM-VISUAL-MULTI
"""""""""""""""""""""""

" nvim
" mkdir -p ~/.config/nvim; ln -s ~/.vimrc ~/.config/nvim/init.vim
set guicursor=                                          " somehow nvim changes beam cursors to block cursors https://github.com/neovim/neovim/issues/6005

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" copy/paste - https://unix.stackexchange.com/questions/12535/how-to-copy-text-from-vim-to-an-external-program
"set clipboard=unnamedplus
"nnoremap y "*y
"vnoremap y "*y
"nnoremap <C-p> "*gP
"vnoremap <C-p> "*gP

"""""""""""""""""""""""
""" START SEMANTIC-HIGHLIGHTING
"""""""""""""""""""""""
"let s:semanticGUIColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]
"let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]

autocmd FileType php setlocal iskeyword+=$
"""""""""""""""""""""""
""" END SEMANTIC-HIGHLIGHTING
"""""""""""""""""""""""

" https://github.com/vim-ctrlspace/vim-ctrlspace
set nocompatible
set hidden
set encoding=utf-8
" end vim ctrlspace

" vim-gitgutter
"let g:gitgutter_set_sign_backgrounds = 1
set updatetime=20                                  " improve delay to show changes

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Rooter
let g:rooter_silent_chdir = 1                       " To stop Rooter echoing the project directory

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_theme='bubblegum'
"let g:airline_theme='onedark'

" Rainbow parenthesis
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" Lista
let g:lista#custom_mappings = [
      \ ['<up>', '<lista:select_previous_candidate>', 'noremap'],
      \ ['<down>', '<lista:select_next_candidate>', 'noremap'],
      \]

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

" One dark theme
let g:onedark_terminal_italics = 1
" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

syntax on                               " Syntax highlighting
colorscheme onedark                     " chosen theme
"set mouse-=a                            " Mouse off
set mouse=a
set directory^=$HOME/.vim/tmp//         " swp file location

" Mappings
nnoremap r caw
nnoremap <C-f> :Lista<cr>
vnoremap r <esc>caw
nnoremap <A-up> :MRU<cr>
nnoremap <C-w> :call CloseBufferOrQuit()<cr>
nnoremap <C-x> dd
inoremap rr <esc>caw
" Buffers
nnoremap <A-left> :bp<cr>
nnoremap <A-right> :bn<cr>

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

set ve+=onemore                        " where have you been all my life https://superuser.com/questions/918500/how-to-set-cursor-to-after-last-character-in-vim
nnoremap <end> $li
nnoremap <home> 0i

autocmd BufWritePre * %s/\s\+$//e       " trim trailing whitespace

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
"Plug 'mhinz/vim-signify'                              " git guttter, alternate
"Plug 'junegunn/seoul256.vim'
"Plug 'thiagoalessio/rainbow_levels.vim'
"Plug 'jceb/vim-orgmode'
"Plug 'tpope/vim-speeddating' " required for orgmode
"Plug 'lambdalisue/vim-rplugin' " required from lista I guess
