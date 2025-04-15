return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  config = function()
    require('oil').setup {
      columns = {
        'icon',
        -- "permissions",
        'size', -- default: *commented out*
        -- "mtime",
      },
      delete_to_trash = true, -- default: false
      view_options = {
        -- show dotfiles
        show_hidden = true, -- default: false
      },
    }
    vim.api.nvim_set_keymap('n', '<leader>-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    vim.api.nvim_set_keymap('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open Oil as floating window' })
  end,
  -- Optional dependencies
  -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
