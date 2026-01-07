local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<leader>qq', ':bw!<CR>')
map('n', '<leader>h', ':noh<CR>')

-- mini.pick stuff
local MiniPick = require('mini.pick')
map('n', '<leader>f', function() MiniPick.builtin.files({ tool = 'git' }) end)
map('n', '<leader>/', function() MiniPick.builtin.grep_live() end)
map('n', '<leader>b', function() MiniPick.builtin.buffers() end)
map('n', '<leader>j', function() MiniPick.builtin.jumps() end)

-- git branches
local function parse_git_lines(output)
  local lines = {}
  for line in output:gmatch('[^\n]+') do
    table.insert(lines, line)
  end
  return lines
end

map('n', '<leader>gb', function()
  MiniPick.start({
    source = {
      name = 'Git Branches',
      items = function()
        local output = vim.fn.system('git branch --format="%(refname:short)"')
        return parse_git_lines(output)
      end,
      choose = function(item)
        local result = vim.fn.system('git checkout ' .. vim.fn.shellescape(item))
        if vim.v.shell_error == 0 then
          vim.cmd('checktime')
        else
          vim.notify('Git checkout failed: ' .. result, vim.log.levels.ERROR)
        end
      end,
    }
  })
end)

-- git status
map('n', '<leader>gs', function()
  MiniPick.start({
    source = {
      name = 'Git Status',
      items = function()
        local output = vim.fn.system('git status --porcelain')
        local lines = parse_git_lines(output)
        local files = {}
        for _, line in ipairs(lines) do
          local file = line:match('%S+%s+(.+)')
          if file then
            table.insert(files, file)
          end
        end
        return files
      end,
      choose = function(item)
        vim.cmd('edit ' .. item)
      end,
    }
  })
end)

-- lsp symbols
map('n', '<leader>ls', vim.lsp.buf.document_symbol)
map('n', '<leader>lw', vim.lsp.buf.workspace_symbol)