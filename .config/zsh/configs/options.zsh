# ------------- The following lines were confiured by compinstall ------------ #
zstyle :compinstall filename '/home/david/.zshrc'
autoload -Uz compinit
compinit

# --------------------------------- My Lines --------------------------------- #
unsetopt autocd beep
bindkey -e
setopt extendedglob nomatch notify
setopt globdots  # show dotfiles in autocomplete
setopt PROMPT_SUBST  # allows for functions as part of prompt
zle_highlight=('paste:none')

# Completion
zstyle ':completion:*' menu select  # x2 `tab` to use arrow keys
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# History
bindkey '^p' history-search-backward  # only cycle matching command
bindkey '^n' history-search-forward  # ..
HISTSIZE=2000
SAVEHIST=$HISTSIZE
HISTFILE=~/dotfiles/.config/zsh/.histfile
HISTDUP=erase
setopt appendhistory
setopt sharehistory  # same history if openning a new zsh side-by-side
setopt hist_ignore_space  # ignore any commands preceeded by a space
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
