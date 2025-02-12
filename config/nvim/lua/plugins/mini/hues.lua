local hues = require('mini.hues')
math.randomseed(vim.loop.hrtime())
hues.setup(hues.gen_random_base_colors())
