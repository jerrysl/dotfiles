return {
  'folke/trouble.nvim',
  opts = {},
  cmd = 'Trouble',
  keys = {
    {
      '<leader>tt',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>tT',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '[t',
      '<cmd>Trouble diagnostics prev jump=true<cr>',
      desc = 'Previous Diagnostic (Trouble)',
    },
    {
      ']t',
      '<cmd>Trouble diagnostics next jump=true<cr>',
      desc = 'Next Diagnostic (Trouble)',
    },
  },
  -- {
  --   'folke/trouble.nvim',
  --   config = function()
  --     require('trouble').setup {
  --       icons = false,
  --     }
  --
  --     vim.keymap.set('n', '<leader>tt', function()
  --       require('trouble').toggle()
  --     end)
  --
  --     vim.keymap.set('n', '[t', function()
  --       require('trouble').next { skip_groups = true, jump = true }
  --     end, { desc = 'Trouble next diagnostic' })
  --
  --     vim.keymap.set('n', ']t', function()
  --       require('trouble').previous { skip_groups = true, jump = true }
  --     end, { desc = 'Trouble previous diagnostic' })
  --   end,
  -- },
}
