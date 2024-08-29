local function inputCallback(event)
    if event == "dev#" then
        local usbDevice = hs.audiodevice.findInputByName("Elgato Wave XLR")
        local virtualDevice = hs.audiodevice.findInputByName("Wave Link Stream")
        local defaultDevice = hs.audiodevice.findInputByName("MacBook Pro Microphone")
        if usbDevice ~= nil and virtualDevice ~= nil then
            virtualDevice:setDefaultInputDevice()
        elseif defaultDevice ~= nil then
            defaultDevice:setDefaultInputDevice()
        end
    end
end

local function outputCallback(event)
    local deviceNames = {
        "External Headphones",
        "Dark Star",
        "WF-1000XM5",
        "Ear (2)",
        "Nothing Ear",
        "OpenFit by Shokz",
        "Aeropex by AfterShokz",
        "FiiO UTWS5",
        "FiiO BTR5"
    }
    if event == "dev#" then
        for _, name in ipairs(deviceNames) do
            local device = hs.audiodevice.findOutputByName(name)
            if device ~= nil then
                device:setDefaultOutputDevice()
                return
            end
        end
        local defaultDevice = hs.audiodevice.findOutputByName("MacBook Pro Speakers")
        if defaultDevice ~= nil then
            defaultDevice:setDefaultOutputDevice()
        end
    end
end

local function callback(event)
    inputCallback(event)
    outputCallback(event)
end

return {
    init = function()
        hs.audiodevice.watcher.setCallback(callback)
        hs.audiodevice.watcher.start()
    end
}
