-- Set up the local functions that we are going to use
MY_MODS = 'cmd-ctrl-alt'

local vimmouse = require('Spoons/vimmouse')
vimmouse(MY_MODS, 'm')

local open_app = function(mods, key, name)
  hs.hotkey.bind(mods, key, function()
    local foremost = hs.application.frontmostApplication()

    if foremost:name() == name then
      hs.eventtap.keyStroke('cmd', 'h')
    else
      hs.application.launchOrFocus(name)
    end
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
hs.hotkey.bind(MY_MODS, '.', function() hs.alert.show('Main') end)

-- Easy way to reload while working on the config
hs.hotkey.bind(MY_MODS, "r", function() hs.reload() end)

local f = io.open('./my_modals/init.lua', 'r')
if f~=nil then io.close(f) require "my_modals" end

modal_shorts = hs.hotkey.modal.new(MY_MODS, 'pad0')
function modal_shorts:entered() hs.alert'Entered Shortcuts Mode' end
function modal_shorts:exited() hs.alert'Exited Shortcuts Mode' end
modal_shorts:bind(MY_MODS, 'pad.', function() hs.alert.show('Shortcuts') end)
modal_shorts:bind(MY_MODS, '.', function() hs.alert.show('Shortcuts') end)
modal_shorts:bind(MY_MODS, 'pad*', function() modal_shorts:exit() end)
modal_shorts:bind('', 'F5', function() hs.eventtap.keyStroke('cmd', 'r') end)
modal_shorts:bind('', 'pad1', send_it('Aetna Better Health of Oklahoma'))
modal_shorts:bind('', 'pad2', send_it('aetna_ok'))
modal_shorts:bind('', 'pad3', send_it('Aetna::RosterHeaderValidator'))


modal_dev = hs.hotkey.modal.new(MY_MODS, 'pad2')
function modal_dev:entered() hs.alert'Entered Dev Mode' end
function modal_dev:exited() hs.alert'Exited Dev Mode' end
modal_dev:bind(MY_MODS, 'pad.', function() hs.alert.show('Dev') end)
modal_dev:bind(MY_MODS, '.', function() hs.alert.show('Dev') end)
modal_dev:bind(MY_MODS, 'pad*', function() modal_dev:exit() end)
modal_dev:bind('', 'F1', tmux_send_it('0'))
modal_dev:bind('', 'F2', tmux_send_it('1'))
modal_dev:bind('', 'F3', tmux_send_it('2'))
modal_dev:bind('', 'F4', tmux_send_it('3'))
modal_dev:bind('', 'F5', tmux_send_it('4'))
modal_dev:bind('', 'F6', tmux_send_it('5'))
modal_dev:bind('', 'F7', tmux_send_it('6'))
modal_dev:bind('', 'F8', tmux_send_it('7'))

modal_test = hs.hotkey.modal.new(MY_MODS, 'pad3')
function modal_test:entered() hs.alert'Entered Test Mode' end
function modal_test:exited() hs.alert'Exited Test Mode' end
modal_test:bind(MY_MODS,'pad.', function() hs.alert.show('Test') end)
modal_test:bind(MY_MODS,'.', function() hs.alert.show('Test') end)
modal_test:bind(MY_MODS, 'pad*', function() modal_test:exit() end)

modal_email = hs.hotkey.modal.new(MY_MODS, 'F11')
function modal_email:entered() hs.alert'Entered Email Mode' end
function modal_email:exited() hs.alert'Exited Email Mode' end
modal_email:bind(MY_MODS,'pad.', function() hs.alert.show('Email') end)
modal_email:bind(MY_MODS,'.', function() hs.alert.show('Email') end)
modal_email:bind(MY_MODS, 'pad*', function() modal_email:exit() end)
modal_email:bind(MY_MODS, 'F11', function() modal_email:exit() end)
modal_email:bind('', 'F5', send_it('e'))
modal_email:bind('', 'F6', send_it('#'))

modal_demo = hs.hotkey.modal.new(MY_MODS, 'p')
function modal_demo:entered() hs.alert'Entered Demo Mode' end
function modal_demo:exited() hs.alert'Exited Demo Mode' end
modal_demo:bind('', 'F7', send_it('Can you advise which med would be best to decrease and in general how you approach orthostatic hypotension picture with combined systolic-diastolic hf in older adults?'))
modal_demo:bind('', 'F8', send_it('Given her age, comorbidities, and fall history, I would like to decrease some of her bp meds.'))
modal_demo:bind('', 'F9', send_it('75-year-old female per home care RN, pt is having a lot of near-falls and low blood pressures but did not provide readings. BP in clinic today was 123/76 lying, 118/74 sitting, 104/64 standing.'))
modal_demo:bind(MY_MODS,'pad.', function() hs.alert.show('Demo') end)
modal_demo:bind(MY_MODS,'.', function() hs.alert.show('Demo') end)
modal_demo:bind(MY_MODS, 'p', function() modal_demo:exit() end)

modal_vim = hs.hotkey.modal.new(MY_MODS, 'F12')
function modal_vim:entered() hs.alert'Entered Vim Mode' end
function modal_vim:exited() hs.alert'Exited Vim Mode' end
modal_vim:bind('','F1', send_it('1gt'))
modal_vim:bind('','F2', send_it('2gt'))
modal_vim:bind('','F3', send_it('3gt'))
modal_vim:bind('','F4', send_it('4gt'))
modal_vim:bind('','F5', tmux_send_it('1'))
modal_vim:bind('','F6', tmux_send_it('2'))
modal_vim:bind(MY_MODS,'pad.', function() hs.alert.show('Vim') end)
modal_vim:bind(MY_MODS,'.', function() hs.alert.show('Vim') end)
modal_vim:bind(MY_MODS, 'F12', function() modal_vim:exit() end)

--
-- Work, email and personal zoom link from a hotkey!
hs.hotkey.bind(MY_MODS, "e", send_it("steve@rubiconmd.com"))
hs.hotkey.bind(MY_MODS, "c", send_it("C850432"))
hs.hotkey.bind(MY_MODS, "z", send_it("https://rubiconmd.zoom.us/j/7111411118"))

local f = io.open('./priv/init.lua', 'r')
if f~=nil then io.close(f) require "priv" end

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

hs.hotkey.bind('', 'F13', function()
  local win = hs.window.focusedWindow()
  local log = hs.logger.new('windowPos','debug')
  log.i(win)
  log.i(win:frame())
  win = hs.window.find('Slack')
  log.i(win)
end)
hs.hotkey.bind(MY_MODS, 't', function()
  local win = hs.window.focusedWindow()
  win:move(hs.geometry.rect(1200,25,1435,540))
end)
hs.hotkey.bind('', 'F19', function()
  local win = hs.window.focusedWindow()
  -- The Bottom Corner
  -- win:move(hs.geometry.rect(0,1730, 1280,430))
  -- The TOp Center
  win:move(hs.geometry.rect(1200,25,1435,540))
end)

open_app('', "F1", "WezTerm")
open_app('', "F16", "WezTerm")
open_app('', "F2", "Slack")
open_app('', "F17", "Slack")
open_app('', "F3", "Google Chrome")
open_app('', "F18", "Google Chrome")
open_app('', "F4", "Bruno")
open_app('', "F5", "Cursor")

run_shortcut('', "F7", "Desk Audio")
run_shortcut('', "F8", "TOZO Audio Cans")
run_shortcut('', "F9", "Bose Audio")
run_shortcut('', "F10", "Laptop Audio")

-- Simple notification to know that it has loaded up successfully
hs.alert.show("Config loaded")
