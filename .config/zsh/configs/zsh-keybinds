# Define functions
move_by_slash_backwards() {
    WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
    zle backward-word
}
move_by_slash_forwards() {
    WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
    zle forward-word
}
move_by_whitespace_backwards() {
    WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
    zle backward-word
}
move_by_whitespace_forwards() {
    WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
    zle forward-word
}

# Register functions as zsh widgets
zle -N move_by_whitespace_backwards
zle -N move_by_whitespace_forwards
zle -N move_by_slash_backwards
zle -N move_by_slash_forwards

# Alt+(Left/Right) considers slashes and whitespaces
bindkey "^[[1;3D" move_by_slash_backwards
bindkey "^[[1;3C" move_by_slash_forwards

# Ctrl+(Left/Right) only considers whitespace
bindkey "^[[1;5D" move_by_whitespace_backwards
bindkey "^[[1;5C" move_by_whitespace_forwards
