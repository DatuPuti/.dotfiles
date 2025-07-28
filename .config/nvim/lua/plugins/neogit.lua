return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim", -- optional but recommended
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", function() require("neogit").open() end, desc = "Open Neogit" },
  },
  config = function()
    require("neogit").setup {
      integrations = {
        diffview = true,
      },
      signs = {
        section = { "", "" },
        item = { "", "" },
      },
    }
  end,
}

