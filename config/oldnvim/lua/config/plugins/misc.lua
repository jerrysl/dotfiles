return {
  { -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    event = { 'BufReadPre', 'BufNewFile' },
  },

  { -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    -- TODO: configure better keymaps
    opts = {},
  },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    -- From kickstart: event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- {
  --   'jiaoshijie/undotree',
  --   dependencies = 'nvim-lua/plenary.nvim',
  --   config = true,
  --   keys = {
  --     { '<leader>u', '<cmd>lua require("undotree").toggle()<cr>', desc = 'Toggle [u]ndo tree' },
  --   },
  -- },

  {
    'mbbill/undotree',
    opts = {
    },
    config = function()
      vim.g.undotree_WindowLayout = 2
      -- vim.g.undoTree_DiffpanelHeight = 15
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle [u]ndo tree' })
    end
  },

  -- Show indentation columns. NOTE: Highlights variable scope, not indentation!
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        show_start = false,
        show_end = false
      }
    }
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local nvimtree = require('nvim-tree')

      nvimtree.setup({
        view = {
          width = 45,
          relativenumber = true,
        },
        -- change folder arrow icons
        renderer = { indent_markers = { enable = true } },
        -- disable window_picker for
        -- explorer to work well with
        -- window splits
        -- actions = {
        --   open_file = {
        --     window_picker = {
        --       enable = false,
        --     },
        --   },
        -- },
        filters = {
          custom = { '.DS_Store' },
        },
      })

      vim.keymap.set('n', '<leader>xe', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' }) -- toggle file explorer
      vim.keymap.set('n', '<leader>xf', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file' }) -- toggle file explorer on current file
      vim.keymap.set('n', '<leader>xc', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' }) -- collapse file explorer
      vim.keymap.set('n', '<leader>xr', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' }) -- refresh file explorer
    end,
  },
}
