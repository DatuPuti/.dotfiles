return {
    vim.keymap.set("n", "<C-t>", ":belowright 15split | terminal<CR>", {}),
    vim.keymap.set("n", "<leader>b", ":!cmake -S . -B build && cmake --build build<CR>", {
        desc = "Build C++ Project with CMake"
    })
}
