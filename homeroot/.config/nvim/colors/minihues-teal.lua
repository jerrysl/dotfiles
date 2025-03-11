local hues = require("mini.hues")
local opts = {
  background = "#12252e",
  foreground = "#c0c8cc",
  accent = "azure",
  saturation = "mediumhigh",
}
hues.setup(opts)
vim.g.colors_name = "minihues-teal"
