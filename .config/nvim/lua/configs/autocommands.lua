--[[             __                                                               __
  ____ _ __  __ / /_ ____   _____ ____   ____ ___   ____ ___   ____ _ ____   ____/ /_____
 / __ `// / / // __// __ \ / ___// __ \ / __ `__ \ / __ `__ \ / __ `// __ \ / __  // ___/
/ /_/ // /_/ // /_ / /_/ // /__ / /_/ // / / / / // / / / / // /_/ // / / // /_/ /(__  )
\__,_/ \__,_/ \__/ \____/ \___/ \____//_/ /_/ /_//_/ /_/ /_/ \__,_//_/ /_/ \__,_//____/

]]
--  See `:help lua-guide-autocommands`

-- [[ Highlight On Yank ]]
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Focus-Loss Actions ]]
vim.api.nvim_create_autocmd('FocusLost', {
  callback = function()
    vim.cmd 'wa' -- save all files
    vim.cmd 'stopinsert' -- switch to Normal Mode? (might only work when in Insert Mode)
  end,
})

-- [[ Per Language Spacing ]]
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua, json, jsonc',
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
  end,
})
