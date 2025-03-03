return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true, -- Habilita Treesitter para detección inteligente
				fast_wrap = {
					map = "<M-e>", -- Atajo para cerrar paréntesis rápido (Alt + e)
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%)%>%]%)%}%,]]=],
					offset = 0, -- Posición del cursor después de insertar
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "Search",
					highlight_grey = "Comment"
				}
			})

			-- Integración con nvim-cmp (si usas autocompletado)
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end
	}

}

