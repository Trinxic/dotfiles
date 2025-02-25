return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
  dependencies = {
    'nvim-telescope/telescope.nvim',
    -- "ibhagwan/fzf-lua",  -- telescope alternative. only use one
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    lang = { 'python' },
    storage = '~/coding-solutions/leetcode',
    logging = true,
  },
  cmd = { 'Leet', 'LeetList', 'LeetGet', 'LeetTest', 'LeetSubmit' },
}
