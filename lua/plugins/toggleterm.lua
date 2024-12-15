return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- Usar la última versión disponible
    config = function()
      require("toggleterm").setup({
        size = 20, -- Tamaño inicial del terminal
        open_mapping = [[<C-t>]], -- Mapeo para abrir/cerrar terminal
        direction = "float", -- Terminal flotante
        float_opts = {
          border = "curved", -- Bordes curvados
          winblend = 10, -- Transparencia
          title = " Terminal", -- Título con ícono Nerd Font
          title_pos = "center", -- Centrado
        },
        -- Cambiar automáticamente al directorio actual
        on_open = function(term)
          vim.cmd("startinsert")
          local current_dir = vim.fn.getcwd()
          if term and term.bufnr then
            vim.api.nvim_buf_call(term.bufnr, function()
              vim.cmd("cd " .. current_dir)
            end)
          end
        end,
        -- Mensaje al cerrar la terminal
        on_close = function(term)
          print("Cerrando terminal: " .. term.name)
        end,
      })

      -- Mapas de teclas para manejar terminales
      local keymap = vim.keymap.set

      -- Alternar terminal flotante con Ctrl+t
      keymap("n", "<C-t>", ":ToggleTerm<CR>", { desc = "Abrir/Cerrar terminal flotante" })

      -- Crear una nueva terminal con Ctrl+Shift+t
      keymap("n", "<C-S-t>", ":ToggleTerm<CR>", { desc = "Abrir una nueva terminal flotante" })

      -- Navegar entre terminales:
      keymap("n", "<leader>tn", ":ToggleTermSetNext<CR>", { desc = "Siguiente terminal" })
    end,
  },
}
