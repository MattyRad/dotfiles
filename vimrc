" Config is merged from base vimrc at https://github.com/amix/vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid                                " https://github.com/neovim/neovim/issues/4524

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw                         " https://www.reddit.com/r/vim/comments/8m0632/what_performance_related_things_do_you_have_in/

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <C-space> ?

" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Close the current buffer
"map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
"map <leader>ba :bufdo bd<cr>

"map <leader>l :bnext<cr>
"map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove
"map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
"let g:lasttab = 1
"nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
"au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
"map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for some filetypes ;)
"fun! CleanExtraSpaces()
"    let save_cursor = getpos(".")
"    let old_query = getreg('/')
"    silent! %s/\s\+$//e
"    call setpos('.', save_cursor)
"    call setreg('/', old_query)
"endfun

"if has("autocmd")
"    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
"endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font according to system
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"try
"    set undodir=~/.vim_runtime/temp_dirs/undodir
"    set undofile
"catch
"endtry
" note: this is useful in theory, but I actually find that it's harder to remember where I stopped


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Make sure that enter is never overriden in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>



















"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Start personal section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!mkdir -p ~/.vim/autoload && wget -O ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    execute '!mkdir -p ~/.config/nvim; ln -s ~/.vimrc ~/.config/nvim/init.vim'
    autocmd VimEnter * PlugInstall
endif

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
    Plug 'ervandew/supertab'                              " tag completion
    Plug 'Raimondi/delimitMate'                           " matching delimiters
    Plug 'ryanoasis/vim-devicons'                         " icons in buffers etc
    Plug 'lambdalisue/lista.nvim'                         " line filtering per file
    "Plug 'scrooloose/nerdtree'
    "if executable('node')
    ""    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "endif
    Plug 'psliwka/vim-smoothie'
    Plug 'ojroques/vim-scrollstatus'
call plug#end()

" Pending review
"Plug 'Xuyuanp/scrollbar.nvim'                         " scrollbars
"Plug 'obcat/vim-sclow'
"if executable('cargo')
"    Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'} " minimap for scrolling
"endif
" https://github.com/lunixbochs/ActualVim
"Plug 'lornix/vim-scrollbar'
"Plug 'Zarainia/vim-scrollbar'
"Plug 'severin-lemaignan/vim-minimap'
"Plug 'vim-syntastic/syntastic'                        " language checking tool
" https://github.com/vim-ctrlspace/vim-ctrlspace
" https://github.com/liuchengxu/vim-clap
" https://github.com/editor-bootstrap/vim-bootstrap
" https://github.com/vim-awesome/vim-awesome
" https://github.com/Raimondi/delimitMate
" https://github.com/prabirshrestha/vim-lsp
" https://github.com/Shougo/denite.nvim
" https://github.com/justinmk/vim-sneak
" https://github.com/mhinz/vim-signify
" https://github.com/godlygeek/tabular
" https://github.com/tpope/vim-unimpaired
" https://github.com/wincent/command-t
" https://github.com/ervandew/supertab
" https://github.com/jiangmiao/auto-pairs
" https://github.com/autozimu/LanguageClient-neovim
" https://github.com/Yggdroot/indentLine
" https://github.com/junegunn/vim-easy-align
" https://github.com/tpope/vim-sensible
" https://github.com/davidhalter/jedi-vim
" https://github.com/Shougo/deoplete.nvim
" https://github.com/vimwiki/vimwiki
" https://github.com/square/maximum-awesome
" https://github.com/easymotion/vim-easymotion
" https://github.com/yangyangwithgnu/use_vim_as_ide
" https://github.com/jarun/nnn
" https://github.com/dense-analysis/ale
" https://github.com/mhinz/vim-galore
" https://github.com/spf13/spf13-vim
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'majutsushi/tagbar'
"Plug 'tpope/vim-sleuth'
"Plug 'unblevable/quick-scope'
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
let g:VM_maps['Add Cursor Down']    = '<S-A-down>'
let g:VM_maps['Add Cursor Up']      = '<S-A-up>'

let g:VM_mouse_mappings = 1               " some text
let g:VM_highlight_matches = 'underline'   " some text
"""""""""""""""""""""""
""" END VIM-VISUAL-MULTI
"""""""""""""""""""""""

" https://www.reddit.com/r/vim/comments/3hwall/how_to_close_vim_when_last_buffer_is_deleted/
function! CloseOnLast()
    let cnt = 0

    for i in range(0, bufnr("$"))
        if buflisted(i)
            let cnt += 1
        endif
    endfor

    if cnt <= 1
        q
    else
        bw
    endif
 endfunction

" nvim
" somehow nvim changes beam cursors to block cursors https://github.com/neovim/neovim/issues/6005
set guicursor=

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" copy/paste - https://unix.stackexchange.com/questions/12535/how-to-copy-text-from-vim-to-an-external-program
"set clipboard=unnamedplus
"nnoremap y "*y
"vnoremap y "*y
"nnoremap <C-p> "*gP
"vnoremap <C-p> "*gP

" nerdtree
" Start NERDTree
" autoopen
"autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
"autocmd VimEnter * wincmd p
" autoclose if it's the last thing open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
" end vim ctrlspace

" vim-gitgutter
"let g:gitgutter_set_sign_backgrounds = 1
set updatetime=20                                  " improve delay to show changes

autocmd BufWritePre * %s/\s\+$//e       " trim trailing whitespace

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Rooter
let g:rooter_silent_chdir = 1                       " To stop Rooter echoing the project directory

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_x = '%{ScrollStatus()}'
let g:airline_section_y = airline#section#create_right(['filetype'])
let g:airline_section_z = airline#section#create([
            \ '%#__accent_bold#%3l%#__restore__#/%L', ' ',
            \ '%#__accent_bold#%3v%#__restore__#/%3{virtcol("$") - 1}',
            \ ])
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
let g:coc_disable_startup_warning = 1
"set cmdheight=2
"set shortmess+=c
"set signcolumn=yes
"set shell=/bin/sh

" Line numbers
"set number " Line numbers
"highlight LineNr term=bold cterm=NONE ctermfg=Black ctermbg=NONE gui=NONE guifg=Black guibg=NONE

" One dark theme
" https://stackoverflow.com/questions/5698284/in-my-vimrc-how-can-i-check-for-the-existence-of-a-color-scheme
function! HasColorScheme(name) abort
    let pat = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, pat))
endfunction

let g:onedark_terminal_italics = 1
" onedark.vim override: Don't set a background color when running in a terminal;
if (has("autocmd") && !has("gui_running") && exists("onedark"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

if HasColorScheme('onedark')
    colorscheme onedark
elseif
    colorscheme peachpuff
endif

"set mouse-=a                            " Mouse off
set mouse=a

" Mappings
nnoremap r caw
nnoremap <C-f> :Lista<cr>
vnoremap r <esc>caw
nnoremap <A-up> :MRU<cr>
nnoremap <C-w> :call CloseBufferOrQuit()<cr>
nnoremap <C-x> dd
inoremap rr <esc>caw
" phone help
nnoremap hh ^ii
nnoremap ll A
" Buffers
nnoremap <A-left> :bp<cr>
nnoremap <A-right> :bn<cr>
" grab and shift lines like sublime
nnoremap <C-S-up> :m -2<cr>
nnoremap <C-S-down> :m +1<cr>
vnoremap <C-S-down> :m '>+1<CR>gv=gv
vnoremap <C-S-up> :m '<-2<CR>gv=gv
nnoremap <C-S-left> vb
nnoremap <C-S-right> vw
nnoremap <S-up> v<up>
nnoremap <S-down> v<down>
vnoremap <S-up> <up>
vnoremap <S-down> <down>
nnoremap <C-c> yy
nnoremap <C-v> p
nnoremap <C-x> dd
nnoremap <C-down> o
nnoremap <C-up> O

inoremap <C-down> <esc>oi
inoremap <C-up> <esc>Oi

inoremap <C-x> <esc>ddi
inoremap <C-v> <esc>pi

nnoremap <S-home> v<S-home>
nnoremap <S-end> v<S-end><left>

vnoremap <C-x> di
vnoremap <C-p> <esc>p

inoremap <C-v> <esc>pi

nnoremap <C-z> u
nnoremap <C-S-z> r

vnoremap <C-z> <esc>u
vnoremap <C-S-z> <esc>r

inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>
vnoremap <C-s> <esc>:w<cr>


inoremap <C-q> <esc>
vnoremap <C-q> <esc>

nnoremap <C-left> b
nnoremap <C-right> e<right>

inoremap <C-left> <esc>b
inoremap <C-right> <esc>e<right>

nnoremap <C-A-down> :call CloseOnLast()<CR>

" Tabbing
set smartindent
set cindent
set autoindent
set softtabstop=4
set copyindent

" Optimizations
" https://www.reddit.com/r/vim/comments/7m0632/what_performance_related_things_do_you_have_in/
let loaded_matchparen = 1
set synmaxcol=200

set ve+=onemore                        " where have you been all my life https://superuser.com/questions/918500/how-to-set-cursor-to-after-last-character-in-vim
nnoremap <end> $li
nnoremap <home> ^i

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

" https://vi.stackexchange.com/questions/6730/how-to-get-rid-of-the-command-line-bar
set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line bar
