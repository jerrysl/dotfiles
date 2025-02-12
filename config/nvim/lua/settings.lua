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

-- Toggle diagnostics (good for working on others' messy files)
-- Awkward function from my old config
local diag_toggle = true
vim.keymap.set("n", "<leader>cd", function()
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
end, { desc = "Toggle Diagnostic [M]essages" })

-- Python: globally use the Type highlight color on namespace.python types.
-- Combined with the semantic highlighting of the basedpyright LSP, this fixes
-- highlighting on lowercase python-builtin modules like requests, os, etc.
-- Also had to increase treesitter's priority of @variable.builtin types (self and cls)
-- by overriding them in a customized nvim/queries/python/highlights.scm. Otherwise
-- they show up the same color as @variable.parameter due to the LSP having a higher
-- priority than treesitter.
-- This looks good with Tokyonight at least.
-- NOTE: using default as in { link = '@blah', default = true } will prevent
-- the link from overriding when there's already a link defined.
-- links:
-- https://neovim.io/doc/user/treesitter.html#treesitter-highlight-priority
-- https://github.com/neovim/neovim/discussions/29070
-- https://www.reddit.com/r/neovim/comments/184ni99/set_highlight_priority_for_a_single_highlight/
vim.api.nvim_create_autocmd({ "VimEnter", "User" }, {
	desc = "Setup python semantic highlighting",
	group = vim.api.nvim_create_augroup("jerry-py-sem-hi", { clear = true }),
	callback = function()
		vim.api.nvim_set_hl(0, "@lsp.type.namespace.python", { link = "@type" })
	end,
})
