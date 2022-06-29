export ZSH="$HOME/.oh-my-zsh"

autoload -Uz compinit
if [[ -n "${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24)" ]]; then
	compinit
else
	compinit -C
fi

#dracula theme for zsh-syntax-highlighting
source ~/.oh-my-zsh/custom/dracula-zsh-syntax-highlighting/init.sh

ZSH_THEME="dracula"
plugins=(
	git
	docker-compose
	aliases
	zsh-autosuggestions
	zsh-syntax-highlighting
	last-working-dir
	zsh-z
	you-should-use
	evalcache
)

source $ZSH/oh-my-zsh.sh

#alias

#pnpm
alias pi="pnpm install"
alias pa="pnpm add"
alias pad="pnpm add -D"
alias pc="rm -rf node_modules pnpm-lock.yaml"
#yarn
alias yi="yarn install"
alias ya="yarn add"
alias yad="yarn add -D"
alias yc="rm -rf node_modules yarn.lock"
#docker
alias dps="docker ps"
alias di="docker images"
alias dc="docker compose"
#general
alias wwa="cd ~/projects/wewillapp"
alias gta="cd ~/future-rp"
# alias h="cd ~"
alias c="code"
alias cpt="cp ~/.prettierrc . && echo .prettierrc created 🚀"
alias dex="docker exec -it $1"
alias rz="source ~/.zshrc"
alias devc="devcontainer"
alias clr="clear"
alias sls="jq .scripts package.json"
alias cat="bat"
alias ls="logo-ls"

function h() {
	cd ~/$1
}

function dir() {
	mkdir $1 && cd $1
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
	echo -f $(pwd)"/pnpm-lock.yaml"
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
	echo -f $(pwd)"/pnpm-lock.yaml"
}
# eval "$(starship init zsh)"
_evalcache starship init zsh

# fnm
export PATH=/home/izcream/.fnm:$PATH
eval "$(fnm env)"

# pnpm
export PNPM_HOME="/home/izcream/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

#golang
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
#.local/bin
export PATH=$PATH:$HOME/.local/bin
#bat theme
export BAT_THEME=dracula
source /home/izcream/.config/broot/launcher/bash/br
