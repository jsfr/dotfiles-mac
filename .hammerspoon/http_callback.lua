local function openInDefaultBrowser(fullURL)
    local bundleID = "org.mozilla.firefox"
    hs.urlevent.openURLWithBundle(fullURL, bundleID)
end

local callbacks = {
    ["linear.app"] = function(fullURL)
        local newFullUrl = string.gsub(fullURL, "https?://linear%.app/", "linear://")
        hs.urlevent.openURL(newFullUrl)
    end,
    ["meet.google.com"] = function(fullURL)
        hs.urlevent.openURLWithBundle(fullURL, "com.google.Chrome")
    end,
    ["www.notion.so"] = function (fullURL)
        hs.urlevent.openURLWithBundle(fullURL, "notion.id")
    end
}

local function httpCallback(scheme, host, _, fullURL, _)
    local logger = hs.logger.new("httpCb", LOG_LEVEL)

    if not string.find(scheme, "^https?$") then
        logger.w("Received an event that was not for a supported scheme", fullURL)
        openInDefaultBrowser(fullURL)
        return
    end

    callbacks[host](fullURL)
end

return {
    init = function()
        setmetatable(callbacks, {
            __index = function()
                return openInDefaultBrowser
            end
        })
        hs.urlevent.httpCallback = httpCallback
    end
}
