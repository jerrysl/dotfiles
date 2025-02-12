return {
  -- Colorschemes (except default) are lazy loaded with a user event.
  -- User event is called when opening color picker in telescope.
  -- https://github.com/folke/lazy.nvim/discussions/1167#discussioncomment-8726381

  {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'tokyonight-night'
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'AstroNvim/astrotheme',
    event = "User LazyColorscheme",
    config = function()
      require('astrotheme').setup()
    end,
  },

  {
    'catppuccin/nvim',
    event = "User LazyColorscheme",
  },

  {
    'ellisonleao/gruvbox.nvim',
    event = "User LazyColorscheme",
  },

  {
    'rebelot/kanagawa.nvim',
    event = "User LazyColorscheme",
  },

  {
    'EdenEast/nightfox.nvim',
    event = "User LazyColorscheme",
  },

  -- {
  --   'navarasu/onedark.nvim',
  --   event = "User LazyColorscheme",
  -- },

  {
    'olimorris/onedarkpro.nvim',
    event = "User LazyColorscheme",
  },

  {
    'projekt0n/github-nvim-theme',
    event = "User LazyColorscheme",
  },

  {
    'marko-cerovac/material.nvim',
    event = "User LazyColorscheme",
  },

  {
    'sainnhe/everforest',
    event = "User LazyColorscheme",
  },

  {
    'Mofiqul/vscode.nvim',
    event = "User LazyColorscheme",
  },

  {
    'scottmckendry/cyberdream.nvim',
    event = "User LazyColorscheme",
  },

  {
    'Mofiqul/dracula.nvim',
    event = "User LazyColorscheme",
  },

  {
    'rose-pine/neovim',
    event = "User LazyColorscheme",
    name = 'rose-pine',
    opts = {
      styles = { italic = false },
    },
    -- priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme 'rose-pine'
      -- vim.cmd.hi 'Comment gui=none'
    -- end,
  },
}
