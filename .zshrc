
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
	golang
	gh
	docker-compose
	rust
	dirhistory
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

#Android
# export ANDROID_HOME="/mnt/d/Android/Sdk"
# export ANDROID_SDK_ROOT=$ANDROID_HOME
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH"
