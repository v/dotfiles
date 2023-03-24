local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- Find the .git directory or file in the current directory or its ancestors
local git_dir = vim.fn.finddir('.git', '.;')

-- If the .git directory or file is found, the current directory is a Git repository
if git_dir ~= '' then
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
else
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
end
vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
