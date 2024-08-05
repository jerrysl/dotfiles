vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true

-- Wrapped lines indent to match their current line's indentation
vim.opt.breakindent = true
-- vim.opt.wrap = false

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Enable mouse mode, can be useful for resizing splits
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line (or lualine)
vim.opt.showmode = false
-- Set visibility of status line (0 = off, 3 = global)
vim.opt.laststatus = 0

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Vertical column for line width
vim.opt.colorcolumn = '88'

-- Swap file autosave interval (ms)
-- vim.opt.updatetime = 250
vim.opt.swapfile = false
vim.opt.backup = false

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type
vim.opt.inccommand = 'split'

-- Highlight line cursor is on
-- vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Make <C-u> and <C-d> center the cursor
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Move highlighted text with J and K (v mode is VISUAL and SELECT)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Make J join preserve cursor position
vim.keymap.set('n', 'J', 'mzJ`z')

-- Preserve selection when changing indentation
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- custom paste shortcut (x mode is VISUAL only)
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Visual mode paste thing...' })
vim.keymap.set('n', '<leader>p', [["+p]], { desc = 'Paste below from clipboard' })
vim.keymap.set('n', '<leader>P', [["+P]], { desc = 'Paste above from clipboard' })

-- custom yank shortcuts for system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- custom delete shortcut
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- theprimeagen's crazy substitute command - sub word under cursor in whole file
-- vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Diagnostic keymaps
-- TODO: do I need these if I'm using trouble.nvim?
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
--  TODO: figure out if this conflicts with tmux pane navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Toggle diagnostics (good for working on others' messy files)
local diag_toggle = true
vim.keymap.set('n', '<leader>mm', function()
  diag_toggle = not diag_toggle
  if diag_toggle then
    vim.diagnostic.config({ virtual_text = false })
    -- vim.diagnostic.config({ virtual_text = true })
    -- vim.diagnostic.show()
  else
    vim.diagnostic.config({ virtual_text = true })
    -- vim.diagnostic.config({ virtual_text = false })
    -- vim.diagnostic.hide()
  end
end, { desc = 'Toggle diagnostic messages' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Python: globally use Type highlight color on namespace.python types.
-- Combined with the semantic highlighting of the basedpyright LSP, this fixes
-- highlighting on lowercase python-builtin modules like requests, os, etc.
-- Also had to increase treesitter's priority of @variable.builtin types (self and cls)
-- by overriding them in a customized nvim/queries/python/highlights.scm. Otherwise
-- they show up the same color as @variable.parameter due to the LSP.
-- NOTE: using default as in { link = '@blah', default = true } will prevent
-- the link from overriding when there's already a link defined.
-- links:
-- https://neovim.io/doc/user/treesitter.html#treesitter-highlight-priority
-- https://github.com/neovim/neovim/discussions/29070
-- https://www.reddit.com/r/neovim/comments/184ni99/set_highlight_priority_for_a_single_highlight/
vim.api.nvim_create_autocmd({ 'VimEnter', 'User' }, {
  desc = 'Setup python semantic highlighting',
  group = vim.api.nvim_create_augroup('jerry-py-sem-hi', { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, '@lsp.type.namespace.python', { link = '@type' })
  end,
})
