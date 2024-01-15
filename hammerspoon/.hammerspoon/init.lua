-- Work, personal zoom link from a hotkey!
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "z", function()
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

-- Simple notification to know that it has loaded up successfully
hs.alert.show("Config loaded")
