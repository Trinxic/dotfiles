--[[
    _         _  __      __
   (_)____   (_)/ /_    / /__  __ ____ _
  / // __ \ / // __/   / // / / // __ `/
 / // / / // // /_ _  / // /_/ // /_/ /
/_//_/ /_//_/ \__/(_)/_/ \__,_/ \__,_/

]]

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Sourced Config Files ]]

-- found in ../nvim/lua/
require 'configs.options' -- `vim.opt.*`
require 'configs.keymaps' -- `vim.keymap.set(*)  -- sets the leader key
require 'configs.autocommands' -- vim.api.nvim_create_autocmd(*)

-- [[ Other Settings ]]
-- NOTE: Some settings appear AFTER plugin-setup in order to work properly
-- ((nothing here yet...))

-- [[ Install `lazy.nvim` Plugin Manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and Install Plugins ]]
--  To check the current status of your plugins, run `:Lazy`
--  To update plugins you can run `:Lazy update`
--  OPTIONALLY: just use `require('lazy').setup('plugins')`
--              this will just `require` all files within `/plugins`
require('lazy').setup {
  require 'config.plugins.tokyo-night', -- colorscheme
  require 'config.plugins.which-key', -- displays available keymaps/commands while 'motioning'
  require 'config.plugins.gitsigns', -- for git related presentation
  require 'config.plugins.neo-tree', -- file browser
  require 'config.plugins.treesitter', -- connects everything (ya, idk a good definition)
  require 'config.plugins.telescope', -- search almost anything
  require 'config.plugins.lazydev', -- *I don't remember*
  require 'config.plugins.lsp', -- advanced keyword recognition / highlighting | make sure this is after `telescope`
  require 'config.plugins.autocompletion', -- auto-completion (includes luasnip)
  require 'config.plugins.autoformatting', -- auto-formatting
  require 'config.plugins.alpha', -- *I don't remember*
  require 'config.plugins.indent-blankline', -- creates vertical bars to visualize indents
  require 'config.plugins.misc', -- set of additional plugins small enough to fit in one file
  require 'config.plugins.comment', -- better commenting motions
  require 'config.plugins.leetcode', -- Leetcode
  require 'config.plugins.jdtls', -- used for proper java lsp, etc.
  require 'config.plugins.floatty', -- 'my own' floating terminal plugin
  -- require 'config.plugins.bufferline',  -- not sure I'll be using this...
  -- require 'mini'
}

-- NOTE: Disable autoformatting per-save using the command: `:noa w`
