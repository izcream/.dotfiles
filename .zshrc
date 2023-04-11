autoload -Uz compinit
if [[ -n "${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24)" ]]; then
	compinit
else
	compinit -C
fi
plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
	last-working-dir
	you-should-use
	evalcache
)
source $HOME/.dotfiles/zsh/rc.zsh
#starship
_evalcache starship init zsh
# fnm
export PATH=$HOME/.fnm:$PATH
eval "$(fnm env --use-on-cd)"
#zoxide
_evalcache zoxide init zsh

# fnm
export PATH="/home/izcream/.fnm:$PATH"
eval "`fnm env`"
