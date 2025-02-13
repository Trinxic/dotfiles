--[[
   ____          __   _
  / __ \ ____   / /_ (_)____   ____   _____
 / / / // __ \ / __// // __ \ / __ \ / ___/
/ /_/ // /_/ // /_ / // /_/ // / / /(__  )
\____// .___/ \__//_/ \____//_/ /_//____/
     /_/
]]

-- Home to most/all of the vim.opt settings
-- use vim.opt to globally set options (as opposed to using ':set <option>')

-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.opt.guifont = "GeistMono Nerd Font Mono:h12" -- set nvim font

-- [[ Line Numbers ]]
vim.opt.cursorline = true      -- highlight which line your cursor is on
vim.opt.number = true          -- show line numbers
vim.opt.relativenumber = true  -- numbers relative to current line

-- [[ In-Line Notifications ]] (idk what to call it)
vim.opt.list = true  -- set how neovim will display certain whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- see `:help 'list(chars)'`

-- [[ Default Tab Options ]]
-- NOTE: language specific indentation options can be found in `autocommands.lua`
vim.opt.autoindent = true   -- maintain indent from prev line
vim.opt.breakindent = true  -- maintain indent when line-break (ex. comment too long)
vim.opt.expandtab = true    -- converts tabs to spaces
vim.opt.shiftwidth = 4      -- number of spaces inserted for each indent
vim.opt.smartindent = true  -- smart indentation for some languages
vim.opt.softtabstop = 4     -- pressing <tab> will insert 4 spaces instead <BS> will delete 4
vim.opt.tabstop = 4         -- ...

-- [[ Other Navigation Options ]]
vim.opt.whichwrap = 'bs<>[]hl'  -- which "horizontal" keys are allowed to travel between lines

-- [[ Visuals ]]
vim.opt.hlsearch = true     -- highlight searched items
vim.opt.showmode = true     -- already in the status line
vim.opt.scrolloff = 10      -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.sidescrolloff = 8   -- min columns to show if `wrap` is turned off

-- [[ Text Wrapping ]]
vim.opt.linebreak = true    -- prevent `wrap` breaking words
vim.opt.wrap = true         -- wrap long text to the next line

-- [[ Window Splitting ]]
vim.opt.splitbelow = true
vim.opt.splitright = true

-- [[ Search Casing ]]
vim.opt.ignorecase = true   -- Case-insensitive searching UNLESS `\C`
vim.opt.smartcase = true    -- Case-sensitive IF capital letters are in the search term

-- [[ Time Optimizations ]]
vim.opt.updatetime = 250    -- Decrease update time
vim.opt.timeoutlen = 300    -- Decrease mapped sequence wait time
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- [[ Other Options ]]
vim.opt.mouse = 'a'         -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.swapfile = false    -- create swap files (default=true)
vim.opt.backup = false      -- create a backup file
vim.opt.fileencoding = 'utf-8'
vim.opt.undofile = true     -- Save undo history
vim.opt.signcolumn = 'yes'  -- Keep signcolumn on by default
vim.opt.inccommand = 'split'  -- Preview substitutions live, as you type!

-- vim.opt.iskeyword:append '-'  -- hyphenated words recognized by searches
--
