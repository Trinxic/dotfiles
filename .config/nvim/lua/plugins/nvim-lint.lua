return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  -- opts = {},
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      go = { 'golangcilint' },
      -- javascript = { 'eslint_d' },
      lua = { 'luacheck' },
      python = { 'flake8', 'mypy' },
      sh = { 'shellcheck' },
      -- typescript = { 'eslint_d' },
      css = { 'stylelint' },
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
