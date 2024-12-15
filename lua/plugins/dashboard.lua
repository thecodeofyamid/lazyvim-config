-- ~/.config/nvim/lua/plugins/dashboard.lua
-- Configuración profesional del dashboard-nvim para Yamid Dev
return {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        local dashboard = require('dashboard')
        local os = require('os')

        -- Obtener la fecha, hora y día actual
        local datetime = os.date('%d-%m-%Y %H:%M:%S')
        local day_of_week = os.date('%A')  -- Obtener el día de la semana

        -- Definir diferentes encabezados para cada día de la semana
        local headers = {
            Monday = {
                '┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓',
                '┃                                        ┃',
                '┃          ¡Feliz Lunes!                   ┃',
                '┃    Comienza la semana con energía       ┃',
                '┃                                        ┃',
                '┃             🌟 Yamid Dev 🌟             ┃',
                '┃                                        ┃',
                '┃             ' .. datetime .. '           ┃',
                '┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛',
            },
            Tuesday = {
                '┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓',
                '┃                                        ┃',
                '┃          ¡Feliz Martes!                  ┃',
                '┃        Sigue avanzando en tus metas     ┃',
                '┃                                        ┃',
                '┃             🌟 Yamid Dev 🌟             ┃',
                '┃                                        ┃',
                '┃             ' .. datetime .. '           ┃',
                '┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛',
            },
            Wednesday = {
                '┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓',
                '┃                                        ┃',
                '┃          ¡Feliz Miércoles!               ┃',
                '┃          Mitad de semana alcanzada      ┃',
                '┃                                        ┃',
                '┃             🌟 Yamid Dev 🌟             ┃',
                '┃                                        ┃',
                '┃             ' .. datetime .. '           ┃',
                '┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛',
            },
            Thursday = {
                '┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓',
                '┃                                        ┃',
                '┃          ¡Feliz Jueves!                  ┃',
                '┃        Casi llegamos al fin de semana    ┃',
                '┃                                        ┃',
                '┃             🌟 Yamid Dev 🌟             ┃',
                '┃                                        ┃',
                '┃             ' .. datetime .. '           ┃',
                '┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛',
            },
            Friday = {
                '┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓',
                '┃                                        ┃',
                '┃          ¡Feliz Viernes!                 ┃',
                '┃          Último empujón de la semana     ┃',
                '┃                                        ┃',
                '┃             🌟 Yamid Dev 🌟             ┃',
                '┃                                        ┃',
                '┃             ' .. datetime .. '           ┃',
                '┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛',
            },
            Saturday = {
        '                                                 ',
        '┌───────────────────────────────────────────────┐',
        '│   _____       __                 __           │',
        '│  / ___/____ _/ /___  ___________/ /___ ___  __│',
        '│  \\__ \\/ __ `/ __/ / / / ___/ __  / __ `/ / / /│',
        '│ ___/ / /_/ / /_/ /_/ / /  / /_/ / /_/ / /_/ / │',
        '│/____/\\__,_/\\__/\\__,_/_/   \\__,_/\\__,_/\\__, /  │',
        '│                                      /____/   │',
            '│      Fecha: ' .. datetime .. '      │',        
        '└───────────────────────────────────────────────┘',
            },
            Sunday = {
            },
        }

        -- Seleccionar el encabezado según el día actual
        local selected_header = headers[day_of_week] or headers.Monday  -- Por defecto lunes si no coincide

        dashboard.setup({
            theme = 'hyper',
            config = {
                -- Encabezado profesional con colores, fecha, hora y día
                header = selected_header,
                -- Opciones del centro con iconos y acciones
                center = {
                    {
                        icon = '  ',
                        desc = 'Find Files                              ',
                        action = 'Telescope find_files',
                        key = 'SPC f f',
                    },
                    {
                        icon = '  ',
                        desc = 'Open Recent Files                       ',
                        action = 'Telescope oldfiles',
                        key = 'SPC f r',
                    },
                    {
                        icon = '  ',
                        desc = 'Search Text Globally                    ',
                        action = 'Telescope live_grep',
                        key = 'SPC f w',
                    },
                    {
                        icon = '  ',
                        desc = 'Open Bookmarks                          ',
                        action = 'Telescope marks',
                        key = 'SPC f m',
                    },
                    {
                        icon = '  ',
                        desc = 'Restore Last Session                    ',
                        action = 'SessionLoad',
                        key = 'SPC s l',
                    },
                    {
                        icon = '  ',
                        desc = 'Browse Files                            ',
                        action = 'Telescope file_browser',
                        key = 'SPC f b',
                    },
                },
                -- Pie de página personalizado con colores
                footer = {
                    '                                           ',
                    '                                           ',
                    '   ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓   ',
                    '   ┃  💡 Tip: Stay consistent, keep    ┃   ',
                    '   ┃        learning and coding!       ┃   ',
                    '   ┃  📖 Docs: https://neovim.io/doc/  ┃   ',
                    '   ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛   ',
                },
            },
        })
    end,
}
