DISABLE_UPDATE_PROMPT="true"

#if [ -f ~/.zshrc.extended ]; then
#    source ~/.zshrc.extended
#else
#    print ~/.zshrc.extended not found
#fi

# Stock
alias v="micro -softwrap true -diffgutter true -rmtrailingws true -tabstospaces true -tabmovement true -savecursor true -scrollbar true -xterm true -ruler false"
alias s="subl"
alias sv="sudo vim"
alias x="exit"
alias ra="sudo service apache2 restart"
alias targz="tar xvzf"
alias mv="mv -iv"
alias cp="cp -iv"
alias mkdir="mkdir -vp"
alias f="find ./ -name"

# SSH
alias sshc="ssh -Y"
alias sendkey="ssh-copy-id -i"

# Rust tools
alias r="rg --no-ignore --hidden"
alias search="fd --no-ignore --hidden"
#alias sizeof="~/Sync/bin/dust"
#alias fz="~/Sync/bin/sk"
#alias markdown="~/Sync/bin/mdcat"

# Apt
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias install="sudo apt-get install -y"

# PHP / Composer
alias ci="composer install -vvv"
alias cu="composer update -vvv"
alias c72="php7.2 /usr/local/bin/composer"
alias c74="php7.4 /usr/local/bin/composer"
alias c80="php8.0 /usr/local/bin/composer"
alias c81="php8.1 /usr/local/bin/composer"
alias ci72="php7.2 /usr/local/bin/composer install -vvv"
alias ci74="php7.4 /usr/local/bin/composer install -vvv"
alias ci80="php8.0 /usr/local/bin/composer install -vvv"
alias ci81="php8.1 /usr/local/bin/composer install -vvv"
alias cu72="php7.2 /usr/local/bin/composer update -vvv"
alias cu74="php7.4 /usr/local/bin/composer update -vvv"
alias cu80="php8.0 /usr/local/bin/composer update -vvv"
alias cu81="php8.1 /usr/local/bin/composer update -vvv"
alias pa="php artisan"
alias stan="./vendor/bin/phpstan analyse"
alias unit="./vendor/bin/phpunit"
alias difflock="~/.config/composer/vendor/bin/composer-lock-diff --md --from develop"

## Monolog
alias tailc="~/dotfiles/tailc.sh"
alias tailcm="~/dotfiles/bin/tailc-min.sh"

# Git
alias gs="git status"
alias gd="git diff"
#alias d="git -c core.pager='delta --syntax-theme=\"Monokai Extended\" --pager=\"less -R\"' -c interactive.diffFilter='delta --syntax-theme=\"Monokai Extended\" --color-only' -c delta.navigate=true -c merge.conflictstyle=diff3 -c diff.colorMoved=default diff"
alias d="git -c core.pager='delta --pager=\"less -R\"' -c interactive.diffFilter='delta --color-only' -c delta.navigate=true -c merge.conflictstyle=diff3 -c diff.colorMoved=default diff"
alias gds="git diff --staged"
alias gcu="git commit"
alias gc="git commit -S"
alias gi="git init"
alias undolastcommit="git reset --soft HEAD~1"
alias stashview="git stash show -p"
alias stashdelete="git stash drop stash@{0}"
alias gsreset="git submodule update --init --recursive"

# Docker
alias dquick='docker run --rm -it --init -v "$PWD":/dockervolume -w /dockervolume'
alias dexec="docker exec -it"
alias dstop='docker stop $(docker ps -a -q);'
alias dkill='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q)'
alias dbuild='docker build -t'

# Graveyard
#alias q="ddgr -x --np"
#alias q2="ddgr -x --np -n 2"
#alias q3="ddgr -x --np -n 3"
#alias qg="ddgr --gb --np \!g"
#alias t="tmux choose-tree"

# Remap ^D (ctrl-D, the EOT/EOF transmission) to ^W (ctrl-W)
stty eof ^W

# start zellij if it's available and not currently running
#if command -v zellij &> /dev/null && [ -n "$PS1" ] && [ -z "$ZELLIJ" ]; then
#  randomstr=`tr -dc A-Za-z </dev/urandom | head -c 4`
#  exec zellij --session "$randomstr"
#   eval "zellij attach || exec zellij options --simplified-ui=true --mouse-mode=false --no-pane-frames --layout ~/dotfiles/zellij/layout.kdl"
#   exec zellij options --simplified-ui=true --no-pane-frames
#fi

if command -v zoxide &> /dev/null && [ -n "$PS1" ]; then
  eval "$(zoxide init zsh)"
fi

if command -v exa &> /dev/null && [ -n "$PS1" ]; then
  alias ls="exa"
  # preview cd
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
  # preview z
  zstyle ':fzf-tab:complete:z:*' fzf-preview 'exa -1 --color=always $realpath'
fi

if command -v bat &> /dev/null && [ -n "$PS1" ]; then
  alias cat="bat --plain"
fi

# make it so fzf-tab detects hidden files
setopt globdots
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

(git -C ~/dotfiles pull &> /dev/null &) > /dev/null 2>&1

#if command -v vivid &> /dev/null && [ -n "$PS1" ]; then
#  export LS_COLORS="$(vivid generate ~/.config/vivid/themes/molokai)"
#fi

export LS_COLORS="*~=0;38;2;122;112;112:fi=0:sg=0:di=1;38;2;129;161;193:su=0:rs=0:cd=0;38;2;249;38;114;48;2;51;51;51:pi=0;38;2;0;0;0;48;2;102;217;239:ca=0:do=0;38;2;0;0;0;48;2;249;38;114:bd=0;38;2;102;217;239;48;2;51;51;51:ex=1;38;2;166;226;46:mh=0:no=0:tw=0:st=0:ln=0;38;2;102;217;239:ow=0:or=0;38;2;0;0;0;48;2;255;74;68:so=0;38;2;0;0;0;48;2;249;38;114:mi=0;38;2;0;0;0;48;2;255;74;68:*.c=0;38;2;0;255;135:*.o=0;38;2;122;112;112:*.h=0;38;2;0;255;135:*.a=1;38;2;249;38;114:*.d=0;38;2;0;255;135:*.t=0;38;2;0;255;135:*.z=4;38;2;230;219;116:*.r=0;38;2;0;255;135:*.p=0;38;2;0;255;135:*.m=0;38;2;0;255;135:*.ex=0;38;2;0;255;135:*.rb=0;38;2;0;255;135:*css=0;38;2;0;255;135:*.gv=0;38;2;0;255;135:*.rs=0;38;2;0;255;135:*.jl=0;38;2;0;255;135:*.vb=0;38;2;0;255;135:*.7z=4;38;2;230;219;116:*.cr=0;38;2;0;255;135:*.bc=0;38;2;122;112;112:*.di=0;38;2;0;255;135:*.ts=0;38;2;0;255;135:*.pp=0;38;2;0;255;135:*.ml=0;38;2;0;255;135:*.so=1;38;2;249;38;114:*.ll=0;38;2;0;255;135:*.go=0;38;2;0;255;135:*.hs=0;38;2;0;255;135:*.td=0;38;2;0;255;135:*.nb=0;38;2;0;255;135:*.mn=0;38;2;0;255;135:*.hh=0;38;2;0;255;135:*.pl=0;38;2;0;255;135:*.kt=0;38;2;0;255;135:*.cs=0;38;2;0;255;135:*.ko=1;38;2;249;38;114:*.py=0;38;2;0;255;135:*.md=0;38;2;249;38;114:*.pm=0;38;2;0;255;135:*.ui=0;38;2;163;190;140:*.sh=0;38;2;0;255;135:*.cp=0;38;2;0;255;135:*.js=0;38;2;182;182;182:*.el=0;38;2;0;255;135:*.wv=0;38;2;253;151;31:*.as=0;38;2;0;255;135:*.cc=0;38;2;0;255;135:*.bz=4;38;2;230;219;116:*.la=0;38;2;122;112;112:*.gz=4;38;2;230;219;116:*.hi=0;38;2;122;112;112:*.fs=0;38;2;0;255;135:*.rm=0;38;2;253;151;31:*.ps=0;38;2;230;219;116:*.xz=4;38;2;230;219;116:*.lo=0;38;2;122;112;112:*.bz2=4;38;2;230;219;116:*.bbl=0;38;2;122;112;112:*.svg=0;38;2;253;151;31:*.zsh=0;38;2;0;255;135:*.kts=0;38;2;0;255;135:*.m4v=0;38;2;253;151;31:*.rpm=4;38;2;230;219;116:*.tmp=0;38;2;122;112;112:*.htc=0;38;2;182;182;182:*.yml=0;38;2;163;190;140:*.psd=0;38;2;253;151;31:*.mid=0;38;2;253;151;31:*.otf=0;38;2;253;151;31:*.swp=0;38;2;122;112;112:*.zst=4;38;2;230;219;116:*.img=4;38;2;230;219;116:*.ilg=0;38;2;122;112;112:*.bcf=0;38;2;122;112;112:*.ods=0;38;2;230;219;116:*.iso=4;38;2;230;219;116:*.fsx=0;38;2;0;255;135:*.fsi=0;38;2;0;255;135:*.mov=0;38;2;253;151;31:*.mli=0;38;2;0;255;135:*.asa=0;38;2;0;255;135:*.xcf=0;38;2;253;151;31:*.flv=0;38;2;253;151;31:*.aif=0;38;2;253;151;31:*.txt=0;38;2;226;209;57:*.sxw=0;38;2;230;219;116:*.xmp=0;38;2;163;190;140:*.c++=0;38;2;0;255;135:*.epp=0;38;2;0;255;135:*.png=0;38;2;253;151;31:*.tex=0;38;2;0;255;135:*TODO=1:*.pdf=0;38;2;230;219;116:*.vcd=4;38;2;230;219;116:*.hxx=0;38;2;0;255;135:*.ltx=0;38;2;0;255;135:*.ics=0;38;2;230;219;116:*.def=0;38;2;0;255;135:*.cxx=0;38;2;0;255;135:*.exe=1;38;2;249;38;114:*.lua=0;38;2;0;255;135:*.nix=0;38;2;163;190;140:*.pkg=4;38;2;230;219;116:*.doc=0;38;2;230;219;116:*.dmg=4;38;2;230;219;116:*.arj=4;38;2;230;219;116:*.jar=4;38;2;230;219;116:*.tar=4;38;2;230;219;116:*.tgz=4;38;2;230;219;116:*.out=0;38;2;122;112;112:*.pyo=0;38;2;122;112;112:*.apk=4;38;2;230;219;116:*.pps=0;38;2;230;219;116:*.fnt=0;38;2;253;151;31:*.mkv=0;38;2;253;151;31:*.zip=4;38;2;230;219;116:*.xls=0;38;2;230;219;116:*.cpp=0;38;2;0;255;135:*.pas=0;38;2;0;255;135:*.tbz=4;38;2;230;219;116:*.com=1;38;2;249;38;114:*.clj=0;38;2;0;255;135:*.csx=0;38;2;0;255;135:*.sql=0;38;2;0;255;135:*.ipp=0;38;2;0;255;135:*.jpg=0;38;2;253;151;31:*.odp=0;38;2;230;219;116:*.awk=0;38;2;0;255;135:*.h++=0;38;2;0;255;135:*.wmv=0;38;2;253;151;31:*.dpr=0;38;2;0;255;135:*.ogg=0;38;2;253;151;31:*.odt=0;38;2;230;219;116:*.cfg=0;38;2;163;190;140:*.csv=0;38;2;182;182;182:*.htm=0;38;2;226;209;57:*.rtf=0;38;2;230;219;116:*.mpg=0;38;2;253;151;31:*.m4a=0;38;2;253;151;31:*.sxi=0;38;2;230;219;116:*.pyc=0;38;2;122;112;112:*.php=0;38;2;174;129;255:*.bib=0;38;2;163;190;140:*.toc=0;38;2;122;112;112:*.bst=0;38;2;163;190;140:*.ppm=0;38;2;253;151;31:*.pid=0;38;2;122;112;112:*.ind=0;38;2;122;112;112:*.rar=4;38;2;230;219;116:*.pod=0;38;2;0;255;135:*.avi=0;38;2;253;151;31:*.tsx=0;38;2;0;255;135:*.ico=0;38;2;253;151;31:*.dot=0;38;2;0;255;135:*.blg=0;38;2;122;112;112:*.eps=0;38;2;253;151;31:*.sbt=0;38;2;0;255;135:*.wma=0;38;2;253;151;31:*.tml=0;38;2;163;190;140:*.dox=0;38;2;166;226;46:*.vim=0;38;2;0;255;135:*.swf=0;38;2;253;151;31:*.hpp=0;38;2;0;255;135:*.tif=0;38;2;253;151;31:*.gvy=0;38;2;0;255;135:*.mp4=0;38;2;253;151;31:*.dll=1;38;2;249;38;114:*.pgm=0;38;2;253;151;31:*.bag=4;38;2;230;219;116:*.wav=0;38;2;253;151;31:*.git=0;38;2;122;112;112:*.xlr=0;38;2;230;219;116:*.rst=0;38;2;249;38;114:*.ppt=0;38;2;230;219;116:*.ini=0;38;2;163;190;140:*.bin=4;38;2;230;219;116:*.log=0;38;2;122;112;112:*.mp3=0;38;2;253;151;31:*.cgi=0;38;2;0;255;135:*.inl=0;38;2;0;255;135:*.deb=4;38;2;230;219;116:*.pro=0;38;2;166;226;46:*.mir=0;38;2;0;255;135:*.bsh=0;38;2;0;255;135:*.gif=0;38;2;253;151;31:*.sty=0;38;2;122;112;112:*.fon=0;38;2;253;151;31:*.elm=0;38;2;0;255;135:*.xml=0;38;2;182;182;182:*.exs=0;38;2;0;255;135:*.pyd=0;38;2;122;112;112:*.tcl=0;38;2;0;255;135:*.idx=0;38;2;122;112;112:*.inc=0;38;2;0;255;135:*hgrc=0;38;2;166;226;46:*.bat=1;38;2;249;38;114:*.kex=0;38;2;230;219;116:*.pbm=0;38;2;253;151;31:*.erl=0;38;2;0;255;135:*.ttf=0;38;2;253;151;31:*.aux=0;38;2;122;112;112:*.fls=0;38;2;122;112;112:*.vob=0;38;2;253;151;31:*.ps1=0;38;2;0;255;135:*.bak=0;38;2;122;112;112:*.bmp=0;38;2;253;151;31:*.lock=0;38;2;122;112;112:*.psd1=0;38;2;0;255;135:*.yaml=0;38;2;163;190;140:*.toml=0;38;2;163;190;140:*.tiff=0;38;2;253;151;31:*.xlsx=0;38;2;230;219;116:*.json=0;38;2;163;190;140:*.rlib=0;38;2;122;112;112:*.fish=0;38;2;0;255;135:*.tbz2=4;38;2;230;219;116:*.neon=0;38;2;163;190;140:*.orig=0;38;2;122;112;112:*.h264=0;38;2;253;151;31:*.html=0;38;2;226;209;57:*.lisp=0;38;2;0;255;135:*.conf=0;38;2;163;190;140:*.docx=0;38;2;230;219;116:*.less=0;38;2;0;255;135:*.bash=0;38;2;0;255;135:*.webm=0;38;2;253;151;31:*.flac=0;38;2;253;151;31:*.pptx=0;38;2;230;219;116:*.hgrc=0;38;2;166;226;46:*.mpeg=0;38;2;253;151;31:*.java=0;38;2;0;255;135:*.diff=0;38;2;0;255;135:*.jpeg=0;38;2;253;151;31:*.psm1=0;38;2;0;255;135:*.make=0;38;2;166;226;46:*.opus=0;38;2;253;151;31:*.epub=0;38;2;230;219;116:*.dart=0;38;2;0;255;135:*.purs=0;38;2;0;255;135:*.xhtml=0;38;2;226;209;57:*.ipynb=0;38;2;0;255;135:*.mdown=0;38;2;249;38;114:*.dyn_o=0;38;2;122;112;112:*.scala=0;38;2;0;255;135:*passwd=0;38;2;163;190;140:*shadow=0;38;2;163;190;140:*.cmake=0;38;2;166;226;46:*.toast=4;38;2;230;219;116:*.cabal=0;38;2;0;255;135:*.class=0;38;2;122;112;112:*.cache=0;38;2;122;112;112:*.patch=0;38;2;0;255;135:*.swift=0;38;2;0;255;135:*.shtml=0;38;2;226;209;57:*README=0;38;2;0;0;0;48;2;230;219;116:*.dyn_hi=0;38;2;122;112;112:*INSTALL=0;38;2;0;0;0;48;2;230;219;116:*.gradle=0;38;2;0;255;135:*.matlab=0;38;2;0;255;135:*COPYING=0;38;2;182;182;182:*.ignore=0;38;2;166;226;46:*.config=0;38;2;163;190;140:*TODO.md=1:*.groovy=0;38;2;0;255;135:*LICENSE=0;38;2;182;182;182:*.flake8=0;38;2;166;226;46:*Doxyfile=0;38;2;166;226;46:*.desktop=0;38;2;163;190;140:*.gemspec=0;38;2;166;226;46:*TODO.txt=1:*setup.py=0;38;2;166;226;46:*Makefile=0;38;2;166;226;46:*.rgignore=0;38;2;166;226;46:*.kdevelop=0;38;2;166;226;46:*.markdown=0;38;2;249;38;114:*.cmake.in=0;38;2;166;226;46:*COPYRIGHT=0;38;2;182;182;182:*configure=0;38;2;166;226;46:*.fdignore=0;38;2;166;226;46:*README.md=0;38;2;0;0;0;48;2;230;219;116:*.DS_Store=0;38;2;122;112;112:*SConstruct=0;38;2;166;226;46:*.scons_opt=0;38;2;122;112;112:*SConscript=0;38;2;166;226;46:*.gitconfig=0;38;2;166;226;46:*.gitignore=0;38;2;166;226;46:*README.txt=0;38;2;0;0;0;48;2;230;219;116:*.localized=0;38;2;122;112;112:*Dockerfile=0;38;2;163;190;140:*CODEOWNERS=0;38;2;166;226;46:*INSTALL.md=0;38;2;0;0;0;48;2;230;219;116:*Makefile.in=0;38;2;122;112;112:*.travis.yml=0;38;2;230;219;116:*MANIFEST.in=0;38;2;166;226;46:*LICENSE-MIT=0;38;2;182;182;182:*.synctex.gz=0;38;2;122;112;112:*.gitmodules=0;38;2;166;226;46:*Makefile.am=0;38;2;166;226;46:*INSTALL.txt=0;38;2;0;0;0;48;2;230;219;116:*configure.ac=0;38;2;166;226;46:*CONTRIBUTORS=0;38;2;0;0;0;48;2;230;219;116:*.applescript=0;38;2;0;255;135:*appveyor.yml=0;38;2;230;219;116:*.fdb_latexmk=0;38;2;122;112;112:*.clang-format=0;38;2;166;226;46:*.gitattributes=0;38;2;166;226;46:*LICENSE-APACHE=0;38;2;182;182;182:*CMakeLists.txt=0;38;2;166;226;46:*CMakeCache.txt=0;38;2;122;112;112:*CONTRIBUTORS.md=0;38;2;0;0;0;48;2;230;219;116:*requirements.txt=0;38;2;166;226;46:*CONTRIBUTORS.txt=0;38;2;0;0;0;48;2;230;219;116:*.sconsign.dblite=0;38;2;122;112;112:*package-lock.json=0;38;2;122;112;112:*.CFUserTextEncoding=0;38;2;122;112;112"

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
