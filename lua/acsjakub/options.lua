-- :help <option name> (I wouldn't write it better)
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true  -- case sensitive if uppercase character in

vim.opt.splitright = true

vim.opt.scrolloff = 16

-- statusline?
vim.opt.statusline = "%F %m %n %= %p%% "

vim.opt.showtabline = 2 

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus" -- copies all yanks to system clipboard
