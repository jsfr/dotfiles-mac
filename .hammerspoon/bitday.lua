-- luacheck: globals hs
--
local function getWallpaper()
    local connection = hs.sqlite3.open(os.getenv("HOME") .. "/Library/Application Support/Dock/desktoppicture.db")
    for a in connection:rows("select value from data limit 1") do
        connection:close()
        return a[1];
    end
end

local function setWallpaper(file)
    local connection = hs.sqlite3.open(os.getenv("HOME") .. "/Library/Application Support/Dock/desktoppicture.db")
    local dock = hs.appfinder.appFromName("Dock")
    connection:exec("update data set value = '" .. file .. "'")
    connection:close()
    dock:kill()
end

local function setNextWallpaper()
    local date = os.date("*t")
    local number = (((math.floor(date.hour/2) % 12) + 11) % 12) + 1

    local wallpaperName = string.format("%02d", number)

    local nextWallpaper = hs.fs.pathToAbsolute("./bitday/" .. wallpaperName .. ".png")
    local currentWallpaper = getWallpaper()

    if (nextWallpaper ~= currentWallpaper) then
        setWallpaper(nextWallpaper)
    end
end

local function updateOnWake(event)
    if (event == hs.caffeinate.watcher.systemDidWake) then
        setNextWallpaper()
    end
end

local Bitday = {}

Bitday.timer = hs.timer.new(hs.timer.hours(1), setNextWallpaper, true)
Bitday.watcher = hs.caffeinate.watcher.new(updateOnWake)

function Bitday.start ()
    setNextWallpaper()
    local date = os.date("*t")
    local nextTrigger = hs.timer.hours(1) - (hs.timer.minutes(date.min) + date.sec)
    Bitday.timer:setNextTrigger(nextTrigger)
    Bitday.watcher:start()
end

return Bitday
