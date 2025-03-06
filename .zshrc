# -------- Imports -------- #
source ~/dotfiles/.config/zsh/zsh-functions  # custom functions

zsh_add_config 'zsh-options'
zsh_add_config 'zsh-exports'
zsh_add_config 'zsh-aliases'
zsh_add_config 'zsh-keybinds'

zsh_add_plugin 'zsh-autosuggestions'
zsh_add_plugin 'zsh-syntax-highlighting'
zsh_add_plugin 'zsh-you-should-use' 

# --------- zoxide -------- #
# https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
# DON'T CHANGE TO DOUBLE QUOTES
eval "$(zoxide init zsh)"

# --------- Prompt -------- #
# (powerlevel10k)
zsh_add_config 'zsh-prompt'
# Created by `pipx` on 2025-02-08 23:09:19
export PATH="$PATH:/home/david/.local/bin"

# Auto-Launch fastfetch when openning terminal
if [[ $- == *i* ]]; then
    fetch
fi
