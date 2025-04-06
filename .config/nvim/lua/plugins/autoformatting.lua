-- [[ Automatic Formatting ]]
return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = { 'ConformInfo' },
  keys = {
    { '<leader>f', function()
      require('conform').format {
        async = true,
        lsp_fallback = true,
        timeout_ms = 500,
      }
    end, desc = '[f]ormat current file/selection' },
  },
  opts = {
    notify_on_error = true,
    notify_no_formatters = true,

    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },

    formatters_by_ft = {
      bash = { 'beautysh' },
      css = { 'prettier' },
      go = { 'gofumpt' },
      html = { 'prettier' },
      java = { 'google-java-format' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      json = { 'jq' },
      lua = { 'stylua' },
      markdown = { 'prettierd', 'prettier' },
      python = function(bufnr)
        if require('conform').get_formatters(bufnr) then
          return { 'ruff_format' }
        else
          return { 'black', 'isort' }
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
