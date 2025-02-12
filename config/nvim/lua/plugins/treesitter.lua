require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'go',
        'groovy',
        'javascript',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'typescript',
        'vim',
        'vimdoc',
    },
    -- auto_install = true -- default??
    highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = {
        enable = true,
        disable = { 'ruby', 'markdown' },
    },
})
