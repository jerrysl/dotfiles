vim.g.mapleader = " "
vim.g.maplocaleader = " "
vim.o.expandtab = true
vim.o.scrolloff = 4
vim.o.shiftwidth = 4
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.wrap = true

vim.g.disable_autoformat = true

-- omitting noselect was causing me to autocomplete on Enter when
-- trying to type on a new line. super annoying so I'm re-enabling
-- mini.completion's default settings
-- vim.opt.completeopt = { 'menuone', 'noinsert' }
-- vim.opt.shortmess:append "c"
