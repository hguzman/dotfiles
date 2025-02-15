return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
	{ "<C-n>", ":NvimTreeToggle<CR>", desc = "Abrir/cerrar NvimTree" },
    },
    config = function()
      require("nvim-tree").setup({
	view = {
          width = 30,
          side = "left",
        },
        renderer = {
	  highlight_git = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
	filters = {
          dotfiles = false, -- Mostrar archivos ocultos
        },
	-- git = {
	-- 	ignore = false,  -- Esto desactiva la exclusión de archivos ignorados
	-- },
      })
    end,
  },
}

