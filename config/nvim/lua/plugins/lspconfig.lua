require('lazydev').setup()

local servers = {
    lua_ls = {
        settings = {
            Lua = {
                completion = {
                    callSnippet = 'Replace',
                },
                diagnostics = {
                    globals = { 'vim', 'hs' },
                    disable = { 'missing-fields' },
                },
                hint = { enable = true },
            },
        },
    },

    basedpyright = {
        settings = {
            basedpyright = {
                disableOrganizeImports = true,
                typeCheckingMode = 'off',
            },
        },
    },
}

local ensure_installed = vim.tbl_keys(servers or {})
-- below are Mason's names for LSPs/linters/formatters
vim.list_extend(ensure_installed, {
    'basedpyright',
    'black',
    'dockerfile-language-server',
    'isort',
    'jsonlint',
    'lua-language-server',
    'prettierd',
    'ruff',
    'stylua',
    'typescript-language-server',
    'yamllint',
})

-- This handles overriding only values explicitly passed
-- by the server configuration above. Useful when disabling
-- certain features of an LSP (for example, turning off formatting for tsserver)
local capabilities = vim.lsp.protocol.make_client_capabilities()

require('mason').setup()

-- this doesn't seem to auto-install anything with mason
require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
        end,
    },
})
