
#if [ -f ~/.fishrc.extended ]; then
#    source ~/.fishrc.extended
#else
#    print ~/.fishrc.extended not found
#fi

# theme
set -L
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

# Stock
alias v="micro -softwrap true -diffgutter true -rmtrailingws true -tabstospaces true -tabmovement true -savecursor true -scrollbar true -xterm true -basename true"
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

# Rust tools
alias r="rg --no-ignore --hidden"
alias search="fd --no-ignore --hidden"
alias sizeof="~/Sync/bin/dust"
alias fz="~/Sync/bin/sk"
alias markdown="~/Sync/bin/mdcat"

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
alias gds="git diff --staged"
alias gcu="git commit"
alias gc="git commit -S"
alias undolastcommit="git reset --soft HEAD~1"
alias stashview="git stash show -p"
alias stashdelete="git stash drop stash@{0}"
alias gsreset="git submodule update --init --recursive"

# Docker
alias dquick='docker run --rm -it -v "$PWD":/dockervolume -w /dockervolume'
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
#  exec zellij --session "$randomstr" options --simplified-ui --default-mode=locked --no-pane-frames
#fi

(git -C ~/dotfiles pull &> /dev/null &) > /dev/null 2>&1
