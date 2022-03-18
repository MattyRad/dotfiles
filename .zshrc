
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

alias j="z && zi"

# Remap ^D (ctrl-D, the EOT/EOF transmission) to ^W (ctrl-W)
stty eof ^W

# start zellij if it's available and not currently running
#if command -v zellij &> /dev/null && [ -n "$PS1" ] && [ -z "$ZELLIJ" ]; then
#  randomstr=`tr -dc A-Za-z </dev/urandom | head -c 4`
#  exec zellij --session "$randomstr"
#fi

if command -v zoxide &> /dev/null && [ -n "$PS1" ]; then
  eval "$(zoxide init zsh)"
  alias cd="echo 'zoxide is installed, use z command instead'"
fi

if command -v exa &> /dev/null && [ -n "$PS1" ]; then
  alias ls="exa"
fi

if command -v bat &> /dev/null && [ -n "$PS1" ]; then
  alias cat="bat"
fi

(git -C ~/dotfiles pull &> /dev/null &) > /dev/null 2>&1
