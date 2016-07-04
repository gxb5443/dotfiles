local GITHUB_API_PATH = "https://api.github.com"
local GITHUB_API_USER = "gxb5443"
local GITHUB_API_TOKEN = "ae4486b8b679e4eab6881eb4e7ff8f1f953c9540"
local GITHUB_REPOS = {
  "DoubleVerify/goproxy"
}

local rate_limit_percentage

local menu_bar_refresh_time = 60
local menu_bar = hs.menubar.new()
local menu_items = {}

menu_bar:setTitle("0")

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

-- Build menu over again
function build_menu()
    local pull_requests

    menu_items = {}
    table.insert(menu_items, {
        title = "Refresh",
        fn = function() build_menu() end
    })

    for repo_key,repo in pairs(GITHUB_REPOS) do
        get_pull_requests(repo, function (decoded_body)

            if decoded_body == nil then
                print("There was an error trying to retrieve the pull requests!")
            end

            pull_requests = decoded_body

            for k,v in pairs(pull_requests) do
                table.insert(menu_items, {
                    title = repo .. ": "..v.title,
                    fn = menu_item_callback(v.number),
                    number = v.number,
                    html_url = v.html_url
                })
            end

            menu_bar:setTitle(tostring(get_table_length(menu_items) - 1))
            menu_bar:setMenu(menu_items)
        end)
    end

    buildMenuTimer = hs.timer.doAfter(menu_bar_refresh_time, function() build_menu() end)
end

-- Action: open url in default browser
function open_url_in_browser(url)
    hs.urlevent.openURLWithBundle(url, hs.urlevent.getDefaultHandler('http'))
end

-- Callback: for menu item
function menu_item_callback(item_id)
    return function()
        for k,v in pairs(menu_items) do
            if item_id == v.number then
                open_url_in_browser(v.html_url)
                return
            end
        end
    end
end

build_menu()
