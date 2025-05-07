--[[
    __ __
   / //_/___   __  __ ____ ___   ____ _ ____   _____
  / ,<  / _ \ / / / // __ `__ \ / __ `// __ \ / ___/
 / /| |/  __// /_/ // / / / / // /_/ // /_/ /(__  )
/_/ |_|\___/ \__, //_/ /_/ /_/ \__,_// .___//____/
            /____/                  /_/
]]

--  See `:help vim.keymap.set()`
--  See `:help keycodes`

-- TODO: maybe move these around / organize

-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' ' -- Set <space> as the leader key
vim.g.maplocalleader = ' '

local opts = { noremap = true } -- could add `silent = true` which prevents keymap from showing in command line

-- Disable <space> in normal and visual mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'move half a page up' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'move half a page down' })
vim.keymap.set('n', '<n>', 'nzzzv', { desc = 'move half a page down' })
vim.keymap.set('n', '<N>', 'Nzzzv', { desc = 'move half a page down' })

-- I am using a custom keyboard where left/down/up/right on the home-row.
-- Thus I will use them in place of Qwerty-hjkl
vim.keymap.set('n', '<C-Down>', '<C-d>zz', { desc = 'move half a page up' })
vim.keymap.set('n', '<C-Up>', '<C-u>zz', { desc = 'move half a page down' })
vim.keymap.set('i', '<C-BS>', '<C-w>', { desc = 'backspace from cursor to start of word' })

-- Save file with Ctrl-s
vim.keymap.set({ 'i', 'n' }, '<C-s>', '<cmd> w <CR>', { desc = '[S]ave the current file' })
-- Quit file with Ctrl-q (will 'error' if the file hasn't been saved)
vim.keymap.set({ 'i', 'n' }, '<C-q>', '<cmd> q <CR>', { desc = '[Q]uit the current file' })

-- del. single char. won't copy to clipboard
vim.keymap.set('n', 'x', '"_x', opts)

-- prevent clipboard refreshing when pasting over highlighted text
vim.keymap.set('v', 'p', '"_dP', opts)

-- Move between buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', opts)

-- Keeps you in Visual Mode when indenting
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Open Neo-Tree (done within `../plugins/neo-tree.lua` config)
vim.keymap.set('n', '<Bslash>', ':Neotree focus<CR>', opts)

-- Navigate diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'See all diagnostics' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Saving/Quitting Files
vim.keymap.set('n', '<leader>Ww', ':w<CR>', { desc = 'Write without quitting' })
vim.keymap.set('n', '<leader>Wq', ':wq<CR>', { desc = 'Write and quit' })
vim.keymap.set('n', '<leader>Wn', ':noautocmd w<CR>', { desc = 'Write without formatting' })

-- Moving comments
vim.keymap.set('n', '<leader>mca', function()
  local comment_api = require 'Comment.api' -- get Comment.nvim api variable
  comment_api.toggle.linewise.current() -- comment current line to get comment marker

  local line = vim.api.nvim_get_current_line() -- get the current line
  comment_api.toggle.linewise.current() -- un-comment the line

  local first_non_ws = line:find '%S' or 1 -- find the first character
  local following_ws = line:find('%S', first_non_ws + 1) -- find the first whitespace after
  if not following_ws then
    return -- if no whitespace, something went wrong
  end

  -- comment marker is whatever was before the `following_whitespace` ( ex. '//' in Java)
  local cmt_marker = line:sub(first_non_ws, following_ws - 1)

  line = vim.api.nvim_get_current_line() -- get the line after un-commenting

  local cmt_start = line:find(cmt_marker, following_ws) -- find comment marker
  if not cmt_start then
    return -- there was no in-line comment :/
  end

  local code_part = line:sub(1, cmt_start - 1) -- everything up to comment
  code_part = code_part:gsub('%s+$', '') -- then no trailing whitespace
  local cmt_part = line:sub(cmt_start) -- everything comment onwards

  vim.api.nvim_set_current_line(code_part) -- replace current line with just code_part

  vim.cmd('normal! O' .. cmt_part) -- create new line above and insert comment
  vim.cmd 'silent normal! j$' -- move to end of code-line
end, { desc = '[M]ove [c]omment to new line above' })

vim.keymap.set('n', '<leader>mci', function()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local comment_line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1] -- current line content
  local next_line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1] -- next line content

  local first_non_ws = comment_line:find '%S' or 1 -- find the first character
  local comment = comment_line:sub(first_non_ws) -- everything comment onwards

  local combined = next_line .. '  ' .. comment
  vim.api.nvim_buf_set_lines(0, row, row + 1, false, { combined }) -- replace next line with combined

  vim.api.nvim_buf_set_lines(0, row - 1, row, false, {}) -- remove current line

  vim.api.nvim_win_set_cursor(0, { row, #combined }) -- move cursor to end of new line
end, { desc = '[M]ove [c]omment [i]n-line' })
