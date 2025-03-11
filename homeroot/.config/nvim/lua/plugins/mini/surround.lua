require("mini.surround").setup({
  -- by default surround uses 's' instead of 'gz'. I don't want to override vim's 's'.
  mappings = {
    add = "gza", -- Add surrounding in Normal and Visual modes
    delete = "gzd", -- Delete surrounding
    find = "gzf", -- Find surrounding (to the right)
    find_left = "gzF", -- Find surrounding (to the left)
    highlight = "gzh", -- Highlight surrounding
    replace = "gzr", -- Replace surrounding
    update_n_lines = "gzn", -- Update `n_lines`
  },
})
