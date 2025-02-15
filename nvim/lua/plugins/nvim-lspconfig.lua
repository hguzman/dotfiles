return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").solargraph.setup({
	      cmd = { "solargraph", "stdio" },
	      filetypes = { "ruby" },
	      init_options = { formatting = true },
	      settings = {
		      solargraph = {
			      diagnostics = true, -- Habilitar diagnósticos
		      },
	      },
      })
    end,
  },
}
