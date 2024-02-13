-- Work, personal zoom link from a hotkey!
hs.hotkey.bind({ "shift", "alt", "ctrl" }, "z", function()
  hs.eventtap.keyStrokes("https://rubiconmd.zoom.us/j/7111411118")
end)

-- Easy way to reload while working on the config
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "r", function()
  hs.reload()
end)
-- This is an example of a simple shortcut to show an alert
--[[ hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "W", function()
  hs.alert.show("Hello Steve")
end) ]]
-- This is an example of loading a spoon, and showing it
--[[ hs.loadSpoon("AClock")
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "C", function()
  spoon.AClock:toggleShow()
end) ]]

--This is an example of how to move a window around
--[[ hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "Y", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  f.y = f.y - 10
  win:setFrame(f)
end) ]]

-- Handy Dandy Date-ness
-- h for "heading"
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, 'h', function()
  local time = os.date("%Y-%m-%d")
  hs.eventtap.keyStrokes(time)
end)
-- i for "time"
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, 'i', function()
  local time = os.date("%Y-%m-%d %H:%M")
  hs.eventtap.keyStrokes(time)
end)

local open_app = function(mods, key, name)
  hs.hotkey.bind(mods, key, function()
    hs.application.launchOrFocus(name)
  end)
end
local run_shortcut = function(mods, key, name)
  hs.hotkey.bind(mods, key, function()
    hs.shortcuts.run(name)
    hs.alert.show(name)
  end)
end

open_app({}, "F2", "Wezterm")
open_app({}, "F3", "Slack")
open_app({}, "F4", "Arc")

run_shortcut({}, "F7", "Desk Audio")
run_shortcut({}, "F8", "Headset Audio")
run_shortcut({}, "F9", "Standing Audio")
run_shortcut({}, "F10", "Laptop Audio")

-- Simple notification to know that it has loaded up successfully
hs.alert.show("Config loaded")
