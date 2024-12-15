-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {desc = "Abrir árbol de archivos"})
vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.wrap = true                   -- Habilitar el wrap
vim.opt.breakindent = true            -- Mantener la indentación en las líneas envueltas

