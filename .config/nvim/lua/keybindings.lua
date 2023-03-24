local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- manage buffers
map('n', '<leader>qq', ':bw!<CR>')
map('i', '<leader>qq', '<ESC>:bw!<CR>')

-- :noh on <leader>h
map('n', '<leader>h', ':noh<CR>')

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')

-- Lazygit
map('n', '<leader>gg', ':LazyGit<CR>')

-- TO launch Coc-explorer
map('n', '<leader>e', ':CocCommand explorer<CR>')

