-- luacheck: globals hs

local function setWallpaper(file)
    local connection = hs.sqlite3.open(os.getenv("HOME") .. "/Library/Application Support/Dock/desktoppicture.db")
    local dock = hs.appfinder.appFromName("Dock")
    connection:exec("update data set value = '" .. file .. "'")
    connection:close()
    dock:kill()
end

local function getWallpaper(wallpaperName)
     return hs.fs.pathToAbsolute("./bitday/" .. wallpaperName .. ".png")
end

local function setNextWallpaper()
    local date = os.date("*t")
    local hour = math.floor(date.hour/2)
    local wallpaperName = string.format("%02d", (hour % 12) + 1)
    local wallpaper = getWallpaper(wallpaperName)
    setWallpaper(wallpaper)
end

local function updateOnWake(event)
    if (event == hs.caffeinate.watcher.systemDidWake) then
        setNextWallpaper()
    end
end

hs.timer.doAt("00:00", "1h", setNextWallpaper):fire()
hs.caffeinate.watcher.new(updateOnWake):start()
