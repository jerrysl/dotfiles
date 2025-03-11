local hues = require("mini.hues")
local opts = {
  background = "#021d33",
  foreground = "#c0c8cb",
  accent = "azure",
  saturation = "mediumhigh",
}
hues.setup(opts)
vim.g.colors_name = "minihues-nightowl"
