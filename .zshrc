# ------- Fastfetch ------- #
# Auto-Launch fastfetch when openning terminal
# Can't use aliases because they may note exist yet
if [[ $- == *i* ]]; then
  if [[ "$(uname)" == "Linux" ]]; then
    fastfetch --config ~/dotfiles/.config/fastfetch/linux-config.jsonc
  elif [[ "$(uname)" == "Darwin" ]]; then
    fastfetch --config ~/dotfiles/.config/fastfetch/macos-config.jsonc
  else
    echo "Unsupported OS..."
    fastfetch
  fi
fi

# ----- Powerlevel10k ----- #
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
zsh_add_config 'plugin-manager.zsh' # ensure PL10k is setup first

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -------- zoxide --------- #
# https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
# DON'T CHANGE TO DOUBLE QUOTES
eval "$(zoxide init zsh)"

# --------- pipx ---------- #
# Created by `pipx` on 2025-02-08 23:09:19
export PATH="$PATH:/home/david/.local/bin"

# --------- pnpm ---------- #
# pnpm
export PNPM_HOME="/Users/d.anderson/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
