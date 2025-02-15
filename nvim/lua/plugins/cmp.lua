return {
  {
    "hrsh7th/nvim-cmp", -- Motor de autocompletado
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Autocompletado para LSP
      "hrsh7th/cmp-buffer",   -- Autocompletado para buffers abiertos
      "hrsh7th/cmp-path",     -- Autocompletado para rutas
      "L3MON4D3/LuaSnip",     -- Soporte para snippets
      "saadparwaiz1/cmp_luasnip",   -- Conectar LuaSnip con nvim-cmp
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup {
	      snippet = {
		      expand = function(args)
			      luasnip.lsp_expand(args.body)
		      end,
	      },
	      mapping = cmp.mapping.preset.insert {
		      ["<Tab>"] = cmp.mapping(function(fallback)
			      if luasnip.expand_or_jumpable() then
				      luasnip.expand_or_jump()
			      else
				      fallback()
			      end
		      end, { "i", "s" }),
		      ["<S-Tab>"] = cmp.mapping(function(fallback)
			      if luasnip.jumpable(-1) then
				      luasnip.jump(-1)
			      else
				      fallback()
			      end
		      end, { "i", "s" }),
		      -- ["<CR>"] = cmp.mapping.confirm { select = true },
		      ["<Tab>"] = cmp.mapping.confirm { select = true }, -- Usa Tab para confirmar
		      ["<CR>"] = cmp.mapping(function(fallback)
			      fallback() -- Evita que Enter confirme automáticamente
		      end),
		      ["<C-e>"] = cmp.mapping.close(),
		      ['<C-Space>'] = cmp.mapping.complete(),  -- Iniciar autocompletar manualmente
	      },
	      sources = cmp.config.sources({
		      { name = "nvim_lsp" },
		      { name = "luasnip" },
		      { name = "buffer" },
		      { name = "path" },
	      }),
      }
    end,
  },
}
