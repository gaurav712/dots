local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

local prettier_filetypes = {
  javascript = true,
  javascriptreact = true,
  typescript = true,
  typescriptreact = true,
  ["typescript.tsx"] = true,
  html = true,
  css = true,
  scss = true,
  less = true,
  markdown = true,
  ["markdown.mdx"] = true,
  json = true,
  jsonc = true,
  yaml = true,
  graphql = true,
}

local function format_buffer()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo[buf].filetype
  local filename = vim.api.nvim_buf_get_name(buf)

  -- if filetype is not prettier-supported
  if not prettier_filetypes[ft] then
    vim.lsp.buf.format()
    return
  end

  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local content = table.concat(lines, '\n')

  local result = vim.fn.system({
    'prettier',
    '--stdin-filepath',
    filename,
  }, content)

  if vim.v.shell_error ~= 0 then
    vim.notify('Prettier error: ' .. result, vim.log.levels.ERROR)
    return
  end

  local formatted_lines = vim.split(result, '\n')
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, formatted_lines)
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

-- Jump between hunks
vim.keymap.set('n', ']g', function()
  return vim.o.diff and ']g' or '<cmd>Gitsigns next_hunk<CR>'
end, { expr = true, silent = true })
vim.keymap.set('n', '[g', function()
  return vim.o.diff and '[g' or '<cmd>Gitsigns prev_hunk<CR>'
end, { expr = true, silent = true })

-- Popup what's changed in a hunk under cursor
map('n', '<leader>gp', ':Gitsigns preview_hunk<CR>')

-- Stage/reset individual hunks under cursor in a file
map('n', '<leader>gw', ':Gitsigns stage_hunk<CR>')
map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>')
map('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>')

-- Stage/reset all hunks in a file
map('n', '<leader>gW', ':Gitsigns stage_buffer<CR>')
map('n', '<leader>gR', ':Gitsigns reset_buffer<CR>')
map('n', '<leader>gU', ':Gitsigns reset_buffer_index<CR>')

-- Open git status in interative window (similar to lazygit)
map('n', '<leader>gg', ':Git<CR>')

-- Show `git status output`
map('n', '<leader>gs', ':Git status<CR>')

-- Open commit window in terminal (creates commit after writing and saving commit msg)
map('n', '<leader>gc', function()
  vim.cmd('terminal git commit')
  vim.cmd('startinsert')
end)

-- Toggle git blame
map('n', '<leader>gb', function()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo[buf].filetype

  if ft == 'gitsigns-blame' then
    vim.cmd('bd')
  else
    vim.cmd('Gitsigns blame')
  end
end)

-- Diff and merge
map('n', '<leader>gm', ':Git mergetool<CR>')
map('n', '<leader>gd', ':Gvdiffsplit<CR>')
map('n', '<leader>g_', ':Gdiffsplit<CR>')

-- LSP + telescope
map('n', '<leader>ls', ':Telescope lsp_document_symbols<CR>')
map('n', '<leader>lw', ':Telescope lsp_dynamic_workspace_symbols<CR>')
map('n', '<leader>le', function()
  require('telescope.builtin').diagnostics({ bufnr = 0 })
end)

-- LSP keybindings
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gr', vim.lsp.buf.references)
map('n', 'gi', vim.lsp.buf.implementation)
map('n', 'K', vim.lsp.buf.hover)
map('n', '<leader>rn', vim.lsp.buf.rename)
map('n', '<leader>ac', vim.lsp.buf.code_action)
map('n', 'ff', format_buffer)

-- Show diagnostics in a floating window
map('n', '<leader>e', vim.diagnostic.open_float)

