local grid = require "grid"

-- Constants
local mash= {"ctrl", "alt"}
local mashalt = {"cmd", "alt", "ctrl"}
local ctrlshift= {"ctrl", "shift"}
local laptopScreen = "Color LCD"

-- Configs
hs.window.animationDuration=0

-- Hints
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  hs.hints.windowHints()
end)

-- Window Management
-- global operations
hs.hotkey.bind(mash, ';', function() hs.grid.snap(hs.window.focusedWindow()) end)
hs.hotkey.bind(mash, "'", function() hs.fnutils.map(hs.window.visibleWindows(), hs.grid.snap) end)
function fw()
  return hs.window.focusedWindow()
end

-- Change screen
hs.hotkey.bind(mash, 'N', grid.pushwindow_nextscreen)
hs.hotkey.bind(mashalt, 'N', grid.pushwindow_nextscreen)

-- change focus
hs.hotkey.bind(ctrlshift, 'H', function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind(ctrlshift, 'L', function() hs.window.focusedWindow():focusWindowEast() end)
hs.hotkey.bind(ctrlshift, 'K', function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(ctrlshift, 'J', function() hs.window.focusedWindow():focusWindowSouth() end)

-- Snap Window
hs.hotkey.bind(mash, 'U', grid.snap_northwest)
hs.hotkey.bind(mash, 'I', grid.snap_north)
hs.hotkey.bind(mash, 'O', grid.snap_northeast)

hs.hotkey.bind(mash, 'J', grid.snap_west)
hs.hotkey.bind(mash, 'K', grid.maximize_window)
hs.hotkey.bind(mash, 'L', grid.snap_east)

hs.hotkey.bind(mash, 'M', grid.snap_southwest)
hs.hotkey.bind(mash, ',', grid.snap_south)
hs.hotkey.bind(mash, '.', grid.snap_southeast)

hs.hotkey.bind(mashalt, 'U', grid.snap_northwest)
hs.hotkey.bind(mashalt, 'I', grid.snap_north)
hs.hotkey.bind(mashalt, 'O', grid.snap_northeast)

hs.hotkey.bind(mashalt, 'J', grid.snap_west)
hs.hotkey.bind(mashalt, 'K', grid.maximize_window)
hs.hotkey.bind(mashalt, 'L', grid.snap_east)

hs.hotkey.bind(mashalt, 'M', grid.snap_southwest)
hs.hotkey.bind(mashalt, ',', grid.snap_south)
hs.hotkey.bind(mashalt, '.', grid.snap_southeast)


-- Slack-specific app launcher (since I keep it "peeked" to the side by default)
function showSlack()
  local appName = 'Slack'
  local app = hs.application.find(appName)
  hs.application.launchOrFocus(appName)

  --if (app and hs.application.isRunning(app)) then
  --  grid.snap_northwest()
  --end
end

function showHangouts()
  local appName = '/Users/gianfrancob/Applications/Chrome Apps.localized/Default knipolnnllmklapflnccelgolnpehhpl.app'
  local app = hs.application.find(appName)
  hs.application.launchOrFocus(appName)

  if (app and hs.application.isRunning(app)) then
    grid.snap_northwest()
  end
end

function showOneNote()
  local appName = 'Microsoft OneNote'
  local app = hs.application.find(appName)
  hs.application.launchOrFocus(appName)

  if (app and hs.application.isRunning(app)) then
    grid.snap_southwest()
  end
end

hs.hotkey.bind({"alt"}, '1', function() hs.application.launchOrFocus('iTerm') end)
hs.hotkey.bind({"alt"}, '2', showSlack)
hs.hotkey.bind({"alt"}, '3', function() hs.application.launchOrFocus('Google Chrome') end)
hs.hotkey.bind({"alt"}, '4', showOneNote)

-- Helper: get table length
function get_table_length(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

-- auto reload config
configFileWatcher = hs.pathwatcher.new(hs.configdir, hs.reload):start()
hs.alert.show("Config loaded 👍")
