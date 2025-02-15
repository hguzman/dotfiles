return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope", -- Carga solo si usas el comando :Telescope
    config = function()
	    local actions = require('telescope.actions')  -- Importar actions de Telescope
	    require("telescope").setup({
		    defaults = {
			    mappings = {
				    i = {
					    ["<C-d>"] = actions.close,  -- Mapea <C-d> para cerrar el buffer
				    },
			    },
			    hidden = true,  -- Permite la búsqueda de archivos ocultos
		    },
	    })
    end,
    keys = {
      -- Atajos personalizados para Telescope
      { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Buscar archivos" },
      { "<C-f>", "<cmd>Telescope live_grep<CR>", desc = "Buscar texto en el proyecto" },
      { "<C-b>", "<cmd>Telescope buffers<CR>", desc = "Listar buffers abiertos" },
      { "<C-h>", "<cmd>Telescope help_tags<CR>", desc = "Buscar en la ayuda de Neovim" },
    },
  }
}
