local map = function(mode, lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set(mode, lhs, rhs, opts)
end

local L = function (key) return "<leader>" .. key end
local C = function (cmd) return "<Cmd>" .. cmd .. "<CR>" end

map({"x"     }, "<",     "<gv",         "De-indent visual selection")
map({"x"     }, ">",     ">gv",         "Indent visual selection")
map({"n"     }, "<Esc>", C"nohlsearch", "Clear hlsearch in normal mode")
map({"n"     }, "<C-d>", "Lzz",         "Scroll down and recenter")
map({"n"     }, "<C-u>", "Hzz",         "Scroll up and recenter")
map({"n", "x"}, L"y",    '"+y',         "Copy (y) to system clipboard")
map({"n"     }, L"Y",    '"+Y',         "Copy (Y) to system clipboard")
map({"n"     }, L"p",    '"+p',         "Paste (below) from system clipboard")
map({"n"     }, L"P",    '"+P',         "Paste (above) from system clipboard")

map({"n"     }, "gD", C"lua vim.lsp.buf.declaration()",     "Goto declaration")
map({"n"     }, "gd", C"lua vim.lsp.buf.definition()",      "Goto definition")
map({"n"     }, "gi", C"lua vim.lsp.buf.implementation()",  "Goto implementation")
map({"n"     }, "gR", C"lua vim.lsp.buf.references()",      "Goto references")
map({"n"     }, "gy", C"lua vim.lsp.buf.type_definition()", "Goto t[y]pe definition")
