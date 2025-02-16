# [Trinxic](https://github.com/Trinxic/dotfiles.git) x [NeoVim](https://neovim.io/)
This is my configuration following some guides:
 - [Henry Misc's guide](https://youtu.be/KYDG3AHgYEs?si=__kclbz8pnZ2Kqmy)
 - [TJ's video guide](https://youtu.be/m8C0Cq9Uv9o?si=MPUzVYqr6Y886Vt0)
 - as well as some git repo guides..


## Plugins
[Lazy](https://github.com/folke/lazy.nvim.git)  -- plugin manager

### Plugin List
Useful for GNU Stow / Git repo recursion
 - [gitsigns](https://github.com/lewis6991/gitsigns.nvim.git)
 - [which-key](https://github.com/folke/which-key.nvim.git)
 - [treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git)
     - all the stuff for that?? :sob:
 - [Neo-Tree](https://github.com/nvim-neo-tree/neo-tree.nvim.git)
 - [Tokyo Night](https://github.com/folke/tokyonight.nvim.git)
 - [folke/todo-comments.nivm](https://github.com/folke/todo-comments.nvim.git)
 - [echasnovski/mini.nvim](https://github.com/echasnovski/mini.nvim.git)
 - 
 - ~[bufferline](https://github.com/akinsho/bufferline.nvim.git)~
     - ~[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons.git)]~


## Handling Issues
#### Formatting Only Works in Nvim Directory
This may be an issue with the nvim runtime path not locating the proper lua/ directory
To check list of runtime paths (from within nvim):
`lua print(vim.inspect(vim.api.nvim_list_runtime_paths()))`
To add a path:
`lua vim.opt.runtimepath:append(',<path/to/lua>/lua')`

#### Pressed Ctrl+z
Pressing `<C-z>` will suspend nvim in the terminal. Enter the command: `fg` to retreive it.


## Learning Vim-Motions
1. `:Tutor`: A verbose file which teaches you the basics of vim and vim-motions
2. `ThePrimeagen/vim-be-good`: A plugin which creates a game-like environment to practice most of said the basics
