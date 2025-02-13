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
require 'configs.options'      -- `vim.opt.*`
require 'configs.keymaps'      -- `vim.keymap.set(*)  -- sets the leader key
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
require('lazy').setup {
  require 'plugins.tokyo-night',
  require 'plugins.which-key',
  require 'plugins.gitsigns',
  require 'plugins.neo-tree',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lazydev',
  require 'plugins.lsp', -- make sure this is after `telescope`
  require 'plugins.autocompletion',
  require 'plugins.autoformatting',
  require 'plugins.alpha',
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  require 'plugins.comment',
  -- require 'plugins.bufferline',  -- not sure I'll be using this...
  -- require 'mini'
}

-- vim.cmd[[colorscheme tokyonight]]  -- Must be loaded AFTER setting Lazy configurations (hence why it's down here)
