vim.keymap.set('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })  -- Guardar archivo
vim.keymap.set('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })  -- Cerrar archivo
vim.keymap.set('n', '<Leader>Q', ':q!<CR>', { noremap = true, silent = true })  -- Salir sin guardar
vim.keymap.set('n', '<Leader>x', ':wq<CR>', { noremap = true, silent = true })  -- Guardar y salir
vim.keymap.set('n', '<Leader>n', ':NerdTreeToggle<CR>', { noremap = true, silent = true })  -- Abrir explorador de archivos (si tienes NerdTree o otro explorador)
vim.keymap.set('n', '<Leader>t', ':terminal<CR>', { noremap = true, silent = true })  -- Abrir terminal

-- Navegar entre ventanas con Leader
vim.keymap.set('n', '<Leader>h', '<C-w>h', { noremap = true, silent = true })  -- Moverse a la izquierda
vim.keymap.set('n', '<Leader>j', '<C-w>j', { noremap = true, silent = true })  -- Moverse abajo
vim.keymap.set('n', '<Leader>k', '<C-w>k', { noremap = true, silent = true })  -- Moverse arriba
vim.keymap.set('n', '<Leader>l', '<C-w>l', { noremap = true, silent = true })  -- Moverse a la derecha

-- Tabs
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Siguiente Tab" })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Tab Anterior" })
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Nuevo Tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Cerrar Tab" })

-- Abrir init.lua
vim.keymap.set('n', '<Leader>v', ':e $MYVIMRC<CR>', { noremap = true, silent = true })

-- Mapeo para <Leader><CR> que quita el resaltado de búsqueda
vim.keymap.set('n', '<Leader><CR>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Salir de edicion con jk
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "jk", "<C-c>", { noremap = true, silent = true })

-- Atajos flutter
-- vim.api.nvim_set_keymap('n', '<leader>fr', ':FlutterRun<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>fd', ':FlutterDevices<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>fq', ':FlutterQuit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fs', ':FlutterRun<CR>', { silent = true, desc = 'Flutter Run' })   -- Start (Run)
vim.keymap.set('n', '<leader>fr', ':FlutterHotReload<CR>', { silent = true, desc = 'Flutter Hot Reload' }) -- Reload
vim.keymap.set('n', '<leader>fR', ':FlutterHotRestart<CR>', { silent = true, desc = 'Flutter Hot Restart' }) -- Restart
vim.keymap.set('n', '<leader>fd', ':FlutterDevices<CR>', { silent = true, desc = 'Flutter Devices' }) -- Devices
vim.keymap.set('n', '<leader>fe', ':FlutterEmulators<CR>', { silent = true, desc = 'Flutter Emulators' }) -- Emulators
vim.keymap.set('n', '<leader>fq', ':FlutterQuit<CR>', { silent = true, desc = 'Flutter Quit' }) -- Quit


-- Renombrar archivo
vim.keymap.set("n", "<leader>rn", function()
  local new_name = vim.fn.input("Nuevo nombre: ", vim.fn.expand("%"), "file")
  if new_name ~= "" and new_name ~= vim.fn.expand("%") then
    vim.cmd("saveas " .. new_name)
    vim.cmd("silent !rm " .. vim.fn.expand("%"))  -- Eliminar el archivo original
    vim.cmd("bdelete!")  -- Cerrar el buffer original
  end
end, { desc = "Renombrar archivo actual" })

