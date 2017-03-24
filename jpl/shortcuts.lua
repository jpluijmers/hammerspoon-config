 
require "hs.caffeinate"

function boostrapShortcuts() 
	hs.hotkey.bind({"cmd"}, "l" , hs.caffeinate.startScreensaver)
end

boostrapShortcuts()