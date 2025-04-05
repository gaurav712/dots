local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- manage buffers
map('n', '<leader>qq', ':bw!<CR>')
map('i', '<leader>qq', '<ESC>:bw!<CR>')

-- :noh on <leader>h
map('n', '<leader>h', ':noh<CR>')

-- Telescope
map('n', '<leader>f', ':Telescope find_files<CR>')
map('n', '<leader>/', ':Telescope live_grep<CR>')
map('n', '<leader>b', ':Telescope buffers<CR>')

