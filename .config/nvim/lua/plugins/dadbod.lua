return {
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        lazy = true,
      },
    },
    config = function(_, _)
      -- Enable nerd fonts for the UI
      vim.g.db_ui_use_nerd_fonts = 1

      -- Set location to save queries
      vim.g.db_ui_save_location = vim.fn.stdpath("config") .. require("plenary.path").path.sep .. "db_ui"

      -- Set omnifunc for SQL completion
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
      })

      -- Set <leader>r to run SQL query under cursor using vim-dadbod-ui
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          vim.keymap.set("n", "<leader>r", "<Plug>(DBUI_ExecuteQuery)", { buffer = true, desc = "Run SQL" })
        end,
      })

    end,
    keys = {
      { "<leader>dt", "<cmd>DBUIToggle<cr>", desc = "Toggle Dadbod UI" },
      { "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "Find Buffer" },
      { "<leader>dr", "<cmd>DBUIRenameBuffer<cr>", desc = "Rename Buffer" },
      { "<leader>dq", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
    },
  },
}

