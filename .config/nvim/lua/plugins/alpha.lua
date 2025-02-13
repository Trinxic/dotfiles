return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.startify'

    dashboard.section.header.val = {
      [[                                                        ]],
      [[  ____  _____             ____   ____  _                ]],
      [[ |_   \|_   _|           |_  _| |_  _|(_)               ]],
      [[   |   \ | |  .---.   .--. \ \   / /  __   _ .--..--.   ]],
      [[   | |\ \| | / /__\\/ .'`\ \\ \ / /  [  | [ `.-. .-. |  ]],
      [[  _| |_\   |_| \__.,| \__. | \ ' /    | |  | | | | | |  ]],
      [[ |_____|\____|'.__.' '.__.'   \_/    [___][___||__||__] ]],
      [[                                                        ]],
    }

    alpha.setup(dashboard.opts)
  end,
}
