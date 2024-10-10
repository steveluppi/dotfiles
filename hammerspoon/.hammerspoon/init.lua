-- Set up the local functions that we are going to use
MY_MODS = 'cmd-ctrl-alt'

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

local tap = function(send) hs.eventtap.keyStrokes(send) end

SEND_IT = function(to_send)
  return function() tap(to_send) end
end

local send_it = function(to_send)
  return function() tap(to_send) end
end
local tmux_send_it = function(to_send)
  return function()
    hs.eventtap.keyStroke('ctrl', 'space')
    tap(to_send)
  end
end

hs.hotkey.bind(MY_MODS, 'pad.', function() hs.alert.show('Main') end)

-- Easy way to reload while working on the config
hs.hotkey.bind(MY_MODS, "r", function() hs.reload() end)

modal_shorts = hs.hotkey.modal.new(MY_MODS, 'pad0')
function modal_shorts:entered() hs.alert'Entered Shortcuts Mode' end
function modal_shorts:exited() hs.alert'Exited Shortcuts Mode' end
modal_shorts:bind(MY_MODS, 'pad.', function() hs.alert.show('Shortcuts') end)
modal_shorts:bind(MY_MODS, 'pad*', function() modal_shorts:exit() end)

modal_meet = hs.hotkey.modal.new(MY_MODS, 'pad5')
function modal_meet:entered() hs.alert'Entered Meeting Mode' end
function modal_meet:exited() hs.alert'Exited Meeting Mode' end
modal_meet:bind(MY_MODS, 'pad.', function() hs.alert.show('Meeting') end)
modal_meet:bind(MY_MODS, 'pad*', function() modal_meet:exit() end)
modal_meet:bind('', "pad0", function() hs.eventtap.keyStroke('alt', 'y') end)
modal_meet:bind('', "pad1", function() hs.eventtap.keyStroke('cmd-shift', 'a') end)
modal_meet:bind('', "pad2", function() hs.eventtap.keyStroke('cmd-shift', 'v') end)
modal_meet:bind('', "pad3", function() hs.eventtap.keyStroke('cmd-shift', 'd') end)
modal_meet:bind('', "pad5", function() hs.eventtap.keyStroke('cmd-shift', 'f') end)
modal_meet:bind('', "pad7", function() hs.shortcuts.run("Desk Audio") end)
modal_meet:bind('', "pad9", function() hs.shortcuts.run("Headset Audio") end)

modal_dev = hs.hotkey.modal.new(MY_MODS, 'pad2')
function modal_dev:entered() hs.alert'Entered Dev Mode' end
function modal_dev:exited() hs.alert'Exited Dev Mode' end
modal_dev:bind(MY_MODS, 'pad.', function() hs.alert.show('Dev') end)
modal_dev:bind(MY_MODS, 'pad*', function() modal_dev:exit() end)
modal_dev:bind('', 'pad0', tmux_send_it('0'))
modal_dev:bind('', 'pad1', tmux_send_it('1'))
modal_dev:bind('', 'pad2', tmux_send_it('2'))
modal_dev:bind('', 'pad3', tmux_send_it('3'))
modal_dev:bind('', 'pad4', tmux_send_it('4'))
modal_dev:bind('', 'pad5', tmux_send_it('5'))

modal_test = hs.hotkey.modal.new(MY_MODS, 'pad3')
function modal_test:entered() hs.alert'Entered Test Mode' end
function modal_test:exited() hs.alert'Exited Test Mode' end
modal_test:bind(MY_MODS,'pad.', function() hs.alert.show('Test') end)
modal_test:bind(MY_MODS, 'pad*', function() modal_test:exit() end)

-- Work, personal zoom link from a hotkey!
hs.hotkey.bind(MY_MODS, "z", send_it("https://rubiconmd.zoom.us/j/7111411118"))

local f = io.open('./priv/init.lua', 'r')
if f~=nil then io.close(f) require "priv" else return false end

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


open_app('', "F2", "Wezterm")
open_app('', "F16", "Wezterm")
open_app('', "F3", "Slack")
open_app('', "F17", "Slack")
open_app('', "F4", "Arc")
open_app('', "F18", "Arc")

run_shortcut('', "F7", "Desk Audio")
run_shortcut('', "F8", "Headset Audio")
run_shortcut('', "F9", "Standing Audio")
run_shortcut('', "F10", "Laptop Audio")

-- Simple notification to know that it has loaded up successfully
hs.alert.show("Config loaded")
