return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Agrega la Layer a RUBYLIB para que Solargraph pueda encontrarla
			-- vim.env.RUBYLIB = vim.fn.expand("~/develop/ruby/aws_sam/electoral-sam/layers/core/ruby/lib/") .. ":" .. (vim.env.RUBYLIB or "")

			local lib_path = vim.fn.expand("~/develop/ruby/aws_sam/electoral-sam/layers/core/ruby/lib")
			-- Asegurar que RUBYLIB tenga la ruta de la layer
			vim.env.RUBYLIB = lib_path .. ":" .. (vim.env.RUBYLIB or "")
			local lspconfig = require("lspconfig")
			lspconfig.solargraph.setup({
				cmd = { "solargraph", "stdio" },
				filetypes = { "ruby" },
				init_options = { formatting = true },
				settings = {
					solargraph = {
						diagnostics = true, -- Habilitar diagnósticos
						workspace = {
							library = { lib_path }
						}
					},
				},
			})
			-- Configuración para Dart (Flutter)
			lspconfig.dartls.setup({})
			lspconfig.pyright.setup({})
		end,
	},
}
