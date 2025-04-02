return {
  'kawre/leetcode.nvim',
  -- cmd = "Leet",
  build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
  dependencies = {
    'nvim-telescope/telescope.nvim',
    -- "ibhagwan/fzf-lua",  -- telescope alternative. only use one
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    lang = 'python3', -- list of languages: https://github.com/kawre/leetcode.nvim?tab=readme-ov-file#lang
    storage = {
      home = '~/coding-solutions/leetcode',
      cache = vim.fn.stdpath 'cache' .. '/leetcode',
    },
    logging = true,
  },
}
