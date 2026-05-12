# Archived ❌
This repository has been archived and will no longer receive updates. See latest dotfiles [here](https://codeberg.org/trinxic/dotfiles)

Update remote:
```
git remote remove origin
git remote add origin ssh://git@codeberg.org/trinxic/dotfiles.git
```

---

# [Trinxic](https://github.com/Trinxic) x [Dotfiles](https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/)

## Setup
### Git
#### Generating / Linking SSH
```
# generate ssh key
# NOTE: you can create different keys for different SSH connections
# Ex. >> -t ed25519_github -C desktop-pc
$ ssh-keygen -t ed25519_<role> -C <comment>

# start ssh agent (make sure to do this before adding ssh key / attempting to connect)
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519

# print public key and then add it to github keys
$ cat ~/.ssh/id_ed25519.pub
$ ssh -T git@github.com  # test connection

# use ssh instead of https
git clone git@github.com:username/repo.git
```
##### SSH Pesistancy
Note: there may be other ways to do this or it may be automatic.
Use if experiencing issues.

Add to `.zshrc`:
```
# Start SSH agent if not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)"
fi

ssh-add ~/.ssh/id_ed25519 2>/dev/null  # or whatever the key file is..
```
You could also add to apple keychain on MacOS or systemd on Linux:
```
ssh-add --apple-use-keychain ~/.ssh/id_ed25519  # MacOS

systemctl --user enable --now ssh-agent         # Linux
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
```

#### Creating The `dotfiles` Directory
Since this repo includes other repos for things like zsh plugins, you must
use the `--recurse-submodules` tag when cloning.
```
$ git clone --recurse-submodules git@github.com:Trinxic/dotfiles ~/dotfiles
$ cd dotfiles  # move into the newly created directory
```
If you have already cloned the repo, you can use: 
`$ git submodule update --init --recursive`

#### Pushing to github
When in the root of the repo, you can use the following commands:
```
$ git add .                           # add all changes
$ git reset HEAD <file or directory>  # remove staged ('unadd') changes
$ git commit -C "<comment>"           # commit the changes and additionally add a comment
$ git push                            # push the commit(s) to github
```

### Sym-Linking Everything
The following script will ensure that only OS-related dotfiles will be symlinked.
Please do not delete the other files (or at least don't push to the repo if you do)
```
$ chmod +x ~/dotfiles/setup.sh  # allow `setup.sh` to be executed
$ ~/dotfiles/setup.sh           # run the setup script
```

## [Stow](https://www.gnu.org/software/stow)

#### What Is It
"GNU Stow is a symlink farm manager" -> running `stow .` (within the dotfiles directory)
will setup symlinks for the application configs found in this dotfiles repo.

#### Notes About Stow
Since this repo is shared between Linux and MacOS, some configs can be ignored by one or the other.
An alias has been set up to run a script which takes this into consideration: using `stow` will now consider the current OS.
See the exact alias [here](https://github.com/Trinxic/dotfiles/.config/zsh/configs/zsh-aliases).

## Installing Packages
Listing packages will yield results with <package> in the title. Downloading will only work if <package> is an exact match.
To list/install/updating packages:
```
# Linux (Archlinux)
$ pacman -Ss <package>
$ pacman -S <package>
$ pacman -Syu  # all packages (for a specified package, it is the same as installing)

# MacOS (this may be slightly inaccurate)
brew list <package>
brew install <package>
brew upgrade <package>
brew update && brew upgrade  # all packages
```

### Dependencies
Make sure you have all the necessary dependencies:
```
# Linux
$ jq          # cli json parsing
$ bat         # better-visualize 'cat'
$ zsh         # shell
$ fzf         # shell fuzzy finder
$ zoxide      # improved 'cd'
$ stow        # see above
$ fastfetch   # preview specs and OS icon
$ sddm or ly  # display manager (there's a different name for it)
$ hypr(land)  # wayland version
$ ghostty       # terminal emulator
$ wofi        # wayland version of rofi
$ waybar      # status bar

## 1-liner of essentials (Archlinux)
sudo pacman -S zsh fzf zoxide stow fastfetch hyprland ghostty wofi

# MacOS
# The setup script will install brew & other apps automatically.
# To see said apps, check out:
~/dotfiles/stownt/.setup/Brewfile
```
