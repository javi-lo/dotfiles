return  {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      -- A list of parser names, or "all" (the listed parsers MUST always be installed)
      ensure_installed = { "cpp", "python", "java", "javascript", "typescript", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },

      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end
}
