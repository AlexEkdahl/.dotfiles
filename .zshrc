
# Show chached promt on startup
 if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
 fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Theme
ZSH_THEME="robbyrussell"

# Config
DISABLE_UPDATE_PROMPT="false"
DISABLE_LS_COLORS="true"
COMPLETION_WAITING_DOTS="true"

# ENV
export NODE_ENV=local
export NVM_DIR="$HOME/.nvm"
export PATH="/opt/homebrew/bin:$PATH"
export ZSH="/Users/alex/.oh-my-zsh"
export APIKEYFILE="/Users/alex/dev/august-runtime-creds/apicreds.json"
export NVM_LAZY_LOAD=true

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-nvm)

# Source
source $ZSH/oh-my-zsh.sh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# Alias #

# History
alias h="history -10" # last 10 history commands
alias hg="history | grep " # +command

# Git
alias gco='git checkout'
alias gst='git status'
alias ggp='git push origin $(current_branch)'
alias glog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gsl="git stash list --pretty=format:'%Cblue%gd%Cred: %C(yellow)%s"

# Misc
alias brewski="brew doctor && brew update && brew upgrade && brew cleanup"
alias today='icalBuddy -f -sd -iep datetime,title  eventsToday'
alias tomorrow='icalBuddy -f -sd -iep datetime,title eventsToday+1'
alias editconfig='micro ~/.zshrc'
alias reload='source ~/.zshrc'
alias wttr='curl -s wttr.in/Lund'
alias ports='lsof -i -n -P'
alias spdt='speedtest -s 31538'
alias mip='echo "Private IP address: "; ipconfig getifaddr en0 && echo "Public IP address: "; dig +short myip.opendns.com @resolver1.opendns.com'
alias c='clear'
alias grep='grep --color=auto'

# Node
alias check='npx depcheck'
alias yolo='rm -rf node_modules/ && rm package-lock.json && npm install'
alias npd='npm run dev'

# Dir
alias ..='cd ..'
alias mv='mv -iv'
alias cp='cp -iv'
alias lsa='ls -a'
alias dev='cd ~/dev && echo "$(tput setaf 1)Projects"$(tput sgr0) && ls'
alias repo='cd ~/dev/repo && echo "$(tput setaf 1)Phoenix Repo"$(tput sgr0) && ls'
alias war='cd ~/dev/test && code .'

# Intellij
alias idea='open -na "IntelliJ IDEA.app" --args "$@"'

# Docker
alias dils='docker image ls'
alias dps='docker ps'
alias dprune='docker volume prune --force'
alias dstop='docker kill $(docker ps -q)'
alias dkill='docker rmi $(docker images -a -q)'
alias hkc='docker pull gitlab.hkcsecurity.net:5000/phoenix-software/server/docker/yale/phoenix-hub-app-docker-yale:latest'
alias Docker='open -a Docker'
dbash(){ docker exec -it $1 bash;}

# Association
alias -s md=code
alias -s json=code
alias -s txt=code

# Functions #

# start containers for phoenix
dstart(){
	docker run --name some-mongo -p 27017:27017 --rm -d mongo:4.0.26&&
	docker run --name some-redis -p 6379:6379 --rm -d redis:6.2.5&&
	docker run --name some-rabbit -p 5672:5672 --rm -d rabbitmq:3.6-management-alpine&&
	docker run --rm -d --name august-aws-dynamodb-local -p 8000:8000 amazon/dynamodb-local&&
	docker ps --format ‘{{.Names}}’;
}

# time start up time for shell
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# grab current branch head
current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# nvm autouse
nvm_autouse() {
if [[ -f ".nvmrc" ]]; then
  local_node="$(node -v)"
  local_nvm="$(cat .nvmrc)"
  if [ ${local_node:1:2} != $local_nvm ]; then
    nvm use
  fi
fi
}

nvm_autouse &>/dev/null
chpwd_functions=(${chpwd_functions[@]} "nvm_autouse")
