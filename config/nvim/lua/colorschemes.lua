
local sources = {
    'AstroNvim/astrotheme',
    'folke/tokyonight.nvim',
    'catppuccin/nvim',
    'ellisonleao/gruvbox.nvim',
    'rebelot/kanagawa.nvim',
    'EdenEast/nightfox.nvim',
    'olimorris/onedarkpro.nvim',
    'projekt0n/github-nvim-theme',
    'marko-cerovac/material.nvim',
    'sainnhe/everforest',
    'Mofiqul/vscode.nvim',
    'scottmckendry/cyberdream.nvim',
    'Mofiqul/dracula.nvim',
    'rose-pine/neovim',
}

for i = 1, #sources do
    MiniDeps.add({
        source = sources[i],
    })
end

require('kanagawa').setup({
    undercurl = true,
    keywordStyle = {
        bold = true,
        italic = false
    }
})

MiniDeps.later(function() require('astrotheme').setup() end)
