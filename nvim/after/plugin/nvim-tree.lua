-- empty setup using defaults
require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    update_cwd = true,
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
})

vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
