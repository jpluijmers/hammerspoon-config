require("hs.screen")
local geometry = require "hs.geometry"
require "hs.window"
require "hs.window.filter"


function moveActiveWindowToDisplay( screen )
  local win = hs.window.focusedWindow()
  local currentScreen = win:screen()
  if ( win:screen():id() == screen:id() ) then
    print "Current screen == target screen, exiting"
  end

  win:moveToScreen(screen)
end

function cycleWindowsOnDisplay( screen )
  print(screen:id());

  local filter = hs.window.filter.new():setCurrentSpace(true):setDefaultFilter():setScreens({screen:id()})
  local windows = filter:getWindows(hs.window.filter.sortByFocused)

  local first = windows[1]
  if ( first == nil ) then return end
  first:focus()
end

function bootstrapDisplays() 
  local screens = hs.screen.allScreens()
  local i = 1;
  local positions = hs.screen.screenPositions();
  
  for k, v in pairs(positions) do
    print ("test" ,k:id(), v.x, v.y,k)
  end



  -- for key,coordinate in nex, positions do
  --   print ("Position of: ".. key .. " is y:" .. coordinate.y .. " x:" .. coordinate.x)
  -- end 



    -- Itterate and bind normal keyboard
  for key,screen in next, screens do
    print ("Mapping: " .. screen:id() .. " to " .. i, screen)

    -- Bind moving to space
    hs.hotkey.bind({"cmd"}, tostring(i), function() 
     cycleWindowsOnDisplay(screen)
    end)

    -- Bind moving window to space
    hs.hotkey.bind({"cmd","ctrl"}, tostring(i), function() 
     moveActiveWindowToDisplay(screen)
    end)
    i = i + 1
  end
end

bootstrapDisplays();
