-- ~/.config/nvim/lua/plugins/dashboard.lua
-- Configuración profesional del dashboard-nvim para Yamid Dev
return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local dashboard = require("dashboard")
    local os = require("os")

    -- Obtener la fecha, hora y día actual
    local datetime = os.date("%d-%m-%Y %H:%M:%S")
    local day_of_week = os.date("%A") -- Obtener el día de la semana
    -- Generar encabezado dinámico con toilet
    local function generate_toilet_header()
      -- Traducción de días de la semana al español
      local days_translation = {
        Monday = "Lunes",
        Tuesday = "Martes",
        Wednesday = "Miércoles",
        Thursday = "Jueves",
        Friday = "Viernes",
        Saturday = "Sábado",
        Sunday = "Domingo",
      }
      local current_day = days_translation[day_of_week] or day_of_week
      -- Definir los colores del arcoíris
      local rainbow_colors = {
        "#FF0000", -- Rojo
        "#FF7F00", -- Naranja
        "#FFFF00", -- Amarillo
        "#00FF00", -- Verde
        "#0000FF", -- Azul
        "#4B0082", -- Índigo
        "#9400D3", -- Violeta
      }

      -- Configurar grupos de resaltado dinámicamente
      for i, color in ipairs(rainbow_colors) do
        vim.api.nvim_set_hl(0, "Rainbow" .. i, { fg = color, bold = true })
      end
      --local week_days = { "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo" }

      -- Resaltar el día actual
      --for i, day in ipairs(week_days) do
      --if day == current_day then
      --week_days[i] = "[" .. day .. "]" -- Resaltar con corchetes
      --break
      --end
      --end

      -- Crear encabezado como string
      local header = current_day -- Junta los días con un espacio

      -- Ejecutar comando toilet, limpiar ANSI y guardar en archivo temporal
      os.execute('echo "' .. header .. "\" | toilet -f mono9 --gay | sed 's/\x1b\\[[0-9;]*m//g' > /tmp/dashboard")
      local file = io.open("/tmp/dashboard", "r")
      if not file then
        -- Si no se puede abrir, devolver un mensaje de error
        return "Error: No se pudo generar el encabezado."
      end

      local toilet_header = file:read("*a") or ""
      file:close()

      return toilet_header
    end

    local toilet_header = generate_toilet_header()

    dashboard.setup({
      theme = "hyper",
      config = {
        -- Encabezado profesional con colores, fecha, hora y día
        header = vim.split(toilet_header, "\n"),
        -- Opciones del centro con iconos y acciones
        center = {
          {
            icon = "  ",
            desc = "Find Files                              ",
            action = "Telescope find_files",
            key = "SPC f f",
          },
          {
            icon = "  ",
            desc = "Open Recent Files                       ",
            action = "Telescope oldfiles",
            key = "SPC f r",
          },
          {
            icon = "  ",
            desc = "Search Text Globally                    ",
            action = "Telescope live_grep",
            key = "SPC f w",
          },
          {
            icon = "  ",
            desc = "Open Bookmarks                          ",
            action = "Telescope marks",
            key = "SPC f m",
          },
          {
            icon = "  ",
            desc = "Restore Last Session                    ",
            action = "SessionLoad",
            key = "SPC s l",
          },
          {
            icon = "  ",
            desc = "Browse Files                            ",
            action = "Telescope file_browser",
            key = "SPC f b",
          },
        },
        -- Pie de página personalizado con colores
        footer = {
          "                                           ",
          "                                           ",
          "   ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓   ",
          "   ┃  💡 Tip: Stay consistent, keep    ┃   ",
          "   ┃        learning and coding!       ┃   ",
          "   ┃  📖 Docs: https://neovim.io/doc/  ┃   ",
          "   ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛   ",
        },
      },
    })
  end,
}
