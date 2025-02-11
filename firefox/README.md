### Setting up symlinks for firefox
Given the `.stow-local-ignore` settings Stow will not attempt to create symlinks for firefox automatically.
In order to set up the symlinks, run the following commands:
```
$ chmod +x $HOME/dotfiles/firefox/setup-firefox-profile.sh
$ $HOME/dotfiles/firefox/setup-firefox-profile.sh
```
