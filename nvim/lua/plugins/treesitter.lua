return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    build = ":TSUpdate",
    lazy = false,
    opts = {
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query",
        "markdown", "markdown_inline", "java"
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  }
