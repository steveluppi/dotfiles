modal_meet = hs.hotkey.modal.new(MY_MODS, 'pad5')
function modal_meet:entered() hs.alert'Entered Meeting Mode' end
function modal_meet:exited() hs.alert'Exited Meeting Mode' end
modal_meet:bind(MY_MODS, 'pad.', function() hs.alert.show('Meeting') end)
modal_meet:bind(MY_MODS, '.', function() hs.alert.show('Meeting') end)
modal_meet:bind(MY_MODS, 'pad*', function() modal_meet:exit() end)
modal_meet:bind('', "pad0", function() hs.eventtap.keyStroke('alt', 'y') end) --Zoom Raise Hand
modal_meet:bind('', "pad1", function() hs.eventtap.keyStroke('cmd-shift', 'a') end) --Zoom Mute
modal_meet:bind('', "pad2", function() hs.eventtap.keyStroke('cmd-shift', 'v') end) --Zoom Video 
modal_meet:bind('', "pad3", function() hs.eventtap.keyStroke('alt', 'y') end) --Zoom Raise Hand 
modal_meet:bind('', "pad4", function() hs.eventtap.keyStroke('cmd', 'd') end) -- Google Meet Mute
modal_meet:bind('', "pad5", function() hs.eventtap.keyStroke('cmd', 'e') end) -- Google Meet Video
modal_meet:bind('', "pad6", function() hs.eventtap.keyStroke('cmd-ctrl', 'h') end) --Google Meet Raise Hand 
modal_meet:bind('', "pad7", function() hs.eventtap.keyStroke('cmd-shift', 'o') end) -- Teams Mute
modal_meet:bind('', "pad8", function() hs.eventtap.keyStroke('cmd-shift', 'm') end) -- Teams Video
modal_meet:bind('', 'pad+', function() hs.eventtap.keyStroke('cmd-shift', '5') end)

modal_zoom = hs.hotkey.modal.new(MY_MODS, 'F5')
function modal_zoom:entered() hs.alert'Entered Zoom Mode' end
function modal_zoom:exited() hs.alert'Exited Zoom Mode' end
modal_zoom:bind(MY_MODS,'pad.', function() hs.alert.show('Zoom') end)
modal_zoom:bind(MY_MODS, '.', function() hs.alert.show('Zoom') end)
modal_zoom:bind(MY_MODS, 'F5', function() modal_zoom:exit() end)
modal_zoom:bind('', "F5", function() hs.eventtap.keyStroke('cmd-shift', 'a') end)
modal_zoom:bind('', "F6", function() hs.eventtap.keyStroke('cmd-shift', 'v') end)
modal_zoom:bind('', "F7", function() hs.eventtap.keyStroke('alt', 'y') end) --Zoom Raise Hand 

modal_google_meet = hs.hotkey.modal.new(MY_MODS, 'F6')
function modal_google_meet:entered() hs.alert'Entered Google Meet Mode' end
function modal_google_meet:exited() hs.alert'Exited Google Meet Mode' end
modal_google_meet:bind(MY_MODS, 'pad.', function() hs.alert.show('Google Meet') end)
modal_google_meet:bind(MY_MODS, '.', function() hs.alert.show('Google Meet') end)
modal_google_meet:bind(MY_MODS, 'F6', function() modal_google_meet:exit() end)
modal_google_meet:bind('', "F5", function() hs.eventtap.keyStroke('cmd', 'd') end)
modal_google_meet:bind('', "F6", function() hs.eventtap.keyStroke('cmd', 'e') end)
modal_google_meet:bind('', "F7", function() hs.eventtap.keyStroke('cmd-ctrl', 'h') end) --Google Meet Raise Hand 

modal_teams = hs.hotkey.modal.new(MY_MODS, 'F7')
function modal_teams:entered() hs.alert'Entered Teams Mode' end
function modal_teams:exited() hs.alert'Exited Teams Mode' end
modal_teams:bind(MY_MODS, 'pad.', function() hs.alert.show('Teams') end)
modal_teams:bind(MY_MODS, '.', function() hs.alert.show('Teams') end)
modal_teams:bind(MY_MODS, 'F7', function() modal_teams:exit() end)
modal_teams:bind('', "F5", function() hs.eventtap.keyStroke('cmd-shift', 'o') end)
modal_teams:bind('', "F6", function() hs.eventtap.keyStroke('cmd-shift', 'm') end)

