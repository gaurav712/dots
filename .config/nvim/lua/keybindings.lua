local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<leader>qq', ':bw!<CR>')
map('n', '<leader>h', ':noh<CR>')

-- Telescope
map('n', '<leader>f', ':Telescope find_files<CR>')
map('n', '<leader>/', ':Telescope live_grep<CR>')
map('n', '<leader>b', ':Telescope buffers<CR>')
map('n', '<leader>j', ':Telescope jumplist<CR>')

-- Git
map('n', '<leader>gb', ':Telescope git_branches<CR>')
map('n', '<leader>gs', ':Telescope git_status<CR>')

-- LSP
map('n', '<leader>ls', ':Telescope lsp_document_symbols<CR>')
map('n', '<leader>lw', ':Telescope lsp_dynamic_workspace_symbols<CR>')
