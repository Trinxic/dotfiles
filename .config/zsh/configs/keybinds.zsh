# Only interactive shells
[[ $- != *i* ]] && return

# Define functions
move_by_slash_backwards() {
    WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
    zle backward-word
}
move_by_slash_forwards() {
    WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
    zle forward-word
}
delete_by_slash_backwards() {
    WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
    zle backward-kill-word
}
delete_by_slash_forwards() {
    WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
    zle kill-word
}
move_by_whitespace_backwards() {
    WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
    zle backward-word
}
move_by_whitespace_forwards() {
    WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
    zle forward-word
}
delete_by_whitespace_backwards() {
    WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
    zle backward-kill-word
}
delete_by_whitespace_forwards() {
    WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
    zle kill-word
}

# Register functions as zsh widgets
zle -N move_by_whitespace_backwards
zle -N move_by_whitespace_forwards
zle -N delete_by_whitespace_backwards
zle -N delete_by_whitespace_forwards
zle -N move_by_slash_backwards
zle -N move_by_slash_forwards
zle -N delete_by_slash_backwards
zle -N delete_by_slash_forwards

# Consider Slashes and whitespaces as word boundaries
# Alt+(Left/Right)
bindkey "\e[1;3D" move_by_slash_backwards
bindkey "^[[1;3D" move_by_slash_backwards
bindkey "\e[1;3C" move_by_slash_forwards
bindkey "^[[1;3C" move_by_slash_forwards

# Alt+Backspace
bindkey "\e\x7" delete_by_slash_backwards
bindkey "^[\x7f" delete_by_slash_backwards

# Alt+Delete


# Ctrl+(Left/Right)
bindkey "\e[1;5D" move_by_whitespace_backwards
bindkey "^[[1;5D" move_by_whitespace_backwards
bindkey "\e[1;5C" move_by_whitespace_forwards
bindkey "^[[1;5C" move_by_whitespace_forwards

# Ctrl+Backspace
bindkey "^H" delete_by_whitespace_backwards
bindkey "^[[3;5~" delete_by_whitespace_backwards

# Ctrl+Delete
