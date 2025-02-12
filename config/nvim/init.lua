-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path }
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require("mini.deps").setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Config
now(function()
	require("colorschemes")
end)
now(function()
	vim.cmd("colorscheme kanagawa")
end)
-- now(function() vim.cmd('colorscheme randomhue') end)
now(function()
	require("settings")
end)
now(function()
	require("mappings")
end)

-- Mini plugins
now(function()
	require("mini.icons").setup()
end)
now(function()
	require("mini.tabline").setup()
end)
now(function()
	require("mini.statusline").setup()
end)

now(function()
	require("plugins.mini.basics")
end)
now(function()
	require("plugins.mini.animate")
end)
-- now(function() require('plugins.mini.hues') end)
now(function()
	require("plugins.mini.notify")
end)

later(function()
	require("mini.ai").setup()
end)
later(function()
	require("mini.align").setup()
end)
later(function()
	require("mini.bracketed").setup()
end)
later(function()
	require("mini.bufremove").setup()
end)
later(function()
	require("mini.colors").setup()
end)
later(function()
	require("mini.comment").setup()
end)
later(function()
	require("mini.misc").setup()
end)
later(function()
	require("mini.move").setup()
end)
later(function()
	require("mini.splitjoin").setup()
end)

later(function()
	require("plugins.mini.clue")
end)
later(function()
	require("plugins.mini.completion")
end)
later(function()
	require("plugins.mini.files")
end)
later(function()
	require("plugins.mini.hipatterns")
end)
-- later(function() require('plugins.mini.indentscope') end)
later(function()
	require("plugins.mini.pick")
end)
later(function()
	require("plugins.mini.sessions")
end)
later(function()
	require("plugins.mini.extra")
end)

-- Other plugins
later(function()
	add({ source = "stevearc/conform.nvim" })
	require("plugins.conform")
end)

later(function()
	add({ source = "lukas-reineke/indent-blankline.nvim" })
	require("ibl").setup()
end)

later(function()
	add({ source = "OXY2DEV/markview.nvim" })
	require("markview").setup()
end)

later(function()
	add({ source = "fnune/recall.nvim" })
	require("recall").setup()
end)

later(function()
	add({
		source = "NeogitOrg/neogit",
		depends = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			-- mini.pick already included in my config
		},
	})
	require("neogit").setup({})
end)

later(function()
	add({
		source = "neovim/nvim-lspconfig",
		depends = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"folke/lazydev.nvim",
		},
	})
	require("plugins.lspconfig")
end)

later(function()
	add({
		source = "nvim-treesitter/nvim-treesitter",
		-- Use 'master' while monitoring updates in 'main'
		checkout = "master",
		monitor = "main",
		-- Perform action after every checkout
		hooks = {
			post_checkout = function()
				vim.cmd("TSUpdate")
			end,
		},
	})
	-- Possible to immediately execute code which depends on the added plugin
	require("plugins.treesitter")
end)

later(function()
	add({
		source = "CopilotC-Nvim/CopilotChat.nvim",
		depends = {
			"github/copilot.vim",
			"nvim-lua/plenary.nvim",
		},
	})
	require("plugins.copilot")
end)
