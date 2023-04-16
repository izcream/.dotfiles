export ZSH="$HOME/.oh-my-zsh"
#path
export PNPM_HOME=$HOME/.local/share/pnpm
export PATH=$PATH:/usr/local/go/bin:$HOME/.local/bin:$PNPM_HOME:$HOME/.deno/bin:$HOME/.fly/bin:$DOTFILES/bin

#fzf theme
export FZF_DEFAULT_OPTS='--color=hl:#89dceb --color=fg+:#cdd6f4,bg+:-1,hl+:#a6e3a1 --color=info:#fab387,prompt:#a6e3a1,pointer:#f6c2e7 --color=marker:#f5c2e7,spinner:#fab387,header:#6c7086'
export BAT_THEME=catppuccin
ZSH_THEME="dracula"

#forgit config
FORGIT_LOG_GRAPH_ENABLE=false
FORGIT_COPY_CMD='xclip -selection clipboard'
