require("lazydev").setup()

-- NOTE: The LSP doesn't seem to attach when I open a file directly
-- via `nvim filename.py`. It works when opening via `:e filename.py`
-- or through the picker. It could be related to other plugins triggering
-- some autocommand (BufRead?) before the lspconfig plugin, somehow
-- causing the plugin's FileType triggers to be skipped. See packer issue:
-- https://neovim.discourse.group/t/lsp-not-starting-automatically/1886/7
-- Probably unrelated though since I'm using MiniDeps.

-- These are lspconfig server names, not Mason's
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        diagnostics = {
          globals = { "vim", "hs" },
          disable = { "missing-fields" },
        },
        hint = { enable = true },
      },
    },
  },
  basedpyright = {
    settings = {
      basedpyright = {
        disableOrganizeImports = true,
        typeCheckingMode = "off",
      },
    },
  },
}

local ensure_installed = vim.tbl_keys(servers or {})
-- below are Mason's names for LSPs/linters/formatters
vim.list_extend(ensure_installed, {
  "dockerfile-language-server",
  "jsonlint",
  "prettierd",
  "ruff",
  "stylua",
  "typescript-language-server",
  "yamllint",
})

-- Establish baseline LSP capabilities provided by neovim.
-- Extra capabilities (like from plugins like cmp) can be added
-- on top via vim.tbl_deep_extend
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

-- local handlers = {
--   ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
--   ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
-- }

require("mason").setup()

-- this doesn't seem to auto-install anything with mason
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

require("mason-lspconfig").setup({
  ensure_installed = {},
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      -- server.handlers = vim.tbl_deep_extend("force", {}, handlers, server.handlers or {})
      -- add language-specific capabilities to our built-ins
      server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
      require("lspconfig")[server_name].setup(server)
    end,
  },
})
