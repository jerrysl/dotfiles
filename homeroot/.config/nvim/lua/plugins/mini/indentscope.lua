local indentscope = require('mini.indentscope')
indentscope.setup({
    draw = {
        delay = 0,
        animation = indentscope.gen_animation.none()
    },
    symbol = '▎'
})

-- Disable the indent line for certain files/windows - pkazmier
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "dashboard",
    "Trouble",
    "trouble",
    "lazy",
    "mason",
    "notify",
    "toggleterm",
    "lazyterm",
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
