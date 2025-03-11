require("blink.cmp").setup({
  fuzzy = { implementation = "lua" }, -- don't feel like dealing with nightly rust toolchain
  completion = {
    documentation = {
    auto_show = true,
    },
    menu = {
      draw = {
      treesitter = { "lsp" },
      },
    },
  },
  signature = {
    enabled = true,
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "normal",
  },
})
