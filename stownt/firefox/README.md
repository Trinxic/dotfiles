### Setting up symlinks for firefox
Given the `firefox/.stow-local-ignore` settings, Stow will not attempt to create symlinks for firefox automatically.
In order to set up the symlinks, run the setup script:
```
$ chmod +x $HOME/dotfiles/firefox/setup-firefox-profile.sh
$ $HOME/dotfiles/firefox/setup-firefox-profile.sh
```
The script has error handling so if a directory/file/etc. isn't found, the user will be notified and Stow won't try to create symlinks.
