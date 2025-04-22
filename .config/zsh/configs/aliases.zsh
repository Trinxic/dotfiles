# ---- package managers ---- #
alias pss='pacman -Ss'  # list available packages
alias sps='sudo pacman -S'  # install package
alias spr='sudo pacman -R'  # remove package
alias sprs='sudo pacman -Rns'  # remove package and (unused) dependencies
alias yayss='yay -Ss'  # list available packages
alias yays='yay -S'  # install package
alias yayr='yay -R'  # remove package
alias yayrs='yay -Rs'  # remove package and (unused) dependencies

# ---------- apps ---------- #
alias start-ssh='sudo systemctl start sshd && sudo systemctl enable sshd'
alias keepassxc='QT_QPA_PLATFORM=xcb keepassxc'
alias code='codium'
alias nim='nvim'
alias v='nvim'
alias snim='sudo nvim'  # lol
alias sv='sudo nvim'
alias neofetch='fastfetch'
alias stow='stow --verbose'
fetch() {
  if [[ $# -eq 0 ]]; then
    if [[ "$(uname)" == "Linux" ]]; then
      fastfetch --config ~/dotfiles/.config/fastfetch/linux-config.jsonc
    elif [[ "$(uname)" == "Darwin" ]]; then
      fastfetch --config ~/dotfiles/.config/fastfetch/macos-config.jsonc
    else
      echo "Unsupported OS..."
      fastfetch
    fi
  else
    fastfetch "$@"
  fi
}
# ----------- zsh ---------- #
alias srce='source ~/.zshrc'  # reload zsh configs

# ----------- git ---------- #
alias gita='git add .'
alias gitas='git add . && git status'
alias gits='git status'
alias gitm='git commit -m'
alias gitp='git push'
alias gitpr='git push --rebase'

# navigating dicrectories
# alias cd='..'
# alias cd...='cd ../..'
# TODO: Add a function to go back n-1 times where n is the number of dots

# -------- scripts --------- #
alias update='sudo pacman -Syyu && ~/dotfiles/.config/zsh/scripts/ask-to-reboot.sh'
alias keybinds='~/dotfiles/.config/zsh/scripts/get-keybinds.sh'
alias keybinds-full='bat ~/dotfiles/.config/hypr/configs/keybinds.conf'
alias auto-vnc='~/Documents/auto-vnc/auto_vnc_lab.sh'

# -------- listing --------- #
# colorize grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls='ls --color=auto'
alias la='eza --long --time-style=relative --total-size --no-permissions --no-user --all --group-directories-first --icons=always'
alias lap='eza --long -h --time-style=long-iso --total-size --all --group-directories-first --icons=always'
alias tree='tree -C -I ".git|node_modules|__pycache__|.venv|.idea|.vscode|.DS_Store"'

# ---------- misc ---------- #
alias exti='exit'  # correct misspelling
mktouch() {
  local dir
  dir="${1%/*}"
  mkdir -p "$dir" && touch "$1"
}  # creates file and necessary director(y/ies)

# overwrite confirmation
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
