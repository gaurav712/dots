-- Typescript
vim.lsp.config["tsserver"] = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
}

vim.lsp.enable("tsserver")

vim.lsp.config["biome"] = {
    filetypes = { "astro", "css", "graphql", "html", "javascript", "javascriptreact", "json", "jsonc", "svelte", "typescript", "typescript.tsx", "typescriptreact", "vue" },
    worksplace_required = true,
    cmd = { "biome", "lsp-proxy" },
}

vim.lsp.enable('biome')

-- Golang
vim.lsp.config["gopls"] = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  root_markers = { "go.mod", ".git" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}

vim.lsp.enable("gopls")

-- Rust
vim.lsp.config["rust-analyzer"] = {
  cmd = { "rust-analyzer" },
  root_markers = { "Cargo.toml", "Cargo.lock" },
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}

vim.lsp.enable("rust-analyzer")

-- C/C++
vim.lsp.config["clangd"] = {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac",
    ".git"
  },
  settings = {
    clangd = {
      arguments = {
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--fallback-style=llvm"
      }
    }
  }
}

vim.lsp.enable("clangd")

-- LSP keybindings
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<leader>ds', vim.lsp.buf.document_symbol, opts)
vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)

-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false,
  }
)

-- LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- Set capabilities for all LSP clients
for _, config in pairs(vim.lsp.config) do
  config.capabilities = capabilities
end

-- Show diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
