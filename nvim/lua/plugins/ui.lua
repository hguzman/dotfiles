return {
  {
    "nvim-lualine/lualine.nvim", -- Barra de estado
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox",
        },
      })
    end,
  },
  {
    "gruvbox-community/gruvbox", -- Tema Gruvbox
    priority = 1000, -- Asegurarse de cargar primero
    config = function()
      vim.cmd("colorscheme gruvbox")
    end,
  },
}

