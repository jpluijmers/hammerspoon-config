function quickTileLeft()
  local win = hs.window.focusedWindow()
  local screenFrame = win:screen():frame()
  local frame = win:frame()

  frame.x = screenFrame.x
  frame.y = 0
  frame.w = screenFrame.w/2
  frame.h = screenFrame.h

  win:setFrame(frame)
end

function quickTileRight()
  local win = hs.window.focusedWindow()
  local screenFrame = win:screen():frame()
  local frame = win:frame()

  frame.x = screenFrame.x + screenFrame.w/2
  frame.y = 0
  frame.w = screenFrame.w/2
  frame.h = screenFrame.h

  win:setFrame(frame)
end

function maximize()
  local win = hs.window.focusedWindow()
  local screenFrame = win:screen():frame()
  local frame = win:frame()

  frame.x = screenFrame.x
  frame.y = 0
  frame.w = screenFrame.w
  frame.h = screenFrame.h

  win:setFrame(frame)
end

function minimize()
	hs.window.focusedWindow():minimize()
end

function bootstrapWindowBehaviour()
    hs.hotkey.bind({"cmd"}, "left" , quickTileLeft)
    hs.hotkey.bind({"cmd"}, "right" , quickTileRight)
    hs.hotkey.bind({"cmd"}, "up" , maximize)
    hs.hotkey.bind({"cmd"}, "down" , minimize)
end

function focusFistWindowOnScreen( screen )

end

hs.window.filter.ignoreAlways['VirtualBox VM'] = true  

bootstrapWindowBehaviour()