-- luacheck: globals hs

local function handle_zoom(scheme, host, params, fullURL)
  local meeting_id = string.match(fullURL, "https?://.-zoom.us/j/(%d+)")

  if meeting_id == nil then
    meeting_id = string.match(fullURL, "https?://.-zoom.us/event/callback/slack/(%d+)")
  end

  if meeting_id ~= nil then
    print("Found Zoom meeting with id '" .. meeting_id .. "'")
    hs.urlevent.openURL("zoommtg://zoom.us/join?zc=0&confno=" .. meeting_id)
    return true
  else
    return false
  end
end

local function handle_notion(scheme, host, params, fullURL)
  local notion_page = string.match(fullURL, "https?://.-notion.so/(.*)")

  if notion_page ~= nil then
    print("Found Notion page '" .. notion_page .. "'")
    hs.urlevent.openURL("notion://" .. notion_page)
    return true
  else
    return false
  end
end

local function url_handler(scheme, host, params, fullURL)
  if handle_zoom(scheme, host, params, fullURL) then
    return
  end

  if (handle_notion(scheme, host, params, fullURL)) then
    return
  end

  hs.urlevent.openURLWithBundle(fullURL, "org.mozilla.firefox")
end

hs.urlevent.httpCallback = url_handler
