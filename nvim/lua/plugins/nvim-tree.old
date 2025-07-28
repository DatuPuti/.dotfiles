return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            filters = {
                dotfiles = true,
            },
        })
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle filesystem toggle left<CR>", {})
    end,
}
