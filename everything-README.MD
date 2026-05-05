# Trinxic x Info
Any issue resolutions should be recorded here. The `$` at the start of certain lines is simply to gesture that it is a command. 

## Other `README` files in this repo
`README` files for specific programs can be found in their respective directories.
A list of all can be found using the following command:
```
# feel free to exclude more directories
$ find ~/dotfiles -iname "readme*" | grep -vE "github|yay"
```

## Commands
### `grep`
Search for specific lines from a list piped to `grep`
```
$ ... | grep <text>         # only list results with <text>
$ ... | grep -v <text>      # exclude results with <text>
$ ... | grep -E <text|txt>  # allow for regex
```

## To Be Continued
This file was created years after the initialization of my first `dotfiles`. Many additions shall come in time.
