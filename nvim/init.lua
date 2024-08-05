require("config.lazy")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.cmd("colorscheme carbonfox")

local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<C-f>', builtin.find_files(), {})
vim.cmd("set relativenumber")
