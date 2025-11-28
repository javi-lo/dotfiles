return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig"
  },
  opts = {
    ensure_installed = {
      "clangd",
      "cssls",
      "gopls",
      "lua_ls",
      "pyright",
      "svelte",
      "tailwindcss",
      "ts_ls"
    }
  }
}
