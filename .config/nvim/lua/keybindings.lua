local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Close buffer
map('n', '<leader>qq', ':bw!<CR>')

-- :noh on <leader>h
map('n', '<leader>h', ':noh<CR>')

-- Telescope
map('n', '<leader>f', ':Telescope find_files<CR>')
map('n', '<leader>/', ':Telescope live_grep<CR>')
map('n', '<leader>b', ':Telescope buffers<CR>')

-- File Explorer
map('n', '<leader>e', ':Yazi<CR>')
