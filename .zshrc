# Import plugin manager
[[ -f "$HOME/dotfiles/.config/zsh/plugin-manager.zsh" ]] && source "$HOME/dotfiles/.config/zsh/plugin-manager.zsh"

# ----- Powerlevel10k ----- #
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------- Imports -------- #
for config_file in "$HOME/dotfiles/.config/zsh/configs/"*.zsh; do
    [ -f "$config_file" ] && source "$config_file"
done

# ------- Fastfetch ------- #
# Auto-Launch fastfetch when openning terminal
if [[ $- == *i* ]]; then
  fetch
fi

# - fzf shell integration - #
source <(fzf --zsh)

# --- vim command-edit ---- #
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

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

# -------- zoxide --------- #
# END of config file
# https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
eval "$(zoxide init --cmd cd zsh)"

# ----- OS-Specifics ------ #
if [[ "$(uname)" == "Linux" ]]; then
  # Music Player Daemon (MPD)
  [ ! -s ~/.mpd/pid ] && mpd
else
  # Angular CLI autocompletion
  source <(ng completion script)
fi

# Created by `pipx` on 2025-06-03 23:16:38
export PATH="$PATH:/home/trinxic/.local/bin"
