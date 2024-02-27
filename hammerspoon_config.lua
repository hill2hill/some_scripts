-- 在屏幕间移动光标
function moveCursorBetweenDesktops()
local screen = hs.mouse.getCurrentScreen()
local nextScreen = screen:next()
local rect = nextScreen:fullFrame()
local center = hs.geometry.rectMidPoint(rect)

hs.mouse.setAbsolutePosition(center)
hs.eventtap.event.newMouseEvent(hs.eventtap.event.types["leftMouseDown"], center):post()
hs.eventtap.event.newMouseEvent(hs.eventtap.event.types["leftMouseUp"], center):post()
hs.alert.closeAll()
hs.alert.show('🐶', alertStyle, nextScreen)
-- hs.alert.show('🐻‍❄️🦮🐶🦅🐘🦁', nextScreen)
end

-- 双击 ctrl: https://gist.github.com/asmagill/c38f75fff9d9ef43d1226329fc1436e4
ctrlDoublePress = require("ctrlDoublePress")
ctrlDoublePress.action = function()
moveCursorBetweenDesktops()
end
