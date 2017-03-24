

-- Auto-reload config
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()



function tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))      
    else
      print(formatting .. v)
    end
  end
end

-- Spaces setup
require "jpl.spaces"  

-- Display setup
require "jpl.display"

-- Display setup
require "jpl.window"

-- Display setup
require "jpl.shortcuts"




--   local win = hs.window.focusedWindow()
--   local screen = win:screen()


-- switcher = hs.window.switcher.new() -- default windowfilter: only visible windows, all Spaces
-- switcher_space = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter():setScreens({screen:id()})) -- include minimized/hidden windows, current Space only
-- switcher_browsers = hs.window.switcher.new{'Safari','Google Chrome'} -- specialized switcher for your dozens of browser windows :)

-- -- bind to hotkeys; WARNING: at least one modifier key is required!
-- hs.hotkey.bind('alt','tab','Next window',function()switcher:next()end)
-- hs.hotkey.bind('alt-shift','tab','Prev window',function()switcher:previous()end)