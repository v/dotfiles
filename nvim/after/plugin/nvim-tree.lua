-- empty setup using defaults
require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    update_focused_file = {
        enable = true,
        update_root = true
    },
})

vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
