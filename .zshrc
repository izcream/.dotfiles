
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
	evalcache
	golang
	gh
	docker-compose
)
source $HOME/.dotfiles/zsh/rc.zsh
#starship
_evalcache starship init zsh
#zoxide
_evalcache zoxide init zsh


export PATH="/home/izcream/.local/share/fnm:$PATH"
eval "`fnm env`"

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

# Turso
export PATH="/home/izcream/.turso:$PATH"
WARP_ENABLE_WAYLAND=1
eval "$(gh copilot alias -- zsh)"
