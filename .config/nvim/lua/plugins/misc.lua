return {
  { -- detect tabstop & shiftwidth automatically
    'tpope/vim-sleuth',
  },
  { -- pair brackets
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  { -- special highlighting on attention keywords
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  { -- highlights color (ex. hex-code) with the respective color
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
}
