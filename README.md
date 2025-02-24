# [Trinxic](https://github.com/Trinxic) x [Dotfiles](https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/)

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
# Linux
zsh         # shell
fzf         # shell fuzzy finder
zoxide      # improved 'cd'
stow        # see above
firefox     # ...
fastfetch   # preview specs and OS icon
sddm        # login manager (there's a different name for it)
hypr(land)  # wayland version
kitty       # terminal emulator
wofi        # wayland version of rofi
waybar      # status bar

# MacOS
# The setup script will install brew & other apps automatically.
# To see said apps, check out:
~/dotfiles/stownt/.setup/Brewfile
```

## Setup
### Creating The `dotfiles` Directory
Since this repo includes other repos for things like zsh plugins, you must
use the `--recurse-submodules` tag when cloning.
```
git clone --recurse-submodules git@github.com:Trinxic/dotfiles ~/dotfiles
cd dotfiles  # move into the newly created directory
```
If you have already cloned the repo, you can use: 
`git submodule update --init --recursive`

### Sym-Linking Everything
The following script will ensure that only OS-related dotfiles will be symlinked.
Please do not delete the other files (or at least don't push to the repo if you do)
```
chmod +x ~/dotfiles/setup.sh  # allow `setup.sh` to be executed
~/dotfiles/setup.sh           # run the setup script
```
