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

local GITHUB_API_PATH = "https://api.github.com"
local GITHUB_API_USER = "gxb5443"
local GITHUB_API_TOKEN = "7eabd61ff40fb1f718a8d66ac9593d2a29770ae9"
local GITHUB_REPOS = {
  "DoubleVerify/goproxy",
  "DoubleVerify/Ambassadorjs",
}

local rate_limit_percentage

local menu_bar_refresh_time = 60
local menu_bar = hs.menubar.new()
local menu_items = {}

--menu_bar:setTitle("0")

-- Helper: get table length
function get_table_length(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

-- Helper: do pull request from Github
function get_pull_requests(repo, callback)
    hs.http.doAsyncRequest(
        GITHUB_API_PATH .. "/repos/" .. repo .. "/pulls",
        "GET",
        "",
        {
            Authorization = "Basic " .. hs.base64.encode(GITHUB_API_USER .. ":" .. GITHUB_API_TOKEN)
        },
        function (code, body, headers)
            if code == 200 then
                local decoded_body = hs.json.decode(body)
                callback(decoded_body)
            else
                print("Error: The code was", code)
                print(hs.inspect(headers))
                callback(nil)
            end
            
            rate_limit_percentage = 100 - (( headers["X-RateLimit-Remaining"] / headers["X-RateLimit-Limit"] ) * 100)
            print(tostring(rate_limit_percentage) .. "%", "rate limit used")
        end
    )
end

---- Build menu over again
--function build_menu()
--    local pull_requests
--
--    menu_items = {}
--    table.insert(menu_items, {
--        title = "Refresh",
--        fn = function() build_menu() end
--    })
--
--    for repo_key,repo in pairs(GITHUB_REPOS) do
--        get_pull_requests(repo, function (decoded_body)
--
--            if decoded_body == nil then
--                print("There was an error trying to retrieve the pull requests!")
--            end
--
--            pull_requests = decoded_body
--
--            for k,v in pairs(pull_requests) do
--                table.insert(menu_items, {
--                    title = repo .. ": "..v.title,
--                    fn = menu_item_callback(v.number),
--                    number = v.number,
--                    html_url = v.html_url
--                })
--            end
--
--            menu_bar:setTitle(tostring(get_table_length(menu_items) - 1))
--            menu_bar:setMenu(menu_items)
--        end)
--    end
--
--    buildMenuTimer = hs.timer.doAfter(menu_bar_refresh_time, function() build_menu() end)
--end
--
---- Action: open url in default browser
--function open_url_in_browser(url)
--    hs.urlevent.openURLWithBundle(url, hs.urlevent.getDefaultHandler('http'))
--end
--
---- Callback: for menu item
--function menu_item_callback(item_id)
--    return function()
--        for k,v in pairs(menu_items) do
--            if item_id == v.number then
--                open_url_in_browser(v.html_url)
--                return
--            end
--        end
--    end
--end

--build_menu()

-- auto reload config
configFileWatcher = hs.pathwatcher.new(hs.configdir, hs.reload):start()
hs.alert.show("Config loaded 👍")
