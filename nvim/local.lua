local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Core dependencies first
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.8' })

-- Then plugins that depend on them
Plug('pwntester/octo.nvim', {
    requires = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-telescope/telescope.nvim',
    }
})

Plug('knsh14/vim-github-link')

vim.call('plug#end')

-- Telescope configuration
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set({'n', 'v'}, '<leader>gh', ':GetCurrentBranchLink<CR>', {})

-- Find the .git directory or file in the current directory or its ancestors
local git_dir = vim.fn.finddir('.git', '.;')

-- If the .git directory or file is found, the current directory is a Git repository
if git_dir ~= '' then
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
else
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
end
vim.keymap.set('n', '<C-h>', ':Telescope live_grep default_text=<C-r><C-w><CR>', {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

-- Configure octo.nvim
require('octo').setup({
    enable_builtin = true,
    mappings = {
        pull_request = {
            add_comment = { lhs = "<leader>ca", desc = "add comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            review_start = { lhs = "<leader>vs", desc = "start a review for the current PR" },
            review_resume = { lhs = "<leader>vr", desc = "resume a pending review for the current PR" },
        },

        review_diff = {
          submit_review = { lhs = "<leader>vs", desc = "submit review" },
          discard_review = { lhs = "<leader>vd", desc = "discard review" },
          add_review_comment = { lhs = "<leader>ca", desc = "add a new review comment" },
          next_thread = { lhs = "]t", desc = "move to next thread" },
          prev_thread = { lhs = "[t", desc = "move to previous thread" },
          select_next_entry = { lhs = "]q", desc = "move to next changed file" },
          select_prev_entry = { lhs = "[q", desc = "move to previous changed file" },
          select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
          select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
          close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
          toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
          goto_file = { lhs = "gf", desc = "go to file" },
        },
    }
})

