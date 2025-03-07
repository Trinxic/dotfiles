return {
  dir = vim.fn.stdpath 'config' .. '/lua/myplugins', -- explicitly set local path
  lazy = true,                                       -- load only when needed
  config = function()
    require 'myplugins.floatty'                      -- ensure it's required when loaded
  end,
  cmd = { 'Floatty' },                               -- enables `:Floatty` command
  keys = {
    {
      '<leader>tt',
      function()
        require('myplugins.floatty').toggle_terminal()
      end,
      desc = 'Toggle floating terminal window',
    },
  },
}
