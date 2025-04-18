# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------- Imports -------- #
source ~/dotfiles/.config/zsh/functions.zsh  # custom functions

zsh_add_config 'options.zsh'
zsh_add_config 'exports.zsh'
zsh_add_config 'aliases.zsh'
zsh_add_config 'keybinds.zsh'
zsh_add_config 'plugin-manager.zsh'

# zsh_add_plugin 'autosuggestions'
# zsh_add_plugin 'syntax-highlighting'
# zsh_add_plugin 'you-should-use' 

# -------- zoxide --------- #
# https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
# DON'T CHANGE TO DOUBLE QUOTES
eval "$(zoxide init zsh)"

# -------- Prompt --------- #
# (powerlevel10k)
zsh_add_config 'prompt.zsh'
# Created by `pipx` on 2025-02-08 23:09:19
export PATH="$PATH:/home/david/.local/bin"

# ------- Fastfetch ------- #
# Auto-Launch fastfetch when openning terminal
if [[ $- == *i* ]]; then
    fetch
fi

# --------- pnpm ---------- #
# pnpm
export PNPM_HOME="/Users/d.anderson/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
