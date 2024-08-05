return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    -- NOTE: uncomment for gitblame 'f-person/git-blame.nvim',
  },
  event = 'VimEnter',
  opts = function()
    --  NOTE: uncomment for gitblame local git_blame = require('gitblame')
    return {
      options = {
        component_separators = '|',
        section_separators = { left = '', right = '' },
        -- component_separators = '|',
        -- section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' }, -- { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          { 'filename', path = 4 },
          --  NOTE: uncomment for gitblame { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }, -- { { 'location', separator = { right = '' }, left_padding = 2 } },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end,
}
