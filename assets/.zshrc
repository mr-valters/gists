export EDITOR=subl
export ZSH=$HOME/.oh-my-zsh

SPACESHIP_ROOT=$ZSH/custom/themes/spaceship-prompt
ZSH_THEME="spaceship"
COMPLETION_WAITING_DOTS=true

# https://spaceship-prompt.sh/config/intro
SPACESHIP_TIME_SHOW=true
SPACESHIP_BATTERY_THRESHOLD=95
SPACESHIP_NODE_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_EXEC_TIME_ELAPSED=0.2

plugins=(git)

source $ZSH/custom/themes/spaceship.zsh-theme
source $ZSH/oh-my-zsh.sh
source $HOME/.scm_breeze/scm_breeze.sh

## Colors
source ~/Documents/gists/assets/colors.sh

alias ipinfo="curl -H 'Accept: application/json' ipinfo.io && echo \\"
alias ports="sudo lsof -i -P -n | grep LISTEN"
alias open='xdg-open "$(pwd)"'
alias phpl="lando logs -t -f -s appserver"
alias ds="docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}\t{{.MemUsage}}'"

# Lando
alias start="lando start"
alias stop="lando stop"
alias off="lando poweroff"
alias npm="lando npm"
alias npx="lando npx"
alias yarn="lando yarn"
alias gulp="lando gulp"
alias bower="lando bower"
alias vercel="lando vercel"
alias composer="lando composer"

## Composer commands
alias require="composer require"
alias why="composer why"
alias outdated="composer outdated --direct"

## Drush commands
alias drush="lando drush"
alias cr="drush cr"
alias uli="drush uli"
alias cim="drush cim"
alias cex="drush cex"
alias updb="drush updb"
alias cron="drush cron"
alias es="drush cr && drush queue:delete elasticsearch_helper_indexing && drush eshd -y && drush eshs -y && drush eshr -y && drush queue:list && drush queue-run elasticsearch_helper_indexing"

## VCS commands (SCB Breeze overrides & other)
alias gca="git add . && git commit -a"
## Output diff in console. Parameters allowed
alias gd0="gd --exit-code"
## Output diff of All Untracked Files
alias gdu="git ls-files --others --exclude-standard -z | xargs -0 -n 1 git --no-pager diff --no-index /dev/null"

## Work related scripts
source ~/Documents/wd/0ther/wunder.sh

export PATH="/home/sebastian/.lando/bin${PATH+:$PATH}"; #landopath

function ratio {
    aspect_ratio=$(identify -format "%[fx:16/(w/h)]" "$1")
    echo "16:$aspect_ratio"
}
