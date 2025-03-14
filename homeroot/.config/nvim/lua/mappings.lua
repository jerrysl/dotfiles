-- This is mostly copied from pkazmier's repo. I added a few of my own and
-- either removed or commented out stuff I don't need.

-- Mapping helpers ==========================================================
local map = function(mode, lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set(mode, lhs, rhs, opts)
end

local L = function (key) return "<leader>" .. key end
local C = function (cmd) return "<Cmd>" .. cmd .. "<CR>" end

-- Basic mappings ===========================================================
map({"x"     }, "<",          "<gv",                                           "De-indent visual selection")
map({"x"     }, ">",          ">gv",                                           "Indent visual selection")
map({"n"     }, "<Esc>",      C"nohlsearch",                                   "Clear hlsearch in normal mode")
map({"i"     }, "<C-k>",      C"lua vim.lsp.buf.signature_help()",             "Signature help")
map({"n"     }, "-",          C"lua require('plugins.mini.files').bufdir()",   "Mini.Files Explorer")
map({"n"     }, "<C-h>",      C"lua MiniBracketed.buffer('backward')",         "Prev buffer")
map({"n"     }, "<C-l>",      C"lua MiniBracketed.buffer('forward')",          "Next buffer")
map({"n"     }, "gD",         C"lua vim.lsp.buf.declaration()",                "Goto declaration")
map({"n"     }, "gd",         C"lua vim.lsp.buf.definition()",                 "Goto definition")
map({"n"     }, "gi",         C'Pick lsp scope="implementation"',              "Goto implementation")
map({"n"     }, "gR",         C'Pick lsp scope="references"',                  "Goto references")
map({"n"     }, "gy",         C'Pick lsp scope="type_definition"',             "Goto t[y]pe definition")
map({"n"     }, "z=",         C'Pick spellsuggest',                            "Spelling suggestions")
map({"n"     }, [[\f]],       C"FormatToggle",                                 "Toggle auto-format")
map({"n"     }, [[\h]],       ":let v:hlsearch = 1 - v:hlsearch<CR>",          "Toggle hlsearch")
map({"n"     }, [[\i]],       C"lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())", "Toggle inlay hints")
map({"n"     }, "<C-w>m",     C"lua MiniMisc.zoom()",                          "Zoom buffer")
map({"n"     }, "<M-/>",      C"lua require('plugins.mini.hues').randoscheme({})", "Randomize colorscheme")
-- map({"n"     }, "<M-/>",      C"lua require('colors.minihues-myrandom')",      "Randomize colorscheme")

-- Leader mappings ==========================================================
map({"n", "x"}, L"y",   '"+y',                                                 "Copy (y) to system clipboard")
map({"n"     }, L"Y",   '"+Y',                                                 "Copy (Y) to system clipboard")
map({"n"     }, L"p",   '"+p',                                                 "Paste (below) from system clipboard")
map({"n"     }, L"P",   '"+P',                                                 "Paste (above) from system clipboard")
map({"x"     }, "p",    'd"+p',                                                "Paste (below) over selection from system clipboard")
map({"x"     }, "P",    'd"+P',                                                "Paste (above) over selection from system clipboard")
map({"n"     }, L" ",   C"Pick files",                                         "Find files")
map({"n"     }, L",",   C"Pick buffers",                                       "Switch buffer")
map({"n"     }, L"/",   C'Pick buf_lines scope="current" preserve_order=true', "Search buffer")
map({"n"     }, L"ba",  C"b#",                                                 "Alternate buffer")
map({"n"     }, L"bd",  C"lua require('mini.bufremove').delete()",             "Delete buffer")
map({"n"     }, L"bD",  C"%bd|e#|bd#",                                         "Delete other buffers")
map({"n"     }, L"bu",  C"lua require('mini.bufremove').unshow()",             "Unshow buffer")
map({"n"     }, L"bw",  C"lua require('mini.bufremove').wipeout()",            "Wipeout buffer")
map({"n"     }, L"cc",  C"lua require('plugins.copilot').copilot_toggle()",    "Toggle Copilot")
map({"n"     }, L"cC",  C"CopilotChatToggle",                                  "Toggle CopilotChat window")
map({"n"     }, L"cD",  C"lua vim.diagnostic.open_float()",                    "Show diagnostic messages")
map({"n"     }, L"cd",  C"lua require('utils').toggle_diagnostic()",           "Toggle diagnostics (buffer)")
map({"n"     }, L"cr",  C"lua vim.lsp.buf.rename()",                           "Rename symbol")
map({"n"     }, L"ca",  C"lua vim.lsp.buf.code_action()",                      "Code Action")
map({"n"     }, L"fE",  C"lua require('plugins.mini.files').cwd()",            "File explorer (cwd)")
map({"n"     }, L"fb",  C"Pick buffers",                                       "Find buffers")
map({"n"     }, L"fc",  C"Pick config",                                        "Find config file")
map({"n"     }, L"fe",  C"lua require('plugins.mini.files').bufdir()",         "File explorer (buf)")
map({"n"     }, L"ff",  C"Pick files",                                         "Find files")
map({"n"     }, L"fr",  C"Pick oldfiles",                                      "Find recent files:h")
map({"n"     }, L"gb",  C"vertical Git blame -- %",                            "Git history")
map({"n"     }, L"gD",  C'Pick lsp scope="declaration"',                       "Pick from declarations")
map({"n"     }, L"gd",  C'Pick lsp scope="definition"',                        "Pick from definitions")
map({"n"     }, L"gfd", C'Pick git_files scope="deleted"',                     "Find deleted files")
map({"n"     }, L"gfg", C"Pick git_files",                                     "Find git files")
map({"n"     }, L"gfi", C'Pick git_files scope="ignored"',                     "Find ignored files")
map({"n"     }, L"gfm", C'Pick git_files scope="modified"',                    "Find modified files")
map({"n"     }, L"gfu", C'Pick git_files scope="untracked"',                   "Find untracked files")
map({"n"     }, L"gg",  C"Neogit",                                             "Toggle Neogit")
map({"n"     }, L"gl",  C"Git hist",                                           "Git history")
map({"n"     }, L"gL",  C"Git hist --all",                                     "Git history (all)")
map({"n"     }, L"go",  C"lua MiniDiff.toggle_overlay()",                      "Toggle diff")
map({"n"     }, L"gq",  C"lua require('plugins.mini.diff').to_qf()",           "Quickfix diffs")
map({"n", "x"}, L"gs",  C"lua MiniGit.show_at_cursor()",                       "MiniGit show at cursor")
map({"n"     }, L"mm",  C"RecallToggle",                                       "Recall: toggle mark on this line")
map({"n"     }, L"mn",  C"RecallNext",                                         "Recall: next mark")
map({"n"     }, L"mp",  C"RecallPrevious",                                     "Recall: previous mark")
map({"n"     }, L"mc",  C"RecallClear",                                        "Recall: clear all global marks")
map({"n"     }, L"ml",  C"Pick recall",                                        "Recall: pick mark from list")
map({"n"     }, L"Mm",  C"Mason",                                              "Mason")
map({"n"     }, L"Mu",  C"DepsUpdate",                                         "Update deps")
map({"n"     }, L"MS",  C"DepsSnapSave",                                       "Save snapshot")
map({"n"     }, L"ML",  C"DepsSnapLoad",                                       "Load snapshot")
map({"n"     }, L"qd",  C"lua require('plugins.mini.sessions').delete()",      "Delete session")
map({"n"     }, L"ql",  C"lua MiniSessions.select()",                          "Load session")
map({"n"     }, L"qq",  C"qa",                                                 "Quit all")
map({"n"     }, L"qs",  C"lua require('plugins.mini.sessions').save()",        "Save session")
map({"n"     }, L"qt",  C"Pick colorschemes",                                  "Pick colorschemes")
map({"n"     }, L's"',  C"Pick registers",                                     "Search registers")
map({"n"     }, L"sB",  C'Pick buf_lines scope="all"',                         "Search all buffers")
map({"n"     }, L"sC",  C"Pick commands",                                      "Search commands")
map({"n"     }, L"sH",  C"Pick hl_groups",                                     "Search highlight groups")
map({"n"     }, L"sS",  C'Pick lsp scope="workspace_symbol"',                  "Workspace symbol")
map({"n"     }, L"sT",  C"Pick treesitter",                                    "Treesitter objects")
map({"n"     }, L"sb",  C'Pick buf_lines scope="current"',                     "Search buffer")
map({"n"     }, L"sc",  C"Pick history",                                       "Search history")
map({"n"     }, L"sd",  C"Pick diagnostic",                                    "Search diagnostics")
map({"n"     }, L"sg",  C"Pick grep_live_align",                               "Search files (align)")
map({"n"     }, L"sG",  C"Pick grep_live",                                     "Search files")
map({"n"     }, L"sh",  C"Pick help",                                          "Search help")
map({"n"     }, L"sk",  C"Pick keymaps",                                       "Search keymaps")
map({"n"     }, L"so",  C"Pick options",                                       "Search options")
map({"n"     }, L"sr",  C"Pick resume",                                        "Resume picker")
map({"n"     }, L"ss",  C'Pick lsp scope="document_symbol"',                   "Document symbol")
map({"n"     }, L"st",  C'Pick grep pattern="(TODO|FIXME|HACK|NOTE):"',        "Search Todo/Note")
map({"n"     }, L"xx",  C"lua vim.diagnostic.setloclist()",                    "Open diagnostic quickfix list")
-- map({"n"     }, L"fL",  C"lua MiniVisits.remove_label()",                      "Remove label")
-- map({"n"     }, L"fV",  C"Pick visit_labels",                                  "Find visited labels")
-- map({"n"     }, L"fl",  C"lua MiniVisits.add_label()",                         "Add label")
-- map({"n"     }, L"fv",  C"Pick visit_paths",                                   "Find visited files")
-- map({"n"     }, L"mf",  C"lua MiniMap.toggle_focus()",                         "Focus")
-- map({"n"     }, L"mr",  C"lua MiniMap.refresh()",                              "Refresh")
-- map({"n"     }, L"ms",  C"lua MiniMap.toggle_side()",                          "Switch sides")
-- map({"n"     }, L"mt",  C"lua require('plugins.mini.map').toggle()",           "Toggle map")
-- map({"n"     }, L"mT",  C"lua require('plugins.mini.map').buf_toggle()",       "Toggle map (buf)")
map({"n"     }, L"Me",  C"lua require('utils').export_minihues_theme()",       "Export MiniHues theme")
-- map({"n"     }, L"Ms",  C"lua MiniStarter.open()",                             "Open starter")
