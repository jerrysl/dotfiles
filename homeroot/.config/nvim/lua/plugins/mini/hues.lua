local M = {}

M.randoscheme = function()
  math.randomseed(vim.loop.hrtime())
  local hues = require("mini.hues")
  local base_colors = hues.gen_random_base_colors()
  local opts = {
    background = base_colors.background,
    foreground = base_colors.foreground,
    saturation = vim.o.background == "dark" and "mediumhigh" or "high",
    accent = "azure",
  }
  hues.setup(opts)
end

return M

-- hues.setup({
--   background = '#2b1a33', -- purple
--   foreground = '#c9c5cb',
--
--   -- background = '#151025', -- deeeeep purple
--   -- foreground = '#c0c8cb',
--
--   -- background = '#11262e', -- dark blue/green
--   -- foreground = '#bfc6ca',
--
--   n_hues = 8,
--   saturation = 'mediumhigh',
--   accent = 'bg',
-- })
