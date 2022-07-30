export ZSH="$HOME/.oh-my-zsh"

export FORGIT_LOG_GRAPH_ENABLE=false
export BAT_THEME=catppuccin

autoload -Uz compinit
if [[ -n "${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24)" ]]; then
	compinit
else
	compinit -C
fi

source $HOME/.dotfiles/zsh-syntax-highlighting.zsh

ZSH_THEME="dracula"
plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
	last-working-dir
	you-should-use
	evalcache
	forgit
)
source $ZSH/oh-my-zsh.sh
#alias

#pnpm
alias p="pnpm"
alias pi="pnpm install"
alias pa="pnpm add"
alias pad="pnpm add -D"
alias pc="rm -rf node_modules pnpm-lock.yaml"
alias px="pnpm dlx"
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
alias glog="git log --oneline --decorate"

#docker
alias d="docker"
alias dc="docker compose"
alias dcupd="docker compose up -d"
alias dcdn="docker-compose down"

#general
alias wwa="cd ~/projects/wewillapp"
alias gta="cd ~/future-rp"
alias c="code"
alias dex="docker exec -it $1"
alias rz="source $HOME/.zshrc"
alias {clr,cz,cx}="clear"
alias sls="jq .scripts package.json"
alias exp="explorer.exe"
alias outdated="npx taze"
alias ls="exa --icons --git --group-directories-first"
alias la="ls -la"
#plugins
alias cat="bat"
alias machine="macchina"
alias ps="procs"
alias vi="nvim"
alias pm="podman"

#go to home
function h() {
	cd ~/$1
}

#create directory and cd to it
function dir() {
	mkdir $1 && cd $1
}

#create file and open with vscode
function touchh() {
	touch $1 && code $1
}

#create .prettierrc file as current path
function cpt() {
	cp $HOME/.dotfiles/.prettierrc $(pwd)/.prettierrc
	echo ".prettierrc created 🚀"
}

#run dev command by current node package manager tool
function dev() {
	if [[ -f $(pwd)"/yarn.lock" ]]; then
		yarn dev
	elif [[ -f $(pwd)"/pnpm-lock.yaml" ]]; then
		pnpm dev
	else
		npm run dev
	fi
}

#run build command by current node package manager tool
function build() {
	if [[ -f $(pwd)"/yarn.lock" ]]; then
		yarn build
	elif [[ -f $(pwd)"/pnpm-lock.yaml" ]]; then
		pnpm build
	else
		npm run build
	fi
}
#colormap function Thanks: https://github.com/xcad2k/dotfiles
function colormap() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

#starship
_evalcache starship init zsh
# fnm
export PATH=/home/izcream/.fnm:$PATH
eval "$(fnm env --use-on-cd)"
#zoxide
_evalcache zoxide init zsh
#_evalcache dircolors $HOME/.dircolors
# pnpm
export PNPM_HOME="/home/izcream/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

#golang
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

#.local/bin
export PATH=$PATH:$HOME/.local/bin
#fzf theme
export FZF_DEFAULT_OPTS='--color=hl:#89dceb --color=fg+:#cdd6f4,bg+:-1,hl+:#a6e3a1 --color=info:#fab387,prompt:#a6e3a1,pointer:#f6c2e7 --color=marker:#f5c2e7,spinner:#fab387,header:#6c7086'

bindkey -v

# bun completions
[ -s "/home/izcream/.bun/_bun" ] && source "/home/izcream/.bun/_bun"

# Bun
export BUN_INSTALL="/home/izcream/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
