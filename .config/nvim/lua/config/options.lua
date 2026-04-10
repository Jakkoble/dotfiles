vim.opt.termguicolors = true
vim.opt.shortmess:append("I")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.fillchars = { eob = " " }

vim.opt.selection = "inclusive"
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

vim.diagnostic.config({ virtual_text = true })
