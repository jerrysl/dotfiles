-- Not needed when using a good colorscheme. Surprised tokyonight doesn't do
-- type/namespace highlighting that works well with python.

-- Python: globally use the Type highlight color on namespace.python types.
-- Combined with the semantic highlighting of the basedpyright LSP, this fixes
-- highlighting on lowercase python-builtin modules like requests, os, etc.
-- Also had to increase treesitter's priority of @variable.builtin types (self and cls)
-- by overriding them in a customized nvim/queries/python/highlights.scm. Otherwise
-- they show up the same color as @variable.parameter due to the LSP having a higher
-- priority than treesitter.
-- This looks good with Tokyonight at least. Some colorschemes have good highlight
-- colors for python builtin types, but not all of them.
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
