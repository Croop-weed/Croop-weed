vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.number = true
vim.g.mapleader = " "
vim.keymap.set("v", "<leader>y", '"+y', {})
vim.keymap.set("n", "<F5>", ":RunCode<CR>", { noremap = true, silent = true })

