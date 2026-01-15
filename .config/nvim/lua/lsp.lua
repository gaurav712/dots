-- pyright
vim.lsp.config["pyright"] = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}

vim.lsp.enable("pyright")

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
