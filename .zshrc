
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
# export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/opt/homebrew/bin:/opt/homebrew/sbin
export PATH="/opt/homebrew/bin:$PATH"
export ZSH="/Users/alex/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Source
source $ZSH/oh-my-zsh.sh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# Alias #

# Brew
alias brewski="brew doctor && brew update && brew upgrade && brew cleanup"

# Vim
alias vim="nvim"

# Misc
alias editconfig='micro ~/.zshrc'
alias reload='source ~/.zshrc'
alias reg='cd ~/dev/misc/webscrape && node app.js && cd -'
alias wttr='curl -s wttr.in/'
alias ports='lsof -i TCP'
alias spdt='speedtest -s 31538'

# Node
alias check='npx depcheck'
alias yolo='rm -rf node_modules/ && rm package-lock.json && npm install'
alias uninstall='npm uninstall'

# Dir
alias ..='cd ..'
alias dev='cd ~/dev && echo "$(tput setaf 1)Projects"$(tput sgr0) && ls'
alias war='cd ~/dev/misc/codewars && code .'
alias lsa='ls -a'
alias scs='open ~/Downloads/screenshots'
alias movie='cd ~/dev/new_projects/MovieSwipe && code .'

# Databas
alias startDB='brew services start mongodb-community && brew services start mysql && brew services start redis && brew services start neo4j'
alias stopDB='brew services stop mongodb-community && brew services stop mysql && brew services stop redis && brew services stop neo4j'

# Docker
alias dils='docker image ls'
alias dps='docker ps'

# Stjarnstoft Studios
alias sprkslog='heroku logs --app sprks-backend --tail --source app'
alias sprksgamelog='heroku logs --app sprks-game --tail --source app'
alias ssneo4j='cypher-shell -a neo4j+s://424fd9e7.databases.neo4j.io -u neo4j -p FJ4z9XZkJlIROH1hwaWxd_Xki7XNMf85Aj-ACJdJPlM --format verbose'
alias ss='cd ~/dev/stjarnstoft && echo $(tput setaf 1)Stjärnstoft Studios project$(tput sgr0) && ls'


# Functions
project(){ cd ~/dev/new_projects; mkdir "$1"; cd "$1"; code .; }
clone(){ cd ~/dev/cloned && git clone https://github.com/"$1" && cd "$(basename "$1" .git)" && code . && cd -}






