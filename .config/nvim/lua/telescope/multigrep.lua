local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local make_entry = require 'telescope.make_entry'
local conf = require('telescope.config').values

local M = {}

local live_multigrep = function(opts)
  opts = opts or {} -- set empty table as default
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == '' then
        return nil -- don't do anything if the prompt is empty
      end

      -- NOTE: TWO spaces which splits the prompt into two different args
      local pieces = vim.split(prompt, '  ')

      -- NOTE: indexing in lua starts at 1, not 0
      local args = { 'rg' } -- "ripgrep" is recursive grep function
      if pieces[1] then
        table.insert(args, '-e') -- whatever "rg -e" does and grep whatever is typed in search
        table.insert(args, pieces[1])
      end
      if pieces[2] then
        table.insert(args, '-g') -- search only for whatever's specified in 2nd piece. ex. `*.lua` only searchs lua files
        table.insert(args, pieces[2])
      end

      ---@dagnostic disable-next-line
      return vim.tbl_flatten {
        args,
        { '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' },
      }
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts), -- does the formatting
    cwd = opts.cwd, -- just pass the current working directory (or `pwd`)
  }

  pickers
    .new(opts, {
      debounce = 100, -- delay for breathing room while typing
      prompt_title = 'Multi Grep',
      finder = finder,
      previewer = conf.grep_previewer(opts),
      sorter = require('telescope.sorters').empty(), -- 'empty' => don't sort because sorting is done above ^
    })
    :find() -- idk this syntax...
end

-- pretty sure this comes pre-configured with what I'm already using, so this was just an exercise :sob:
M.setup = function()
  live_multigrep()
end

return M
