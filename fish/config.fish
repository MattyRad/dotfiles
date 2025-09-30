
set -gx DISABLE_UPDATE_PROMPT "true"

#if [ -f ~/.fishrc.extended ]; then
#    source ~/.fishrc.extended
#else
#    print ~/.fishrc.extended not found
#fi

# theme
set -U fish_color_normal normal
set -U fish_color_command a1b56c
set -U fish_color_quote f7ca88
set -U fish_color_redirection d8d8d8
set -U fish_color_end ba8baf
set -U fish_color_error ab4642
set -U fish_color_param d8d8d8
set -U fish_color_comment f7ca88
set -U fish_color_match 7cafc2
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 7cafc2
set -U fish_color_escape 86c1b9
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 585858
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix normal --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan

# Oh my zsh git aliases
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gav='git add --verbose'
alias gap='git apply'
alias gapt='git apply --3way'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcans!='git commit -v -a -s --no-edit --amend'
alias gcam='git commit -a -m'
alias gcsm='git commit -s -m'
alias gcas='git commit -a -s'
alias gcasm='git commit -a -s -m'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gcl='git clone --recurse-submodules'
alias gclean='git clean -id'
alias gpristine='git reset --hard && git clean -dffx'
#alias gcm='git checkout $(git_main_branch)'
#alias gcd='git checkout $(git_develop_branch)'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcor='git checkout --recurse-submodules'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S'
alias gcss='git commit -S -s'
alias gcssm='git commit -S -s -m'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
#alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdup='git diff @{upstream}'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfo='git fetch origin'
alias gfg='git ls-files | grep'
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias ggpur='ggu'
#alias ggpull='git pull origin "$(git_current_branch)"'
#alias ggpush='git push origin "$(git_current_branch)"'
#alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
#alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias ghh='git help'
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
#alias git-svn-dcommit-push='git svn dcommit && git push github $(git_main_branch):svntrunk'
alias gk='\gitk --all --branches &!'
#alias gke='\gitk --all $(git log -g --pretty=%h) &!'
alias gl='git pull'
alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glp="_git_log_prettily"
alias gm='git merge'
#alias gmom='git merge origin/$(git_main_branch)'
alias gmtl='git mergetool --no-prompt'
alias gmtlvim='git mergetool --no-prompt --tool=vimdiff'
#alias gmum='git merge upstream/$(git_main_branch)'
alias gma='git merge --abort'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias gpoat='git push origin --all && git push origin --tags'
alias gpr='git pull --rebase'
alias gpu='git push upstream'
alias gpv='git push -v'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
#alias grbd='git rebase $(git_develop_branch)'
alias grbi='git rebase -i'
#alias grbm='git rebase $(git_main_branch)'
#alias grbom='git rebase origin/$(git_main_branch)'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
alias grev='git revert'
alias grh='git reset'
alias grhh='git reset --hard'
#alias groh='git reset origin/$(git_current_branch) --hard'
alias grm='git rm'
alias grmc='git rm --cached'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grs='git restore'
alias grset='git remote set-url'
alias grss='git restore --source'
alias grst='git restore --staged'
#alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'
alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsh='git show'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gstu='gsta --include-untracked'
alias gstall='git stash --all'
alias gsu='git submodule update'
alias gsw='git switch'
alias gswc='git switch -c'
#alias gswm='git switch $(git_main_branch)'
#alias gswd='git switch $(git_develop_branch)'
alias gts='git tag -s'
alias gtv='git tag | sort -V'
#alias gtl='gtl(){ git tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias gupa='git pull --rebase --autostash'
alias gupav='git pull --rebase --autostash -v'
#alias glum='git pull upstream $(git_main_branch)'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
#alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gam='git am'
alias gamc='git am --continue'
alias gams='git am --skip'
alias gama='git am --abort'
alias gamscp='git am --show-current-patch'


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

function mkf
    mkdir -vp $argv[1] && cd $argv[1]
end

function replacestr
    rg -l $argv[1] | xargs -I "{}" sed -i "s/$argv[1]/$argv[2]/" "{}"
end

# SSH
alias sshc="ssh -Y"
alias sendkey="ssh-copy-id -i"

# Rust tools
alias r="rg --no-ignore --hidden"
alias search="fd --no-ignore --hidden"

alias st="spice log short"
alias stl="spice log long"
alias b="spice"

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
alias ci72="php7.2 /usr/local/bin/composer install -vvv"
alias ci74="php7.4 /usr/local/bin/composer install -vvv"
alias ci80="php8.0 /usr/local/bin/composer install -vvv"
alias cu72="php7.2 /usr/local/bin/composer update -vvv"
alias cu74="php7.4 /usr/local/bin/composer update -vvv"
alias cu80="php8.0 /usr/local/bin/composer update -vvv"
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
alias modupdate="git submodule update --init --recursive"

# Docker
alias dquick='docker run --rm -it --init -v "$PWD":/dockervolume -w /dockervolume'
alias dexec="docker exec -it"
alias dstop='docker stop $(docker ps -a -q);'
alias dkill='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q)'
alias dbuild='docker build -t'

alias dquickme='docker run --rm -it --init -v "$PWD":/dockervolume -w /dockervolume -u $(id -u):$(id -g)'
alias dr='docker run --rm -it --init -v "$PWD":/dockervolume -w /dockervolume'
alias n='docker run --net=host --rm -it --init -v "$PWD":/dockervolume -w /dockervolume -u $(id -u):$(id -g) node:18'
alias dc="docker compose"
alias dcd="docker compose down"
alias dcu="docker compose up"

alias ports="sudo netstat -tunlp"
if not test -d ~/.marks/
    mkdir -p ~/.marks/
end
set -gx CDPATH .:~/.marks/
function mark
    ln -sr (pwd) ~/.marks/$argv[1]
end

# Graveyard
#alias q="ddgr -x --np"
#alias q2="ddgr -x --np -n 2"
#alias q3="ddgr -x --np -n 3"
#alias qg="ddgr --gb --np \!g"
#alias t="tmux choose-tree"

# Search based on prefix of command, not entire commands
bind \e\[A history-prefix-search-backward
bind \e\[B history-prefix-search-forward

bind \cw 'exit'

# Set pager to clear the screen when done
export LESS="-R $LESS"

# Sync dotfiles
git -C ~/dotfiles pull &> /dev/null &

set -U FZF_COMPLETE 2

# https://github.com/fish-shell/fish-shell/issues/2904
#bind \cc 'echo; commandline | cat; commandline ""; commandline -f repaint'
bind \cc 'echo; commandline ""; commandline -f repaint'

set fish_greeting

if type -q zoxide
  zoxide init fish | source
end

if type -q exa
  alias ls="exa"
end

if type -q bat
  alias cat="bat --plain --paging=never"
end
set -gx FZF_CTRL_T_COMMAND "tree -Cfi"
if type -q bat
  set -gx FZF_CTRL_T_OPTS "--tac --ansi --border"
else
  set -gx FZF_CTRL_T_OPTS "--tac --ansi --border --preview 'bat --color=always {}'"
end

set -gx LS_COLORS "cd=0;38;2;249;38;114;48;2;51;51;51:do=0;38;2;0;0;0;48;2;249;38;114:*~=0;38;2;122;112;112:ex=1;38;2;166;226;46:ln=0;38;2;102;217;239:mi=0;38;2;0;0;0;48;2;255;74;68:sg=0:rs=0:so=0;38;2;0;0;0;48;2;249;38;114:st=0:ca=0:pi=0;38;2;0;0;0;48;2;102;217;239:di=1;38;2;129;161;193:no=0:bd=0;38;2;102;217;239;48;2;51;51;51:tw=0:su=0:mh=0:or=0;38;2;0;0;0;48;2;255;74;68:ow=0:fi=0:*.o=0;38;2;122;112;112:*.h=0;38;2;0;255;135:*.t=0;38;2;0;255;135:*.d=0;38;2;0;255;135:*.m=0;38;2;0;255;135:*.a=1;38;2;249;38;114:*.c=0;38;2;0;255;135:*.r=0;38;2;0;255;135:*.p=0;38;2;0;255;135:*.z=4;38;2;230;219;116:*.as=0;38;2;0;255;135:*.cr=0;38;2;0;255;135:*.ui=0;38;2;163;190;140:*.7z=4;38;2;230;219;116:*.rm=0;38;2;253;151;31:*.di=0;38;2;0;255;135:*.bz=4;38;2;230;219;116:*.gz=4;38;2;230;219;116:*.td=0;38;2;0;255;135:*.la=0;38;2;122;112;112:*.pl=0;38;2;0;255;135:*.cp=0;38;2;0;255;135:*.xz=4;38;2;230;219;116:*.md=0;38;2;249;38;114:*.ex=0;38;2;0;255;135:*.rb=0;38;2;0;255;135:*.sh=0;38;2;0;255;135:*.vb=0;38;2;0;255;135:*.cs=0;38;2;0;255;135:*.ll=0;38;2;0;255;135:*.rs=0;38;2;0;255;135:*.jl=0;38;2;0;255;135:*.js=0;38;2;182;182;182:*.bc=0;38;2;122;112;112:*.py=0;38;2;0;255;135:*.gv=0;38;2;0;255;135:*.cc=0;38;2;0;255;135:*.so=1;38;2;249;38;114:*.kt=0;38;2;0;255;135:*.el=0;38;2;0;255;135:*.wv=0;38;2;253;151;31:*.ml=0;38;2;0;255;135:*.pm=0;38;2;0;255;135:*.hi=0;38;2;122;112;112:*.fs=0;38;2;0;255;135:*.hh=0;38;2;0;255;135:*.ko=1;38;2;249;38;114:*.ps=0;38;2;230;219;116:*.pp=0;38;2;0;255;135:*.lo=0;38;2;122;112;112:*.mn=0;38;2;0;255;135:*.hs=0;38;2;0;255;135:*.nb=0;38;2;0;255;135:*.go=0;38;2;0;255;135:*.ts=0;38;2;0;255;135:*.wav=0;38;2;253;151;31:*.vim=0;38;2;0;255;135:*.mir=0;38;2;0;255;135:*.bsh=0;38;2;0;255;135:*.iso=4;38;2;230;219;116:*.c++=0;38;2;0;255;135:*.idx=0;38;2;122;112;112:*.ps1=0;38;2;0;255;135:*.tml=0;38;2;163;190;140:*.tcl=0;38;2;0;255;135:*.out=0;38;2;122;112;112:*.htc=0;38;2;182;182;182:*.bak=0;38;2;122;112;112:*.pyc=0;38;2;122;112;112:*.exs=0;38;2;0;255;135:*.exe=1;38;2;249;38;114:*.dox=0;38;2;166;226;46:*.apk=4;38;2;230;219;116:*.pas=0;38;2;0;255;135:*.dll=1;38;2;249;38;114:*.mov=0;38;2;253;151;31:*.ppm=0;38;2;253;151;31:*.aux=0;38;2;122;112;112:*.bz2=4;38;2;230;219;116:*.epp=0;38;2;0;255;135:*.img=4;38;2;230;219;116:*.bcf=0;38;2;122;112;112:*.rpm=4;38;2;230;219;116:*.vue=0;38;2;182;182;182:*.ods=0;38;2;230;219;116:*.pro=0;38;2;166;226;46:*.ico=0;38;2;253;151;31:*.pbm=0;38;2;253;151;31:*.ics=0;38;2;230;219;116:*.vob=0;38;2;253;151;31:*.elm=0;38;2;0;255;135:*.txt=0;38;2;226;209;57:*.xml=0;38;2;182;182;182:*.ini=0;38;2;163;190;140:*.cpp=0;38;2;0;255;135:*.bib=0;38;2;163;190;140:*.wma=0;38;2;253;151;31:*.pdf=0;38;2;230;219;116:*.svg=0;38;2;253;151;31:*.ilg=0;38;2;122;112;112:*.gvy=0;38;2;0;255;135:*.dpr=0;38;2;0;255;135:*.doc=0;38;2;230;219;116:*.bmp=0;38;2;253;151;31:*.bst=0;38;2;163;190;140:*.swp=0;38;2;122;112;112:*.erl=0;38;2;0;255;135:*.sql=0;38;2;0;255;135:*.rtf=0;38;2;230;219;116:*.bin=4;38;2;230;219;116:*.jar=4;38;2;230;219;116:*.cgi=0;38;2;0;255;135:*.h++=0;38;2;0;255;135:*.fon=0;38;2;253;151;31:*.ppt=0;38;2;230;219;116:*.tsx=0;38;2;0;255;135:*.mid=0;38;2;253;151;31:*.hpp=0;38;2;0;255;135:*.htm=0;38;2;226;209;57:*.pgm=0;38;2;253;151;31:*.blg=0;38;2;122;112;112:*.pkg=4;38;2;230;219;116:*.odt=0;38;2;230;219;116:*.fnt=0;38;2;253;151;31:*.png=0;38;2;253;151;31:*.mp3=0;38;2;253;151;31:*.git=0;38;2;122;112;112:*.csv=0;38;2;182;182;182:*.deb=4;38;2;230;219;116:*.csx=0;38;2;0;255;135:*.hxx=0;38;2;0;255;135:*.gif=0;38;2;253;151;31:*.inc=0;38;2;0;255;135:*.pid=0;38;2;122;112;112:*.tar=4;38;2;230;219;116:*.pod=0;38;2;0;255;135:*.odp=0;38;2;230;219;116:*.cxx=0;38;2;0;255;135:*.arj=4;38;2;230;219;116:*.cfg=0;38;2;163;190;140:*.php=0;38;2;174;129;255:*.xcf=0;38;2;253;151;31:*.tmp=0;38;2;122;112;112:*.zst=4;38;2;230;219;116:*.psd=0;38;2;253;151;31:*.pps=0;38;2;230;219;116:*.zip=4;38;2;230;219;116:*.flv=0;38;2;253;151;31:*.xlr=0;38;2;230;219;116:*.def=0;38;2;0;255;135:*.ipp=0;38;2;0;255;135:*.mp4=0;38;2;253;151;31:*.fls=0;38;2;122;112;112:*.clj=0;38;2;0;255;135:*.aif=0;38;2;253;151;31:*.log=0;38;2;122;112;112:*.jpg=0;38;2;253;151;31:*.tif=0;38;2;253;151;31:*.tex=0;38;2;0;255;135:*.sxi=0;38;2;230;219;116:*.xls=0;38;2;230;219;116:*.m4v=0;38;2;253;151;31:*.bbl=0;38;2;122;112;112:*.yml=0;38;2;163;190;140:*.zsh=0;38;2;0;255;135:*.bag=4;38;2;230;219;116:*.xmp=0;38;2;163;190;140:*.tbz=4;38;2;230;219;116:*.sxw=0;38;2;230;219;116:*.nix=0;38;2;163;190;140:*.tgz=4;38;2;230;219;116:*.rar=4;38;2;230;219;116:*hgrc=0;38;2;166;226;46:*.asa=0;38;2;0;255;135:*TODO=1:*.mkv=0;38;2;253;151;31:*.fsi=0;38;2;0;255;135:*.mpg=0;38;2;253;151;31:*.vcd=4;38;2;230;219;116:*.dot=0;38;2;0;255;135:*.ind=0;38;2;122;112;112:*.otf=0;38;2;253;151;31:*.inl=0;38;2;0;255;135:*.lua=0;38;2;0;255;135:*.mli=0;38;2;0;255;135:*.wmv=0;38;2;253;151;31:*.kts=0;38;2;0;255;135:*.css=0;38;2;51;51;51:*.fsx=0;38;2;0;255;135:*.pyo=0;38;2;122;112;112:*.toc=0;38;2;122;112;112:*.sty=0;38;2;122;112;112:*.com=1;38;2;249;38;114:*.ltx=0;38;2;0;255;135:*.bat=1;38;2;249;38;114:*.ogg=0;38;2;253;151;31:*.eps=0;38;2;253;151;31:*.awk=0;38;2;0;255;135:*.swf=0;38;2;253;151;31:*.rst=0;38;2;249;38;114:*.avi=0;38;2;253;151;31:*.pyd=0;38;2;122;112;112:*.dmg=4;38;2;230;219;116:*.sbt=0;38;2;0;255;135:*.ttf=0;38;2;253;151;31:*.kex=0;38;2;230;219;116:*.m4a=0;38;2;253;151;31:*.hgrc=0;38;2;166;226;46:*.psm1=0;38;2;0;255;135:*.make=0;38;2;166;226;46:*.yaml=0;38;2;163;190;140:*.purs=0;38;2;0;255;135:*.flac=0;38;2;253;151;31:*.dart=0;38;2;0;255;135:*.diff=0;38;2;0;255;135:*.conf=0;38;2;163;190;140:*.neon=0;38;2;163;190;140:*.orig=0;38;2;122;112;112:*.java=0;38;2;0;255;135:*.bash=0;38;2;0;255;135:*.xlsx=0;38;2;230;219;116:*.epub=0;38;2;230;219;116:*.tiff=0;38;2;253;151;31:*.pptx=0;38;2;230;219;116:*.json=0;38;2;163;190;140:*.rlib=0;38;2;122;112;112:*.jpeg=0;38;2;253;151;31:*.lock=0;38;2;122;112;112:*.toml=0;38;2;163;190;140:*.webm=0;38;2;253;151;31:*.h264=0;38;2;253;151;31:*.tbz2=4;38;2;230;219;116:*.lisp=0;38;2;0;255;135:*.html=0;38;2;226;209;57:*.psd1=0;38;2;0;255;135:*.fish=0;38;2;0;255;135:*.scss=0;38;2;51;51;51:*.mpeg=0;38;2;253;151;31:*.docx=0;38;2;230;219;116:*.opus=0;38;2;253;151;31:*.less=0;38;2;0;255;135:*.mdown=0;38;2;249;38;114:*README=0;38;2;0;0;0;48;2;230;219;116:*.ipynb=0;38;2;0;255;135:*shadow=0;38;2;163;190;140:*.class=0;38;2;122;112;112:*.cabal=0;38;2;0;255;135:*.xhtml=0;38;2;226;209;57:*.dyn_o=0;38;2;122;112;112:*.patch=0;38;2;0;255;135:*.toast=4;38;2;230;219;116:*passwd=0;38;2;163;190;140:*.scala=0;38;2;0;255;135:*.cmake=0;38;2;166;226;46:*.shtml=0;38;2;226;209;57:*.swift=0;38;2;0;255;135:*.cache=0;38;2;122;112;112:*COPYING=0;38;2;182;182;182:*.dyn_hi=0;38;2;122;112;112:*.config=0;38;2;163;190;140:*INSTALL=0;38;2;0;0;0;48;2;230;219;116:*.matlab=0;38;2;0;255;135:*.flake8=0;38;2;166;226;46:*LICENSE=0;38;2;182;182;182:*.ignore=0;38;2;166;226;46:*.gradle=0;38;2;0;255;135:*.groovy=0;38;2;0;255;135:*TODO.md=1:*Doxyfile=0;38;2;166;226;46:*.gemspec=0;38;2;166;226;46:*TODO.txt=1:*setup.py=0;38;2;166;226;46:*Makefile=0;38;2;166;226;46:*.desktop=0;38;2;163;190;140:*.DS_Store=0;38;2;122;112;112:*.kdevelop=0;38;2;166;226;46:*.fdignore=0;38;2;166;226;46:*README.md=0;38;2;0;0;0;48;2;230;219;116:*.rgignore=0;38;2;166;226;46:*COPYRIGHT=0;38;2;182;182;182:*configure=0;38;2;166;226;46:*.markdown=0;38;2;249;38;114:*.cmake.in=0;38;2;166;226;46:*SConstruct=0;38;2;166;226;46:*.gitignore=0;38;2;166;226;46:*SConscript=0;38;2;166;226;46:*INSTALL.md=0;38;2;0;0;0;48;2;230;219;116:*CODEOWNERS=0;38;2;166;226;46:*README.txt=0;38;2;0;0;0;48;2;230;219;116:*.localized=0;38;2;122;112;112:*Dockerfile=0;38;2;163;190;140:*.gitconfig=0;38;2;166;226;46:*.scons_opt=0;38;2;122;112;112:*INSTALL.txt=0;38;2;0;0;0;48;2;230;219;116:*.gitmodules=0;38;2;166;226;46:*Makefile.am=0;38;2;166;226;46:*.synctex.gz=0;38;2;122;112;112:*.travis.yml=0;38;2;230;219;116:*Makefile.in=0;38;2;122;112;112:*MANIFEST.in=0;38;2;166;226;46:*LICENSE-MIT=0;38;2;182;182;182:*.applescript=0;38;2;0;255;135:*.fdb_latexmk=0;38;2;122;112;112:*configure.ac=0;38;2;166;226;46:*CONTRIBUTORS=0;38;2;0;0;0;48;2;230;219;116:*appveyor.yml=0;38;2;230;219;116:*.clang-format=0;38;2;166;226;46:*CMakeCache.txt=0;38;2;122;112;112:*.gitattributes=0;38;2;166;226;46:*CMakeLists.txt=0;38;2;166;226;46:*LICENSE-APACHE=0;38;2;182;182;182:*CONTRIBUTORS.md=0;38;2;0;0;0;48;2;230;219;116:*requirements.txt=0;38;2;166;226;46:*.sconsign.dblite=0;38;2;122;112;112:*CONTRIBUTORS.txt=0;38;2;0;0;0;48;2;230;219;116:*package-lock.json=0;38;2;122;112;112:*.CFUserTextEncoding=0;38;2;122;112;112"

#alias q="zellij --layout compact options --no-pane-frames --simplified-ui true --theme=atelier-sulphurpool"

eval "$(spice shell completion fish)"

alias up="./bin/noipdev dc up --no-attach qgrabber --no-attach metabase --no-attach master-zones-builder --no-attach mail"
alias down="./bin/noipdev dc down"
alias db="./bin/noipdev db"
alias pull="./bin/noipdev pull"
alias cphp81="dquick -e COMPOSER_AUTH=\"$(cat /home/mradford/.config/composer/auth.json)\" registry.hr498.net/ci-images/php:8.1 -d memory_limit=1G"
alias cphp83="dquick -e COMPOSER_AUTH=\"$(cat /home/mradford/.config/composer/auth.json)\" registry.hr498.net/ci-images/php:8.3 -d memory_limit=1G"
alias noipdev="./bin/noipdev"
export OLLAMA_API_BASE=https://ollama.mradford.com


#if type -q zellij
#    #if set -q PS1; and not set -q ZELLIJ
#    if not set -q ZELLIJ
#        set randomstr (
#            tr -dc A-Za-z </dev/urandom | head -c 4
#        )
#
#        #zellij attach || zellij options --simplified-ui=true --mouse-mode=false --no-pane-frames --layout ~/dotfiles/zellij/layout.kdl
#        #zellij options --simplified-ui=true --mouse-mode=false --no-pane-frames --layout ~/dotfiles/zellij/layout.kdl
#        #zellij --layout compact options --no-pane-frames --simplified-ui true --theme=atelier-sulphurpool
#        zellij # --layout compact options --no-pane-frames --simplified-ui true # --theme=atelier-sulphurpool
#    end
#end

#if set -q ZELLIJ
#else
#  zellij
#end

if status is-interactive
    set ZELLIJ_AUTO_EXIT true
    eval (zellij setup --generate-auto-start fish | string collect)
end

fzf_configure_bindings --directory=\cf

#https://github.com/fish-shell/fish-shell/issues/10838
function my-save-cursor --on-event fish_preexec
    set -g my_cursor (commandline -C)
end
function my-up-or-search
    if set -q my_cursor && test -z (commandline | string collect)
        up-or-search
        commandline --cursor $my_cursor
    else
        up-or-search
    end
    set -e my_cursor
end
bind ctrl-p my-up-or-search
