return {
    "preservim/tagbar",
    config = function()
        vim.keymap.set('n', '<C-q>', ':Tagbar toggle right<CR>', {})
    end,
}
