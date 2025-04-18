# Functions to source files if they exist
# function zsh_add_file() {
#     [ -f "$HOME/.config/zsh/$1" ] && source "$HOME/.config/zsh/$1"
# }

function zsh_add_config() {
    [ -f "$HOME/dotfiles/.config/zsh/configs/$1" ] && source "$HOME/dotfiles/.config/zsh/configs/$1"
}

function zsh_add_plugin() {
    if [ -d "$HOME/dotfiles/.config/zsh/plugins/$1" ]; then
        source "$HOME/dotfiles/.config/zsh/plugins/$1/$1.plugin.zsh" || source "$HOME/dotfiles/.config/zsh/plugins/$1/$1.zsh"
    fi
}

# FIXME:
function zsh_test_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$HOME/dotfiles/.config/zsh/plugins/$PLUGIN_NAME" ]; then
        notify-send "this is 1: $1 | this is plug_name: $PLUGIN_NAME"
    else
        notify-send 'something went wrong'
    fi
}