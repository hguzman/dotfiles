return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup {
        direction = "float", -- Terminal flotante
        float_opts = {
          border = "curved",
        },
      }
    end,
    keys = {
      { "<leader>tt", ":ToggleTerm<CR>", desc = "Abrir terminal flotante" },
    },
  },
}
