-- [[ Automatic Formatting ]]
return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format {
          async = true,
          lsp_format = 'fallback',
          timeout_ms = 500,
        }
      end,
      desc = '[f]ormat current file/selection',
    },
  },
  opts = {
    notify_on_error = true,
    notify_no_formatters = true,

    format_on_save = {
      lsp_format = 'fallback',
      timeout_ms = 500,
    },

    formatters_by_ft = {
      bash = { 'beautysh' },
      css = { 'prettier' },
      go = { 'goimports', 'gofumpt' },
      html = { 'prettier' },
      java = { 'google-java-format' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      json = { 'jq' },
      lua = { 'stylua' },
      markdown = { 'prettierd', 'prettier' },
      python = function(bufnr)
        if require('conform').get_formatter_info('ruff_format', bufnr).available then
          return { 'ruff_format' }
        else
          return { 'isort', 'black' }
        end
      end,
      rust = { 'rustfmt', lsp_format = 'fallback' },
      scss = { 'prettier' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      yaml = { 'yamlfix' },
      [' '] = { 'trim_whitespace' },
    },
  },
}
