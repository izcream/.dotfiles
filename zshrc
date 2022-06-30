export ZSH="$HOME/.oh-my-zsh"

#folder for dotfile
DOTFILE_FOLDER="$HOME/.dotfiles"

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
	you-should-use
	evalcache
	command-not-found
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
alias c="code"
alias dex="docker exec -it $1"
alias rz="source ~/.zshrc"
alias devc="devcontainer"
alias clr="clear"
alias sls="jq .scripts package.json"
#plugins
alias cat="bat"
alias ls="lsd"

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
	cp $DOTFILE_FOLDER/.prettierrc $(pwd)/.prettierrc
	echo .prettierrc created 🚀
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
source $HOME/.config/broot/launcher/bash/br

#zoxide
eval "$(zoxide init zsh)"