
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

if [ -x "$(command -v exa)" ]; then
    alias ls="exa --icons --grid --colour=never"
    alias la="exa --long --all --group --icons"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Theme
ZSH_THEME="robbyrussell"

# Config
DISABLE_UPDATE_PROMPT="true"
DISABLE_LS_COLORS="true"
COMPLETION_WAITING_DOTS="true"

# ENV
export node="/opt/homebrew/bin/node"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="/opt/homebrew/bin:$PATH"
export ZSH="/Users/alex/.oh-my-zsh"
export giraffe='157.230.21.82'

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Source
source $ZSH/oh-my-zsh.sh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# Alias #

#Git
alias gco='git checkout'

# Brew
alias brewski="brew doctor && brew update && brew upgrade && brew cleanup"

# Vim
alias vim="nvim"

# Python
alias python='/opt/homebrew/bin/python3'
# in root dir #
alias activate='source env/bin/activate'

# Intellij
alias idea='open -na "IntelliJ IDEA.app" --args "$@"'

# Misc
alias editconfig='micro ~/.zshrc'
alias reload='source ~/.zshrc'
alias reg='java21v reg -n Alex -m alexanderekdahl@me.com'
alias wttr='curl -s wttr.in/Lund'
alias ports='netstat -tulanp'
alias spdt='speedtest -s 31538'
alias mip='echo "Private IP address: "; ipconfig getifaddr en0 && echo "Public IP address: "; dig +short myip.opendns.com @resolver1.opendns.com'


# Node
alias check='npx depcheck'
alias yolo='rm -rf node_modules/ && rm package-lock.json && npm install'
alias uninstall='npm uninstall'
alias npd='npm run dev'

# Dir
alias ..='cd ..'
alias mv='mv -iv'
alias cp='cp -iv'
alias dev='cd ~/dev && echo "$(tput setaf 1)Projects"$(tput sgr0) && ls'
alias war='cd ~/dev/misc/unknown && code .'
alias lsa='ls -a'
alias scs='open ~/Pictures/screenshots'
alias movie='cd ~/dev/new_projects/MovieSwipe && code .'
alias yty='cd ~/dev/new_projects/youtube-together'

# Databas
alias startDB='brew services start mongodb-community && brew services start mysql && brew services start redis && brew services start neo4j'
alias stopDB='brew services stop mongodb-community && brew services stop mysql && brew services stop redis && brew services stop neo4j'

# Docker
alias dils='docker image ls'
alias dps='docker ps'
alias dprune='docker volume prune --force'
dbash(){ docker exec -it $1 bash;}
alias dkill='docker rmi $(docker images -a -q)'

# Stjarnstoft Studios
alias sprkslog='heroku logs --app sprks-backend --tail --source app'
alias sprksgamelog='heroku logs --app sprks-game --tail --source app'
alias ssneo4j='cypher-shell -a neo4j+s://424fd9e7.databases.neo4j.io -u neo4j -p FJ4z9XZkJlIROH1hwaWxd_Xki7XNMf85Aj-ACJdJPlM --format verbose'
alias ss='cd ~/dev/stjarnstoft && echo $(tput setaf 1)Stjärnstoft Studios project$(tput sgr0) && ls'


# Functions
project(){ cd ~/dev/new_projects; mkdir "$1"; cd "$1"; }
clone(){ cd ~/dev/cloned && git clone https://github.com/"$1" && cd "$(basename "$1" .git)" && code .}









