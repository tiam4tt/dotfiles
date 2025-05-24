vim.keymap.set('n','<C-b>', vim.cmd.NvimTreeToggle)
vim.keymap.set('n','<C-j>', ":below horizontal terminal<CR>i")
vim.keymap.set('n', '<M-f>', ":Telescope find_files<CR>")

vim.keymap.set('v', "J", ":m '<+1<CR>gv=gv")
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv")
