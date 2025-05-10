return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript", "html", "css", "ruby", "bash", "json", "yaml"},
        highlight = { enable = true },
	incremental_selection = { enable = true },
      })
    end,
  },
}

