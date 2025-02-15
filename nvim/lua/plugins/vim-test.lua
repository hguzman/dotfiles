return {
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>tf", ":TestFile<CR>", desc = "Ejecutar todas las pruebas del archivo actual" },
      { "<leader>tn", ":TestNearest<CR>", desc = "Ejecutar la prueba más cercana" },
      { "<leader>ts", ":TestSuite<CR>", desc = "Ejecutar todas las pruebas del proyecto" },
      { "<leader>tl", ":TestLast<CR>", desc = "Volver a ejecutar la última prueba" },
      { "<leader>tr", ":TestSummary<CR>", desc = "Mostrar resumen" },
    },
    config = function()
	    vim.g["test#strategy"] = "neovim" -- Ejecuta las pruebas en un terminal flotante
	    vim.g["test#ruby#runner"] = "rspec"  -- Configura el runner para Ruby (si estás usando RSpec)

	    -- Configura las variables de vim-test para que busque en las carpetas correctas
	    vim.g["test#dir"] = "spec"  -- Directorio base donde se encuentran las pruebas
	    vim.g["test#file_extension"] = { "rb" }  -- Extensiones de archivo de prueba (.rb en Ruby)
	    vim.g["test#pattern"] = "spec/handlers"  -- Subcarpeta donde se encuentran las pruebas
    end,
  },
}
