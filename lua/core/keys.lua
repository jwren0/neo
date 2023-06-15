local utils = require("core.utils")

-- Set leader to space
vim.g.mapleader = " "

-- Terminal
utils.nmap("<leader>h", ":15split +terminal<CR>")
utils.nmap("<leader>v", ":vsplit +terminal<CR>")

-- Smooth scrolling
utils.map("<ScrollWheelUp>", "2<C-Y>")
utils.map("<ScrollWheelDown>", "2<C-E>")

-- Moving lines
utils.imap("<A-Up>", "<Esc>:m .-2<CR>==gi")
utils.imap("<A-Down>", "<Esc>:m .+1<CR>==gi")

utils.nmap("<A-Up>", ":m .-2<CR>==")
utils.nmap("<A-Down>", ":m .+1<CR>==")

utils.vmap("<A-Up>", ":m '<-2<CR>gv=gv")
utils.vmap("<A-Down>", ":m '>+1<CR>gv=gv")
