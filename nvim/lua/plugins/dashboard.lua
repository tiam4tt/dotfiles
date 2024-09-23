return {
    'nvimdev/dashboard-nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    event = 'VimEnter',
    config = function()
        local db = require('dashboard')
        db.setup({
            theme = 'hyper',
            config = {
                week_header = {
                    enable = false
                },
                header = {
                    '',
                    '██╗  ██╗██╗   ██╗███████╗       ███╗   ██╗ ██████╗ ██╗    ██╗██╗',
                    '██║ ██╔╝╚██╗ ██╔╝██╔════╝       ████╗  ██║██╔═══██╗██║    ██║██║',
                    '█████╔╝  ╚████╔╝ ███████╗       ██╔██╗ ██║██║   ██║██║ █╗ ██║██║',
                    '██╔═██╗   ╚██╔╝  ╚════██║       ██║╚██╗██║██║   ██║██║███╗██║╚═╝',
                    '██║  ██╗   ██║   ███████║▄█╗    ██║ ╚████║╚██████╔╝╚███╔███╔╝██╗',
                    '╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝    ╚═╝  ╚═══╝ ╚═════╝  ╚══╝╚══╝ ╚═╝',
                    ''
                },
                shortcut = {
                    {
                        icon = ' ',
                        desc = "Search files ",
                        group = 'File',
                        key = 's',
                        action = 'Telescope find_files'
                    },
                    {
                        icon = '  ',
                        desc = "Open file tree ",
                        group = 'File',
                        key = 'e',
                        action = 'NvimTreeToggle'
                    },
                    {
                        icon = ' ',
                        desc = "Update plugins",
                        group = 'Plugin',
                        key = 'u',
                        action = 'Lazy update'
                    },
                    {
                        icon = '󰈆 ',
                        desc = "Exit Neovim",
                        group = 'Command',
                        key = 'q',
                        action = 'q'
                    }
                },
                packages = { enable = false },
                mru = { limit = 5 },
                project = {
                    enable = false
                },
                footer = { '', '[ TIP: To exit NeoVim, hold down power button for 5 seconds. ]' }
            },
            hide = {
                status_line = true,
            },
        })
    end,
}
