"""
I want a .json(c) file with 3 keys: "both", "macos" and "linux" each with a list of os-specific dotfile configs to ignore (when using stow). the 

dotfiles -> includes all dotfile configs for both linux/macos/both
os-configs.jsonc -> {"both": [], "linux": [], "macos": []}
set-ignores.sh -> run the python script as well as some other things
git-ignores.py -> to check OS, grab the respective os-list, and apply to .stow-local-ignore if they're not already there
.stow-local-ignore -> regex of all the ignore files
"""


