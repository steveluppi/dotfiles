-- Helper function to get the actual frontmost window
-- This works around issues with Chrome app windows not being reported as focused
local function getFrontmostWindow()
  -- First, try the standard method
  local win = hs.window.focusedWindow()
  
  -- If we got a window, check if it's actually the frontmost
  -- by comparing with orderedWindows
  local ordered = hs.window.orderedWindows()
  if #ordered > 0 then
    local frontmost = ordered[1]
    
    -- If focusedWindow doesn't match the frontmost, use frontmost instead
    if win ~= frontmost then
      -- Double-check: make sure the frontmost window is visible and not minimized
      if frontmost and not frontmost:isMinimized() and frontmost:isStandard() then
        return frontmost
      end
    end
  end
  
  -- Fallback: try to get window from the frontmost application
  local app = hs.application.frontmostApplication()
  if app then
    local appWin = app:focusedWindow()
    if appWin and not appWin:isMinimized() then
      return appWin
    end
    -- If no focused window, try main window
    local mainWin = app:mainWindow()
    if mainWin and not mainWin:isMinimized() then
      return mainWin
    end
  end
  
  -- Last resort: return what we got from focusedWindow
  return win
end

hs.hotkey.bind(MY_MODS, 't', function()
  local win = getFrontmostWindow()
  if win then
    win:move(hs.geometry.rect(1200,25,1435,540))
  end
end)

hs.hotkey.bind('', 'F19', function()
  local win = getFrontmostWindow()
  if win then
    win:move(hs.geometry.rect(1200,25,1435,540))
  end
end)

hs.hotkey.bind(WM_MODS, 'return', function()
  local win = getFrontmostWindow()
  if win then
    win:maximize()
  end
end)

hs.hotkey.bind(WM_MODS_EXTRA, 'return', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local margin = 0.1  -- 10% margin (5% on each side)
    local x = screenFrame.x + (screenFrame.w * margin / 2)
    local y = screenFrame.y + (screenFrame.h * margin / 2)
    local w = screenFrame.w * (1 - margin)
    local h = screenFrame.h * (1 - margin)
    win:move(hs.geometry.rect(x, y, w, h))
  end
end)

hs.hotkey.bind(WM_MODS, 'c', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local winFrame = win:frame()
    local x = screenFrame.x + (screenFrame.w - winFrame.w) / 2
    local y = screenFrame.y + (screenFrame.h - winFrame.h) / 2
    win:move(hs.geometry.rect(x, y, winFrame.w, winFrame.h))
  end
end)

-- Move window to quarter of screen with u, i ,j, k
hs.hotkey.bind(WM_MODS, 'u', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local w = screenFrame.w *.5
    local h = screenFrame.h *.5
    win:move(hs.geometry.rect(0,0,w,h))
  end
end)

hs.hotkey.bind(WM_MODS, 'i', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local w = screenFrame.w *.5
    local h = screenFrame.h *.5
    win:move(hs.geometry.rect(w,0,w,h))
  end
end)

hs.hotkey.bind(WM_MODS, 'j', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local w = screenFrame.w *.5
    local h = screenFrame.h *.5
    win:move(hs.geometry.rect(0,h,w,h))
  end
end)

hs.hotkey.bind(WM_MODS, 'k', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local w = screenFrame.w *.5
    local h = screenFrame.h *.5
    win:move(hs.geometry.rect(w,h,w,h))
  end
end)

hs.hotkey.bind(WM_MODS_EXTRA, 'h', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local w = screenFrame.w *.75
    local h = screenFrame.h
    win:move(hs.geometry.rect(0,0,w,h))
  end
end)

hs.hotkey.bind(WM_MODS_EXTRA, 'j', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local w = screenFrame.w *.25
    local h = screenFrame.h
    win:move(hs.geometry.rect(0,0,w,h))
  end
end)

hs.hotkey.bind(WM_MODS_EXTRA, 'k', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local w = screenFrame.w *.5
    local h = screenFrame.h
    win:move(hs.geometry.rect(w/2,0,w,h))
  end
end)

hs.hotkey.bind(WM_MODS_EXTRA, 'l', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local w = screenFrame.w *.25
    local h = screenFrame.h
    win:move(hs.geometry.rect(screenFrame.w-w,0,w,h))
  end
end)

hs.hotkey.bind(WM_MODS_EXTRA, 'c', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local w = screenFrame.w *.5
    local h = screenFrame.h *.5
    win:move(hs.geometry.rect(w/2,h/2,w,h))
  end
end)

-- Move video window to bottom of screen, with the height of the video window on top visible
hs.hotkey.bind(WM_MODS_EXTRA, 'down', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local videoWindowHeight = 540
    local x = screenFrame.x 
    local y = screenFrame.y + videoWindowHeight
    local w = screenFrame.w
    local h = screenFrame.h - videoWindowHeight
    win:move(hs.geometry.rect(x, y, w, h))
  end
end)

-- Arrow keys for 50% screen positioning
hs.hotkey.bind(WM_MODS, 'up', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local x = screenFrame.x
    local y = screenFrame.y
    local w = screenFrame.w
    local h = screenFrame.h * 0.5
    win:move(hs.geometry.rect(x, y, w, h))
  end
end)

hs.hotkey.bind(WM_MODS, 'down', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local x = screenFrame.x
    local y = screenFrame.y + (screenFrame.h * 0.5)
    local w = screenFrame.w
    local h = screenFrame.h * 0.5
    win:move(hs.geometry.rect(x, y, w, h))
  end
end)

hs.hotkey.bind(WM_MODS, 'left', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local x = screenFrame.x
    local y = screenFrame.y
    local w = screenFrame.w * 0.5
    local h = screenFrame.h
    win:move(hs.geometry.rect(x, y, w, h))
  end
end)

hs.hotkey.bind(WM_MODS, 'right', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local x = screenFrame.x + (screenFrame.w * 0.5)
    local y = screenFrame.y
    local w = screenFrame.w * 0.5
    local h = screenFrame.h
    win:move(hs.geometry.rect(x, y, w, h))
  end
end)

-- MY_MODS arrow keys to move window to screen edge, centered on that edge
hs.hotkey.bind(MY_MODS, 'up', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local winFrame = win:frame()
    local x = screenFrame.x + (screenFrame.w - winFrame.w) / 2
    local y = screenFrame.y
    win:move(hs.geometry.rect(x, y, winFrame.w, winFrame.h))
  end
end)

hs.hotkey.bind(MY_MODS, 'down', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local winFrame = win:frame()
    local x = screenFrame.x + (screenFrame.w - winFrame.w) / 2
    local y = screenFrame.y + screenFrame.h - winFrame.h
    win:move(hs.geometry.rect(x, y, winFrame.w, winFrame.h))
  end
end)

hs.hotkey.bind(MY_MODS, 'left', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local winFrame = win:frame()
    local x = screenFrame.x
    local y = screenFrame.y + (screenFrame.h - winFrame.h) / 2
    win:move(hs.geometry.rect(x, y, winFrame.w, winFrame.h))
  end
end)

hs.hotkey.bind(MY_MODS, 'right', function()
  local win = getFrontmostWindow()
  if win then
    local screen = win:screen()
    local screenFrame = screen:frame()
    local winFrame = win:frame()
    local x = screenFrame.x + screenFrame.w - winFrame.w
    local y = screenFrame.y + (screenFrame.h - winFrame.h) / 2
    win:move(hs.geometry.rect(x, y, winFrame.w, winFrame.h))
  end
end)

