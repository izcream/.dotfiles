#alias
#pnpm
alias p="pnpm"
alias pi="pnpm install"
alias pa="pnpm add"
alias pad="pnpm add -D"
alias pc="rm -rf node_modules pnpm-lock.yaml"
alias {px,pnpx,pdlx}="pnpm dlx"
#yarn
alias yi="yarn install"
alias ya="yarn add"
alias yad="yarn add -D"
alias yc="rm -rf node_modules yarn.lock"
#git
alias g="git"
alias gst="git status"
alias gf="git flow"
alias ga="git add"
alias gp="git push"
alias gpa="git push --all"
alias gpl="git pull"
alias glog="git log --oneline --decorate"
alias gc="git checkout"
alias gcl="git clone"

#docker
alias d="docker"
alias dc="docker compose"
alias dcupd="docker compose up -d"
alias dcdn="docker-compose down"
alias dex="docker exec -it $1"

#general
alias c="code"
alias {clr,cz,cx}="clear"
alias sls="jq .scripts package.json"
alias exp="explorer.exe"
alias ls="exa --icons --git --group-directories-first"
alias la="ls -lah"
#plugins
alias cat="bat --paging=never --plain"
alias machine="macchina"
alias ps="procs"
alias vi="nvim"
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias {python,py}=python3