-- Using built-in Neovim LSP (no lsp-zero or other LSP plugins)

local data_dir = vim.fn.stdpath('data') .. '/site'
if vim.fn.empty(vim.fn.glob(data_dir .. '/autoload/plug.vim')) == 1 then
  vim.fn.system('curl -fLo ' .. data_dir .. '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  vim.api.nvim_create_autocmd('VimEnter', {
    command = 'PlugInstall --sync | source $MYVIMRC'
  })
end

-- Plugin installation
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })

-- Then plugins that depend on them
Plug('v/octo.nvim', {
    requires = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-telescope/telescope.nvim',
    }
})

Plug('tpope/vim-rhubarb')
vim.call('plug#end')

-- Telescope setup (only if plugin is installed)
local ok, telescope = pcall(require, "telescope")
if ok then
  telescope.setup {}

  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find files' })
  vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Find buffers' })
  vim.keymap.set('n', '<C-h>', function()
    builtin.live_grep({ default_text = vim.fn.expand('<cword>') })
  end, { desc = 'Live grep word under cursor' })
end

-- Detect default branch (main or master)
local function default_branch()
  local ref = vim.fn.system('git symbolic-ref refs/remotes/origin/HEAD'):gsub('%s+', '')
  return ref:match('refs/remotes/origin/(.+)') or 'main'
end
local _default_branch = default_branch()

-- Get default branch GitHub link (normal: current line, visual: selected range)
vim.keymap.set('n', '<leader>gh', function()
  vim.cmd('.GBrowse! origin/' .. _default_branch .. ':%')
end, { desc = 'Copy default branch GitHub link' })
vim.keymap.set('v', '<leader>gh', function()
  vim.cmd("'<,'>GBrowse! origin/" .. _default_branch .. ':%')
end, { desc = 'Copy default branch GitHub link (range)' })

-- Enable tsgo for TypeScript/JavaScript (after plugins are loaded)
vim.lsp.enable('tsgo')

-- Configure octo.nvim (guarded so first-run before PlugInstall doesn't error)
local octo_ok, octo = pcall(require, 'octo')
if octo_ok then octo.setup({
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
}) end

