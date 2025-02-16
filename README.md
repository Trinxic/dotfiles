# Dotfiles - [Trinxic](https://github.com/Trinxic/dotfiles)

## TODO
- sddm(?)
- hyprlock?
- thunar
- fastfetch
- wofi
- *any others i decide to add... (check out `~/.config/` for ideas)

## [Stow](https://www.gnu.org/software/stow)

#### What Is It
"GNU Stow is a symlink farm manager" -> running `stow .` (within the dotfiles directory)
will setup symlinks for the application configs found in this dotfiles repo.

#### Notes About Stow
Since this repo is shared between Linux and MacOS, some configs can be ignored by one or the other.
An alias has been set up to run a script which takes this into consideration: using `stow` will now consider the current OS.
See the exact alias [here](https://github.com/Trinxic/dotfiles/.config/zsh/configs/zsh-aliases).

## Installing Packages
To list/install packages:
```
# MacOS
brew list <package>
brew install <package>

# Linux (Arch)
pacman -Ss <package>
pacman -S <package>
```

### Dependencies
Make sure you have all the necessary dependencies:
```
# Universal
zsh         # shell
fzf         # shell fuzzy finder
zoxide      # improved 'cd'
stow        # see above
firefox     # ...
fastfetch   # preview specs and OS image

# MacOS
brew        # package manager

# Linux
sddm        # login manager (there's a different name for it)
hypr(land)  # wayland version
kitty       # terminal emulator
wofi        # wayland version of rofi
waybar      # status bar
```

## Setup
### Creating The `dotfiles` Directory
```
git clone https://github.com/Trinxic/dotfiles ~/dotfiles
z dotfiles  # move into the newly created directory

```
### Sym-Linking Everything
The following script will ensure that only OS-related dotfiles will be symlinked.
Please do not delete the other files (or at least don't push to the repo if you do)
```
chmod +x setup.sh  # allow `setup.sh` to be executed
./setup.sh         # run the setup script
```
