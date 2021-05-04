
#if [ -f ~/.zshrc.extended ]; then
#    source ~/.zshrc.extended
#else
#    print ~/.zshrc.extended not found
#fi

# Stock
alias v="micro -softwrap true -diffgutter true -mouse false -rmtrailingws true"
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
alias r="rg --no-ignore"
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
alias pa="php artisan"
alias stan="./vendor/bin/phpstan analyse"
alias unit="./vendor/bin/phpunit"
alias difflock="~/.config/composer/vendor/bin/composer-lock-diff --md --from develop"

## Monolog
alias tailc="~/Sync/tailc.sh"
alias tailc="~/Sync/bin/tailc.sh"
alias tailcm="~/Sync/bin/tailc-min.sh"

# Git
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gc="git commit"
alias undolastcommit="git reset --soft HEAD~1"
alias stashview="git stash show -p"
alias stashdelete="git stash drop stash@{0}"

# Docker
alias dquick="docker run --rm -it"
alias dexec="docker exec -it"
alias dstop='docker stop $(docker ps -a -q);'
alias dkill='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q)'

# Graveyard
#alias q="ddgr -x --np"
#alias q2="ddgr -x --np -n 2"
#alias q3="ddgr -x --np -n 3"
#alias qg="ddgr --gb --np \!g"
#alias t="tmux choose-tree"
