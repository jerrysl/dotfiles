local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 14

-- config.color_scheme = "Kanagawa"

-- require("everforest-dark").activate(config)
-- require("colorschemes.gruvbox-material-hard").activate(config)
-- require("colorschemes.minihues-blue").activate(config)
require("colorschemes.minihues-charcoal").activate(config)
-- require("colorschemes.minihues-cyan").activate(config)
-- require("colorschemes.minihues-emerald").activate(config)
-- require("colorschemes.minihues-lavender").activate(config)
-- require("colorschemes.minihues-maroon").activate(config)
-- require("colorschemes.minihues-nightowl").activate(config)
-- require("colorschemes.minihues-olive").activate(config)
-- require("colorschemes.minihues-purple").activate(config)
-- require("colorschemes.minihues-slate").activate(config)
-- require("colorschemes.minihues-teal").activate(config)

-- Option (or Alt) + Enter is used in Mini.Pick in Neovim
config.keys = {
  { key = 'Return', mods = 'OPT', action = wezterm.action.DisableDefaultAssignment, },
}

return config

-- BELOW IS PKAZ'S CONFIG. It's too much. I don't have all the fonts installed
-- and I don't feel like molding my dotfiles (ansible included) to include all
-- his fancy options. If I ever want to try it again in full, I'll also need
-- the other files in his repo that this depends on.

-- local wezterm = require("wezterm")
-- local selector = require("config-selector")
-- local act      = wezterm.action
-- local config   = wezterm.config_builder()
--
-- -- My dynamic configuration selectors
-- local fonts    = selector.new({ title = "Font Selector",          subdir = "fonts" })
-- local inactive = selector.new({ title = "Inactive Pane Selector", subdir = "inactivepanes" })
-- local leading  = selector.new({ title = "Font Leading Selector",  subdir = "leadings" })
-- local schemes  = selector.new({ title = "Color Scheme Selector",  subdir = "colorschemes" })
-- local sizes    = selector.new({ title = "Font Size Selector",     subdir = "sizes" })
-- local opacity  = selector.new({ title = "Opacity Selector",       subdir = "opacity" })
--
-- fonts:select(config, "JetBrains Mono")
-- schemes:select(config, "Kanagawa")
--
-- -- Configuration
-- config.front_end = "WebGpu"
-- config.force_reverse_video_cursor = true
--
-- config.use_resize_increments = false
-- config.adjust_window_size_when_changing_font_size = false
--
-- config.window_frame = {
--   font = wezterm.font({ family = "JetBrains Mono", weight = "ExtraBold" }),
--   font_size = 12,
-- }
-- config.window_padding = {
--   left = 0,
--   right = 0,
--   top = 0,
--   bottom = 0,
-- }
--
-- -- config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
--
-- -- Option (or Alt) + Enter is used in Mini.Pick in Neovim
-- config.keys = {
--   { key = 'Return', mods = 'OPT', action = wezterm.action.DisableDefaultAssignment, },
-- }
--
-- config.mouse_bindings = {
--   {
--     event = { Down = { streak = 3, button = "Left" } },
--     action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
--     mods = "NONE",
--   },
-- }
--
-- config.leader = { key = "o", mods = "SUPER", timeout_milliseconds = 1000 }
--
-- -- stylua: ignore
-- config.keys = {
--   -- { key = "Return", mods = "ALT",    action = wezterm.action.DisableDefaultAssignment },
--   { key = "=",      mods = "SUPER",  action = act.EmitEvent "kaz-inc-font-size" },
--   { key = "-",      mods = "SUPER",  action = act.EmitEvent "kaz-dec-font-size" },
--   { key = "[",      mods = "SUPER",  action = act.ActivatePaneDirection("Prev") },
--   { key = "\\",     mods = "SUPER",  action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
--   { key = "]",      mods = "SUPER",  action = act.ActivatePaneDirection("Next") },
--   { key = "c",      mods = "LEADER", action = schemes:selector_action() },
--   { key = "f",      mods = "LEADER", action = fonts:selector_action() },
--   { key = "i",      mods = "LEADER", action = inactive:selector_action() },
--   { key = "l",      mods = "LEADER", action = leading:selector_action() },
--   { key = "l",      mods = "SUPER",  action = act.RotatePanes("Clockwise") },
--   { key = "o",      mods = "LEADER", action = opacity:selector_action() },
--   { key = "p",      mods = "LEADER", action = act.PaneSelect },
--   { key = "p",      mods = "SUPER",  action = act.PaneSelect },
--   { key = "r",      mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
--   { key = "s",      mods = "LEADER", action = sizes:selector_action() },
--   { key = "s",      mods = "SUPER",  action = act.PaneSelect({ mode = "SwapWithActive" }) },
--   { key = "x",      mods = "LEADER", action = act.PaneSelect({ mode = "SwapWithActive" }) },
--   { key = "z",      mods = "SUPER",  action = act.TogglePaneZoomState },
--   { key = "|",      mods = "SUPER",  action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
-- }
--
-- config.key_tables = {
--   resize_pane = {
--     { key = "Escape", action = "PopKeyTable" },
--     { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
--     { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
--     { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
--     { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
--   },
-- }
--
-- -- Event handlers
--
-- -- Better inc/dec font size
-- wezterm.on("kaz-inc-font-size", function(window)
--   local size = window:effective_config().font_size + 1
--   local overrides = window:get_config_overrides() or {}
--   overrides.font_size = size
--   window:set_config_overrides(overrides)
-- end)
-- wezterm.on("kaz-dec-font-size", function(window)
--   local size = window:effective_config().font_size - 1
--   local overrides = window:get_config_overrides() or {}
--   overrides.font_size = size
--   window:set_config_overrides(overrides)
-- end)
--
-- -- Add font name and size to status bar
-- wezterm.on("update-right-status", function(window)
--   local font = window:effective_config().font.font[1].family
--   local size = window:effective_config().font_size
--   local status = wezterm.format({
--     "ResetAttributes",
--     { Background = { Color = "#666666" } },
--     { Foreground = { Color = "White" } },
--     { Text = string.format(" %s %spt  ", font, size) },
--   })
--   window:set_right_status(status)
-- end)
--
-- -- Customize the tab title to show zoom icon when zoomed
-- wezterm.on("format-tab-title", function(tab)
--   local icon = ""
--   local attrs = {
--     { Background = { Color = "#333333" } },
--   }
--   if tab.is_active then
--     table.insert(attrs, { Foreground = { Color = "#CCCCCC" } })
--   end
--   if tab.active_pane.is_zoomed then
--     icon = "🔎 "
--     table.insert(attrs, { Foreground = { Color = "Orange" } })
--   end
--   table.insert(attrs, {
--     Text = "[" .. tab.tab_index + 1 .. "] " .. icon .. tab.active_pane.title,
--   })
--   return attrs
-- end)
--
-- return config
