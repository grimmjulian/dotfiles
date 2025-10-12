return ({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- <— tell the LSP that `vim` is a global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- include Neovim runtime
        checkThirdParty = false, -- disable annoying “third-party” popup
      },
      telemetry = { enable = false },
    },
  },
})
