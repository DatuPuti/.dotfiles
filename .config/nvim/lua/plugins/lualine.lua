-- lua/plugins/lualine.lua
-- Requires: 'nvim-lua/plenary.nvim' is optional for some extensions but not required.
-- Assumes lazy.nvim; for packer/plug adapt the install table accordingly.

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icons
  config = function()
    local lualine = require("lualine")

    local colors = {
      bg       = "#202328",
      fg       = "#bbc2cf",
      yellow   = "#ECBE7B",
      cyan     = "#008080",
      darkblue = "#081633",
      green    = "#98be65",
      orange   = "#FF8800",
      violet   = "#a9a1e1",
      magenta  = "#c678dd",
      blue     = "#51afef",
      red      = "#ec5f67",
    }

    -- simple theme based on gruvbox-ish palette
    local theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert = { a = { fg = colors.bg, bg = colors.green, gui = "bold" } },
      visual = { a = { fg = colors.bg, bg = colors.violet, gui = "bold" } },
      replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
      inactive = {
        a = { fg = colors.fg, bg = colors.bg },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
      },
    }

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "NvimTree", "alpha" },
        globalstatus = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_lsp" } } },
        lualine_c = { { "filename", file_status = true, path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = { "quickfix", "fzf", "nvim-tree" },
    })
  end,
}

