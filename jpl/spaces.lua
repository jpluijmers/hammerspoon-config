spaces = require("hs._asm.undocumented.spaces")

function gotoSpace(targetSpace)
  local currentSpace = spaces.activeSpace()

  if currentSpace == targetSpace then
  	print ( "targetSpace == currentSpace, exitting")
  	return
  end

  local win = hs.window.focusedWindow()
  local screen = win:screen()


  spaces.changeToSpace(targetSpace,false)

  hs.timer.delayed.new(0.10, function()
    local filter = hs.window.filter.new():setCurrentSpace(true):setDefaultFilter():setScreens({screen:id()})
    local windows = filter:getWindows(hs.window.filter.sortByFocusedLast)

    -- Attempt to FOCUS any screen on this space
    if ( windows[1] == nil ) then 
      print ("no window on screen, finding any other")
      filter = hs.window.filter.new():setCurrentSpace(true):setDefaultFilter()
      windows = filter:getWindows(hs.window.filter.sortByFocusedLast)

      if ( windows[1] == nil ) then
          print("no windows on space")
          return
      end
    end
    print (windows[1].application(windows[1]))
    windows[1]:focus() 

  end):start()
end

function moveActiveWindowToSpace(targetSpace)
  local win = hs.window.focusedWindow()
  local currentSpace = spaces.activeSpace()
  
  print(win)
  if currentSpace == targetSpace then
  	print ( "targetSpace == currentSpace, exitting")
  	return
  end

  win:spacesMoveTo(targetSpace)
end

function bootstrapSpaces() 
  -- raw spaces
  local spaces = reverse( spaces.query() );
  
  -- Ordered spaces
  local ordered = {}

  local count = 1

  -- Itterate and bind normal keyboard
  for key,spaceId in pairs(spaces) do
    ordered[count] = spaceId

    -- Bind moving to space
    hs.hotkey.bind({"cmd"}, "F" .. tostring(count), function() 
     gotoSpace(spaceId)
    end)

    -- Bind moving window to space
    hs.hotkey.bind({"cmd","ctrl"}, "F" .. tostring(count), function() 
     moveActiveWindowToSpace(spaceId)
    end)

    count = count +1
  end

  require 'pl.pretty'.dump(ordered)

  -- Mac keyboard internal custom map
  hs.urlevent.bind("toSpace", function(eventName, params) 
   if params["targetSpace"] then
     gotoSpace(tonumber(params["targetSpace"]))
   end
  end)

  hs.urlevent.bind("windowToSpace", function(eventName, params) 
   if params["targetSpace"] then
     moveActiveWindowToSpace(tonumber(params["targetSpace"]))
   end
  end)
end

function reverse(tbl)
  for i=1, math.floor(#tbl / 2) do
    tbl[i], tbl[#tbl - i + 1] = tbl[#tbl - i + 1], tbl[i]
  end
  return tbl
end

bootstrapSpaces();


