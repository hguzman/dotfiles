return {
	{
		"akinsho/flutter-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- Opcional, para mejorar la interfaz de selección
		},
		config = function()
			require("flutter-tools").setup {
				-- Configuraciones adicionales si es necesario
			}
		end,
	}

}
