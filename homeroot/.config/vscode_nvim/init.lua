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

-- Settings and mappings
now(function() require("settings") end)
now(function() require("mappings") end)

-- Mini plugins
now(function() require("plugins.mini.basics") end)

later(function() require("mini.ai").setup() end)
later(function() require("mini.align").setup() end)
later(function() require("mini.bracketed").setup() end)
later(function() require("mini.comment").setup() end)
later(function() require("mini.misc").setup() end)
later(function() require("mini.move").setup() end)
later(function() require("mini.splitjoin").setup() end)

later(function() require("plugins.mini.hipatterns") end)
later(function() require("plugins.mini.extra") end)
