local clue = require('mini.clue')
clue.setup({
    window = {
        delay = 300,
        config = { width = 'auto', border = 'single' },
    },

    triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- `[]` keys (mini.bracketed)
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },

        -- `\` key (mini.basics mappings for vim option toggles)
        { mode = "n", keys = [[\]] },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
    },

    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        { mode = "n", keys = "<leader>b",  desc = "Buffers" },
        { mode = "n", keys = "<leader>c",  desc = "Code" },
        { mode = "n", keys = "<leader>f",  desc = "Files" },
        { mode = "n", keys = "<leader>g",  desc = "Git/diff" },
        { mode = "n", keys = "<leader>gf", desc = "Find files" },
        -- { mode = "n", keys = "<leader>m",  desc = "Map" },
        { mode = "n", keys = "<leader>m",  desc = "Mark Recall" },
        { mode = "n", keys = "<leader>M",  desc = "Mini" },
        { mode = "n", keys = "<leader>s",  desc = "Search" },
        { mode = "n", keys = "<leader>x",  desc = "Quickfix" },
        { mode = "n", keys = "<leader>q",  desc = "Quit/session" },

        -- generated clues
        clue.gen_clues.builtin_completion(),
        clue.gen_clues.g(),
        clue.gen_clues.marks(),
        clue.gen_clues.registers(),
        clue.gen_clues.windows(),
        clue.gen_clues.z(),
    },
  })

