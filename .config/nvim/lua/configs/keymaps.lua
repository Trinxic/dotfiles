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
vim.keymap.set('n', '<Bslash>', ':Neotree toggle<CR>', opts)

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
