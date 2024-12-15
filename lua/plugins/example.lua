-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {} end

return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- NeoTree configuration
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Neotree" },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      })
    end,
  },

  -- Gruvbox theme
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- Trouble configuration
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
  { "folke/trouble.nvim", enabled = false },

  -- nvim-cmp configuration
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- Telescope configuration
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup{}
    end,
  },
  {
    'glepnir/dashboard-nvim',
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          header = {
            "██████╗  █████╗ ███████╗██╗   ██╗██╗███╗   ███╗",
            "██╔══██╗██╔══██╗██╔════╝██║   ██║██║████╗ ████║",
            "██████╔╝███████║███████╗██║   ██║██║██╔████╔██║",
            "██╔═══╝ ██╔══██║╚════██║██║   ██║██║██║╚██╔╝██║",
            "██║     ██║  ██║███████║╚██████╔╝██║██║ ╚═╝ ██║",
            "╚═╝     ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝╚═╝     ╚═╝",
          },
          -- Atajos personalizados
          shortcut = {
            { desc = " Buscar archivo", group = "@property", action = "Telescope find_files", key = "f" },
            { desc = " Archivos recientes", group = "@variable", action = "Telescope oldfiles", key = "r" },
            { desc = " Nuevo archivo", group = "@text", action = "enew", key = "n" },
            { desc = " Configuración", group = "Label", action = "e ~/.config/nvim/init.lua", key = "c" },
            { desc = " Salir", group = "Error", action = "q", key = "q" },
          },
          footer = { "🚀 Listo para el código con LazyVim 🚀" }, -- Mensaje al pie
        },
      })
    end, 
  },
  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
    },
    opts = {
      servers = {
        tsserver = {},
        pyright = {},
        html = {},
        cssls = {},
        jsonls = {},
        bashls = {},
        yamlls = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({
            server = opts,
          })
          return true
        end,
      },
    },
    config = function()
      local on_attach = function(_, buffer)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
        end
        map("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", "Organize Imports")
        map("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>", "Rename File")
      end

      require("lazyvim.util").lsp.on_attach(on_attach)
    end,
  },

  -- Treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- Additional tools with Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}
