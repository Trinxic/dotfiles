-- NOTE: Whichever `return` is on top will be the config that is used

-- [[ Basic Neotree Config]]
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  }
}


-- [[ Advanced Neotree Config ]]
-- can be found at: https://github.com/nvim-neo-tree/neo-tree.nvim?tab=readme-ov-file#longer-example-for-lazynvim
