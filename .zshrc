
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
	golang
	gh
	docker-compose
)
source $HOME/.dotfiles/zsh/rc.zsh
#starship
eval "$(starship init zsh)"
#zoxide
eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/home/izcream/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# bun completions
[ -s "/home/izcream/.bun/_bun" ] && source "/home/izcream/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# fnm
export PATH="/home/izcream/.local/share/fnm:$PATH"
eval "`fnm env`"
