-- Pull in the wezterm API
local wezterm = require("wezterm")
local action = wezterm.action
-- local mux = wezterm.mux
-- This will hold the configuration.
local config = wezterm.config_builder()
-- local gpus = wezterm.gui.enumerate_gpus()
-- config.webgpu_preferred_adapter = gpus[1]
-- config.front_end = "WebGpu"

config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color" -- Set the terminal type
config.font = wezterm.font({ family = "JetBrainsMono NF", weight = "Regular" })
config.cell_width = 1
config.window_background_opacity = 0.9
config.prefer_egl = true
config.font_size = 16.0
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
wezterm.on("toggle-colorscheme", function(window, _)
    local overrides = window:get_config_overrides() or {}
    if overrides.color_scheme == "Zenburn" then
        overrides.color_scheme = "Cloud (terminal.sexy)"
    else
        overrides.color_scheme = "Zenburn"
    end
    window:set_config_overrides(overrides)
end)

config.keys = {
    {
        key = "E",
        mods = "CTRL|SHIFT|ALT",
        action = wezterm.action.EmitEvent("toggle-colorscheme"),
    },
    { key = "L", mods = "CTRL", action = action.ShowDebugOverlay },
    {
        key = "O",
        mods = "CTRL|ALT",
        -- toggling opacity
        action = wezterm.action_callback(function(window, _)
            local overrides = window:get_config_overrides() or {}
            if overrides.window_background_opacity == 1.0 then
                overrides.window_background_opacity = 0.9
            else
                overrides.window_background_opacity = 1.0
            end
            window:set_config_overrides(overrides)
        end),
    },
}

local function scheme_for_appearance(appearance)
    if appearance:find("Dark") then
        return "catppuccin-mocha"
    else
        return "catppuccin-latte"
    end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

config.window_frame = {
    font = wezterm.font({ family = "JetBrainsMono NF", weight = "Regular" }),
    active_titlebar_bg = "#0c0b0f",
}

config.window_decorations = "NONE | RESIZE"
config.default_prog = { "powershell.exe", "-NoLogo" }
config.initial_cols = 80

return config
