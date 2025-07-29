return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = { "github/copilot.vim" },
  config = function()
    require("CopilotChat").setup({
        window = {
            layout = "float",
            with = 80,
            height = 20,
            border = "rounded",
        },
    })

    -- Add key mappings for CopilotChat
    vim.keymap.set("n", "<leader>cc", function()
      require("CopilotChat").open()
    end, { desc = "Open Copilot Chat" })
  end,
}

