DISABLE_UPDATE_PROMPT="true"

#if [ -f ~/.zshrc.extended ]; then
#    source ~/.zshrc.extended
#else
#    print ~/.zshrc.extended not found
#fi

# Stock
alias v="micro -softwrap true -diffgutter true -rmtrailingws true -tabstospaces true -tabmovement true -savecursor true -scrollbar true -xterm true -ruler false"
alias s="subl"
alias x="exit"
alias targz="tar xvzf"
alias mv="mv -iv"
alias cp="cp -iv"
alias mkdir="mkdir -vp"
alias f="find ./ -name"
function mkf {
    mkdir -vp $1 && cd $1
}

function replacestr {
    rg -l $1 | xargs -I "{}" sed -i "s/$1/$2/" "{}"
}

# SSH
alias sshc="ssh -Y"
alias sendkey="ssh-copy-id -i"

# Rust tools
alias r="rg --no-ignore --hidden"
alias search="fd --no-ignore --hidden"

# Apt
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias install="sudo apt-get install -y"

# PHP / Composer
alias ci="composer install -vvv"
alias cu="composer update -vvv"
alias pa="php artisan"
alias difflock="~/.config/composer/vendor/bin/composer-lock-diff --md --from master"

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
#alias gc="git commit -S" # git config --global commit.gpgsign true
alias gi="git init"
alias undolastcommit="git reset --soft HEAD~1"
alias stashview="git stash show -p"
alias stashdelete="git stash drop stash@{0}"
alias modupdate="git submodule update --init --recursive"

# Docker
alias dquick='docker run --rm -it --init -v "$PWD":/dockervolume -w /dockervolume'
alias dquickme='docker run --rm -it --init -v "$PWD":/dockervolume -w /dockervolume -u $(id -u):$(id -g)'
alias dr='docker run --rm -it --init -v "$PWD":/dockervolume -w /dockervolume'
alias n='docker run --net=host --rm -it --init -v "$PWD":/dockervolume -w /dockervolume -u $(id -u):$(id -g) node:18'
alias dc="docker compose"
alias dcd="docker compose down"
alias dcu="docker compose up"

#https://stackoverflow.com/questions/26961371/switch-on-another-branch-create-if-not-exists-without-checking-if-already-exi
#function bb {
#    git fetch;
#    git switch $1 2>/dev/null || git switch --create $1;
#}
#alias bb='f() { git fetch && git switch $1 2>/dev/null || git switch --create $1 };f'
#alias fo="git focus"

alias ports="sudo netstat -tunlp"

mkdir -p ~/.marks/
export CDPATH=.:~/.marks/
function mark { ln -sr "$(pwd)" ~/.marks/"$1"; }

#if [ -f ~/.openai ]; then
#    export OPENAI_API_KEY=$(cat ~/.openai)
#else
#    print Openai key not found
#fi

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
  alias cat="bat --plain --paging=never"
fi


# make it so fzf-tab detects hidden files
#setopt globdots
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# make it so . and .. aren't in tab completion
#setopt no_dotglob

(git -C ~/dotfiles pull &> /dev/null &) > /dev/null 2>&1

#if command -v vivid &> /dev/null && [ -n "$PS1" ]; then
#  export LS_COLORS="$(vivid generate ~/.config/vivid/themes/molokai)"
#fi

export LS_COLORS="cd=0;38;2;249;38;114;48;2;51;51;51:do=0;38;2;0;0;0;48;2;249;38;114:*~=0;38;2;122;112;112:ex=1;38;2;166;226;46:ln=0;38;2;102;217;239:mi=0;38;2;0;0;0;48;2;255;74;68:sg=0:rs=0:so=0;38;2;0;0;0;48;2;249;38;114:st=0:ca=0:pi=0;38;2;0;0;0;48;2;102;217;239:di=1;38;2;129;161;193:no=0:bd=0;38;2;102;217;239;48;2;51;51;51:tw=0:su=0:mh=0:or=0;38;2;0;0;0;48;2;255;74;68:ow=0:fi=0:*.o=0;38;2;122;112;112:*.h=0;38;2;0;255;135:*.t=0;38;2;0;255;135:*.d=0;38;2;0;255;135:*.m=0;38;2;0;255;135:*.a=1;38;2;249;38;114:*.c=0;38;2;0;255;135:*.r=0;38;2;0;255;135:*.p=0;38;2;0;255;135:*.z=4;38;2;230;219;116:*.as=0;38;2;0;255;135:*.cr=0;38;2;0;255;135:*.ui=0;38;2;163;190;140:*.7z=4;38;2;230;219;116:*.rm=0;38;2;253;151;31:*.di=0;38;2;0;255;135:*.bz=4;38;2;230;219;116:*.gz=4;38;2;230;219;116:*.td=0;38;2;0;255;135:*.la=0;38;2;122;112;112:*.pl=0;38;2;0;255;135:*.cp=0;38;2;0;255;135:*.xz=4;38;2;230;219;116:*.md=0;38;2;249;38;114:*.ex=0;38;2;0;255;135:*.rb=0;38;2;0;255;135:*.sh=0;38;2;0;255;135:*.vb=0;38;2;0;255;135:*.cs=0;38;2;0;255;135:*.ll=0;38;2;0;255;135:*.rs=0;38;2;0;255;135:*.jl=0;38;2;0;255;135:*.js=0;38;2;182;182;182:*.bc=0;38;2;122;112;112:*.py=0;38;2;0;255;135:*.gv=0;38;2;0;255;135:*.cc=0;38;2;0;255;135:*.so=1;38;2;249;38;114:*.kt=0;38;2;0;255;135:*.el=0;38;2;0;255;135:*.wv=0;38;2;253;151;31:*.ml=0;38;2;0;255;135:*.pm=0;38;2;0;255;135:*.hi=0;38;2;122;112;112:*.fs=0;38;2;0;255;135:*.hh=0;38;2;0;255;135:*.ko=1;38;2;249;38;114:*.ps=0;38;2;230;219;116:*.pp=0;38;2;0;255;135:*.lo=0;38;2;122;112;112:*.mn=0;38;2;0;255;135:*.hs=0;38;2;0;255;135:*.nb=0;38;2;0;255;135:*.go=0;38;2;0;255;135:*.ts=0;38;2;0;255;135:*.wav=0;38;2;253;151;31:*.vim=0;38;2;0;255;135:*.mir=0;38;2;0;255;135:*.bsh=0;38;2;0;255;135:*.iso=4;38;2;230;219;116:*.c++=0;38;2;0;255;135:*.idx=0;38;2;122;112;112:*.ps1=0;38;2;0;255;135:*.tml=0;38;2;163;190;140:*.tcl=0;38;2;0;255;135:*.out=0;38;2;122;112;112:*.htc=0;38;2;182;182;182:*.bak=0;38;2;122;112;112:*.pyc=0;38;2;122;112;112:*.exs=0;38;2;0;255;135:*.exe=1;38;2;249;38;114:*.dox=0;38;2;166;226;46:*.apk=4;38;2;230;219;116:*.pas=0;38;2;0;255;135:*.dll=1;38;2;249;38;114:*.mov=0;38;2;253;151;31:*.ppm=0;38;2;253;151;31:*.aux=0;38;2;122;112;112:*.bz2=4;38;2;230;219;116:*.epp=0;38;2;0;255;135:*.img=4;38;2;230;219;116:*.bcf=0;38;2;122;112;112:*.rpm=4;38;2;230;219;116:*.vue=0;38;2;182;182;182:*.ods=0;38;2;230;219;116:*.pro=0;38;2;166;226;46:*.ico=0;38;2;253;151;31:*.pbm=0;38;2;253;151;31:*.ics=0;38;2;230;219;116:*.vob=0;38;2;253;151;31:*.elm=0;38;2;0;255;135:*.txt=0;38;2;226;209;57:*.xml=0;38;2;182;182;182:*.ini=0;38;2;163;190;140:*.cpp=0;38;2;0;255;135:*.bib=0;38;2;163;190;140:*.wma=0;38;2;253;151;31:*.pdf=0;38;2;230;219;116:*.svg=0;38;2;253;151;31:*.ilg=0;38;2;122;112;112:*.gvy=0;38;2;0;255;135:*.dpr=0;38;2;0;255;135:*.doc=0;38;2;230;219;116:*.bmp=0;38;2;253;151;31:*.bst=0;38;2;163;190;140:*.swp=0;38;2;122;112;112:*.erl=0;38;2;0;255;135:*.sql=0;38;2;0;255;135:*.rtf=0;38;2;230;219;116:*.bin=4;38;2;230;219;116:*.jar=4;38;2;230;219;116:*.cgi=0;38;2;0;255;135:*.h++=0;38;2;0;255;135:*.fon=0;38;2;253;151;31:*.ppt=0;38;2;230;219;116:*.tsx=0;38;2;0;255;135:*.mid=0;38;2;253;151;31:*.hpp=0;38;2;0;255;135:*.htm=0;38;2;226;209;57:*.pgm=0;38;2;253;151;31:*.blg=0;38;2;122;112;112:*.pkg=4;38;2;230;219;116:*.odt=0;38;2;230;219;116:*.fnt=0;38;2;253;151;31:*.png=0;38;2;253;151;31:*.mp3=0;38;2;253;151;31:*.git=0;38;2;122;112;112:*.csv=0;38;2;182;182;182:*.deb=4;38;2;230;219;116:*.csx=0;38;2;0;255;135:*.hxx=0;38;2;0;255;135:*.gif=0;38;2;253;151;31:*.inc=0;38;2;0;255;135:*.pid=0;38;2;122;112;112:*.tar=4;38;2;230;219;116:*.pod=0;38;2;0;255;135:*.odp=0;38;2;230;219;116:*.cxx=0;38;2;0;255;135:*.arj=4;38;2;230;219;116:*.cfg=0;38;2;163;190;140:*.php=0;38;2;174;129;255:*.xcf=0;38;2;253;151;31:*.tmp=0;38;2;122;112;112:*.zst=4;38;2;230;219;116:*.psd=0;38;2;253;151;31:*.pps=0;38;2;230;219;116:*.zip=4;38;2;230;219;116:*.flv=0;38;2;253;151;31:*.xlr=0;38;2;230;219;116:*.def=0;38;2;0;255;135:*.ipp=0;38;2;0;255;135:*.mp4=0;38;2;253;151;31:*.fls=0;38;2;122;112;112:*.clj=0;38;2;0;255;135:*.aif=0;38;2;253;151;31:*.log=0;38;2;122;112;112:*.jpg=0;38;2;253;151;31:*.tif=0;38;2;253;151;31:*.tex=0;38;2;0;255;135:*.sxi=0;38;2;230;219;116:*.xls=0;38;2;230;219;116:*.m4v=0;38;2;253;151;31:*.bbl=0;38;2;122;112;112:*.yml=0;38;2;163;190;140:*.zsh=0;38;2;0;255;135:*.bag=4;38;2;230;219;116:*.xmp=0;38;2;163;190;140:*.tbz=4;38;2;230;219;116:*.sxw=0;38;2;230;219;116:*.nix=0;38;2;163;190;140:*.tgz=4;38;2;230;219;116:*.rar=4;38;2;230;219;116:*hgrc=0;38;2;166;226;46:*.asa=0;38;2;0;255;135:*TODO=1:*.mkv=0;38;2;253;151;31:*.fsi=0;38;2;0;255;135:*.mpg=0;38;2;253;151;31:*.vcd=4;38;2;230;219;116:*.dot=0;38;2;0;255;135:*.ind=0;38;2;122;112;112:*.otf=0;38;2;253;151;31:*.inl=0;38;2;0;255;135:*.lua=0;38;2;0;255;135:*.mli=0;38;2;0;255;135:*.wmv=0;38;2;253;151;31:*.kts=0;38;2;0;255;135:*.css=0;38;2;51;51;51:*.fsx=0;38;2;0;255;135:*.pyo=0;38;2;122;112;112:*.toc=0;38;2;122;112;112:*.sty=0;38;2;122;112;112:*.com=1;38;2;249;38;114:*.ltx=0;38;2;0;255;135:*.bat=1;38;2;249;38;114:*.ogg=0;38;2;253;151;31:*.eps=0;38;2;253;151;31:*.awk=0;38;2;0;255;135:*.swf=0;38;2;253;151;31:*.rst=0;38;2;249;38;114:*.avi=0;38;2;253;151;31:*.pyd=0;38;2;122;112;112:*.dmg=4;38;2;230;219;116:*.sbt=0;38;2;0;255;135:*.ttf=0;38;2;253;151;31:*.kex=0;38;2;230;219;116:*.m4a=0;38;2;253;151;31:*.hgrc=0;38;2;166;226;46:*.psm1=0;38;2;0;255;135:*.make=0;38;2;166;226;46:*.yaml=0;38;2;163;190;140:*.purs=0;38;2;0;255;135:*.flac=0;38;2;253;151;31:*.dart=0;38;2;0;255;135:*.diff=0;38;2;0;255;135:*.conf=0;38;2;163;190;140:*.neon=0;38;2;163;190;140:*.orig=0;38;2;122;112;112:*.java=0;38;2;0;255;135:*.bash=0;38;2;0;255;135:*.xlsx=0;38;2;230;219;116:*.epub=0;38;2;230;219;116:*.tiff=0;38;2;253;151;31:*.pptx=0;38;2;230;219;116:*.json=0;38;2;163;190;140:*.rlib=0;38;2;122;112;112:*.jpeg=0;38;2;253;151;31:*.lock=0;38;2;122;112;112:*.toml=0;38;2;163;190;140:*.webm=0;38;2;253;151;31:*.h264=0;38;2;253;151;31:*.tbz2=4;38;2;230;219;116:*.lisp=0;38;2;0;255;135:*.html=0;38;2;226;209;57:*.psd1=0;38;2;0;255;135:*.fish=0;38;2;0;255;135:*.scss=0;38;2;51;51;51:*.mpeg=0;38;2;253;151;31:*.docx=0;38;2;230;219;116:*.opus=0;38;2;253;151;31:*.less=0;38;2;0;255;135:*.mdown=0;38;2;249;38;114:*README=0;38;2;0;0;0;48;2;230;219;116:*.ipynb=0;38;2;0;255;135:*shadow=0;38;2;163;190;140:*.class=0;38;2;122;112;112:*.cabal=0;38;2;0;255;135:*.xhtml=0;38;2;226;209;57:*.dyn_o=0;38;2;122;112;112:*.patch=0;38;2;0;255;135:*.toast=4;38;2;230;219;116:*passwd=0;38;2;163;190;140:*.scala=0;38;2;0;255;135:*.cmake=0;38;2;166;226;46:*.shtml=0;38;2;226;209;57:*.swift=0;38;2;0;255;135:*.cache=0;38;2;122;112;112:*COPYING=0;38;2;182;182;182:*.dyn_hi=0;38;2;122;112;112:*.config=0;38;2;163;190;140:*INSTALL=0;38;2;0;0;0;48;2;230;219;116:*.matlab=0;38;2;0;255;135:*.flake8=0;38;2;166;226;46:*LICENSE=0;38;2;182;182;182:*.ignore=0;38;2;166;226;46:*.gradle=0;38;2;0;255;135:*.groovy=0;38;2;0;255;135:*TODO.md=1:*Doxyfile=0;38;2;166;226;46:*.gemspec=0;38;2;166;226;46:*TODO.txt=1:*setup.py=0;38;2;166;226;46:*Makefile=0;38;2;166;226;46:*.desktop=0;38;2;163;190;140:*.DS_Store=0;38;2;122;112;112:*.kdevelop=0;38;2;166;226;46:*.fdignore=0;38;2;166;226;46:*README.md=0;38;2;0;0;0;48;2;230;219;116:*.rgignore=0;38;2;166;226;46:*COPYRIGHT=0;38;2;182;182;182:*configure=0;38;2;166;226;46:*.markdown=0;38;2;249;38;114:*.cmake.in=0;38;2;166;226;46:*SConstruct=0;38;2;166;226;46:*.gitignore=0;38;2;166;226;46:*SConscript=0;38;2;166;226;46:*INSTALL.md=0;38;2;0;0;0;48;2;230;219;116:*CODEOWNERS=0;38;2;166;226;46:*README.txt=0;38;2;0;0;0;48;2;230;219;116:*.localized=0;38;2;122;112;112:*Dockerfile=0;38;2;163;190;140:*.gitconfig=0;38;2;166;226;46:*.scons_opt=0;38;2;122;112;112:*INSTALL.txt=0;38;2;0;0;0;48;2;230;219;116:*.gitmodules=0;38;2;166;226;46:*Makefile.am=0;38;2;166;226;46:*.synctex.gz=0;38;2;122;112;112:*.travis.yml=0;38;2;230;219;116:*Makefile.in=0;38;2;122;112;112:*MANIFEST.in=0;38;2;166;226;46:*LICENSE-MIT=0;38;2;182;182;182:*.applescript=0;38;2;0;255;135:*.fdb_latexmk=0;38;2;122;112;112:*configure.ac=0;38;2;166;226;46:*CONTRIBUTORS=0;38;2;0;0;0;48;2;230;219;116:*appveyor.yml=0;38;2;230;219;116:*.clang-format=0;38;2;166;226;46:*CMakeCache.txt=0;38;2;122;112;112:*.gitattributes=0;38;2;166;226;46:*CMakeLists.txt=0;38;2;166;226;46:*LICENSE-APACHE=0;38;2;182;182;182:*CONTRIBUTORS.md=0;38;2;0;0;0;48;2;230;219;116:*requirements.txt=0;38;2;166;226;46:*.sconsign.dblite=0;38;2;122;112;112:*CONTRIBUTORS.txt=0;38;2;0;0;0;48;2;230;219;116:*package-lock.json=0;38;2;122;112;112:*.CFUserTextEncoding=0;38;2;122;112;112"

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# tree -Cfi | fzf --tac --ansi --border --preview 'bat --color=always {}'
export FZF_CTRL_T_COMMAND="tree -Cfi"
if command -v bat &> /dev/null && [ -n "$PS1" ]; then
  export FZF_CTRL_T_OPTS="--tac --ansi --border"
else
  export FZF_CTRL_T_OPTS="--tac --ansi --border --preview 'bat --color=always {}'"
fi
