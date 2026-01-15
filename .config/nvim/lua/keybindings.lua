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
map('n', '<leader>gS', ':Gitsigns stage_buffer<CR>')
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

-- LSP
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

-- Show diagnostics in a floating window
map('n', '<leader>e', vim.diagnostic.open_float)

-- Open opencode in floating terminal
local opencode_term_buf = nil
local opencode_term_win = nil

local function toggle_opencode_cli_float()
  local width  = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row    = math.floor((vim.o.lines - height) / 2)
  local col    = math.floor((vim.o.columns - width) / 2)

  -- check if window exists and is valid
  if opencode_term_win and vim.api.nvim_win_is_valid(opencode_term_win) then
    -- if window exists, toggle visibility
    vim.api.nvim_win_close(opencode_term_win, true)
    opencode_term_win = nil
    return
  end

  -- window doesn't exist, create or show it
  if opencode_term_buf and vim.api.nvim_buf_is_valid(opencode_term_buf) then
    -- buffer exists, just open a new window for it
    opencode_term_win = vim.api.nvim_open_win(opencode_term_buf, true, {
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
    })
  else
    -- first launch; create buffer and start opencode
    opencode_term_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(opencode_term_buf, "bufhidden", "hide")

    opencode_term_win = vim.api.nvim_open_win(opencode_term_buf, true, {
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
    })

    vim.fn.termopen({ "opencode" })
  end

  vim.cmd("startinsert")

  -- hide window on <Esc>
  vim.keymap.set("t", "<leader>hh", function()
    if opencode_term_win and vim.api.nvim_win_is_valid(opencode_term_win) then
      vim.api.nvim_win_close(opencode_term_win, true)
      opencode_term_win = nil
    end
  end, { buffer = opencode_term_buf, silent = true })
end

map("n", "<leader>hh", toggle_opencode_cli_float)
