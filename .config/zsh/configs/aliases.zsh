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

# ----------- zsh ---------- #
alias srce='source ~/.zshrc'  # reload zsh configs
alias editaliases='nvim ~/dotfiles/.config/zsh/configs/aliases.zsh'

# ----------- git ---------- #
alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gca='git commit --amend -m'
alias gcl='git clone'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git push'
alias gs='git status'
alias gu='git pull'
alias gur='git pull --rebase'

# navigating dicrectories
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'

# -------- scripts --------- #
alias update='sudo pacman -Syyu && ~/dotfiles/.config/zsh/scripts/ask-to-reboot.sh'
alias keybinds='~/dotfiles/.config/zsh/scripts/get-keybinds.sh'
alias keybinds-full='bat ~/dotfiles/.config/hypr/configs/keybinds.conf'
alias auto-vnc='~/Documents/auto-vnc/auto_vnc_lab.sh'
alias roundc='~/dotfiles/.config/hypr/scripts/toggle-corners.sh'

# -------- listing --------- #
# colorize grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls='ls --color=auto'
alias lsla='ls -la --color=auto'
alias la='eza --long --time-style=relative --bytes --no-permissions --no-user --all --group-directories-first --icons=always'
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
