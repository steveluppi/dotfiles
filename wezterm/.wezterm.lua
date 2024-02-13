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
config.colors = {
  background= '#181818'
}
config.window_background_opacity = .90
config.macos_window_background_blur = 20
-- config.font = wezterm.font 'SpaceMono Nerd Font Mono'
config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 18
config.hide_tab_bar_if_only_one_tab = true

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
  format = "https://rubiconmd.atlassian.net/browse/$1",
})

-- and finally, return the configuration to wezterm
return config
