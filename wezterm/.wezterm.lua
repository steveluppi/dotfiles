-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'SpaceGray'
config.color_scheme = 'Catppuccin Frappe'
-- config.color_scheme = 'Catppuccin Latte'
config.colors = {
  -- background= '#000000'
  -- background= '#ffffff'
  -- background= '#181818'
  -- background= '#eeeeee'
}
config.macos_window_background_blur = 20
config.font = wezterm.font 'SauceCodePro NFM'
-- config.font = wezterm.font 'SpaceMono Nerd Font Mono'
-- config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 18
config.hide_tab_bar_if_only_one_tab = true

-- config.window_background_image = '/Users/steveluppi/Pictures/wallpaper.jpg'
-- config.window_background_image = '/Users/steveluppi/Pictures/IMG_0153.JPG'
--config.window_background_opacity = .5
config.window_background_image_hsb = {
    brightness = .085,
}

---Hyperlinks
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- make username/project paths clickable (with shift+click). this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
table.insert(config.hyperlink_rules, {
  regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
  format = "https://www.github.com/$1/$3",
})

-- JIRA cards (PE-411)
table.insert(config.hyperlink_rules, {
  regex = [[([A-Z]+-\d+)]],
  format = "https://cvs-hcd.atlassian.net/browse/$1",
})

-- This is added to support zenmode
wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

-- and finally, return the configuration to wezterm
return config
