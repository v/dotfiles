vim.g.mapleader = ","
vim.keymap.set("n", "<leader>n", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<esc>", {noremap=true})
vim.keymap.set("i", "jj", "<esc>", {noremap=true})

-- move command in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- copies to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q:", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quickfix commands
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/vverma/packer.lua<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

if vim.api.nvim_win_get_option(0, "diff") then
    vim.keymap.set("n", "qq", ":qa<cr>", {noremap=true})
end
