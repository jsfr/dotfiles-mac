-- luacheck: globals hs

local JSON = require("JSON")
local keychain = require("keychain")

local username = "jsfr"
local token = keychain.password_from_keychain("github_api_token")

local unread_style = { color = { red = 1.0, green = 0.0, blue = 0.0, alpha = 1.0 } }
local empty_style = { color = { red = 0.5, green = 0.5, blue = 0.5, alpha = 1.0 } }

local function has_requested_review(node)
  return node and node.requestedReviewer and node.requestedReviewer.login == username
end

local function is_assignee(node)
  return node and node.login == username
end

local function map_node(node)
  return {
    title = node.title,
    url = node.url,
    unread = not node.isReadByViewer,
    draft = node.isDraft,
    reviewDecision = node.reviewDecision,
    reviewRequested = hs.fnutils.some(node.reviewRequests.nodes, has_requested_review),
    author = node.author.login,
    isAssignee = hs.fnutils.some(node.assignees.nodes, is_assignee)
  }
end

local function get_pull_requests(menu, inner_callback)
  local outer_callback = function(_, stdOut, _)
    local result = JSON:decode(stdOut)
    local pull_requests = hs.fnutils.imap(result.data.search.nodes, map_node)
    local total_count = #pull_requests

    inner_callback(menu, {
        total_count = total_count,
        unread = hs.fnutils.some(pull_requests, function(x) return x.unread end),
        users_prs = hs.fnutils.ifilter(pull_requests, function(x) return x.author == username or (x.isAssignee and not x.reviewRequested) end),
        review_requests = hs.fnutils.ifilter(pull_requests, function(x) return x.reviewRequested and x.author ~= username end),
        involved = hs.fnutils.ifilter(pull_requests, function(x) return not x.reviewRequested and x.author ~= username and not x.isAssignee end)
      })
  end

  local cmd = hs.fs.pathToAbsolute("./pull_requests/get_pull_requests")

  hs.task.new(cmd, outer_callback, {username, token}):start()
end

local function get_title(pull_request)
  local title = pull_request.title

  if pull_request.draft then
    title = "[Draft] " .. title
  end

  if (pull_request.unread) then
    title = hs.styledtext.new(title, unread_style)
  end

  return title
end

local function get_menu_line(pull_request)
  local approved = "APPROVED"
  local changes_requested = "CHANGES_REQUESTED"

  return {
    title = get_title(pull_request),
    fn = function() hs.urlevent.openURL(pull_request.url) end,
    state = (pull_request.reviewDecision == changes_requested and "mixed") or (pull_request.reviewDecision == approved and "on") or "off"
  }
end

local function set_menu_table(menu, pull_requests)
  local menu_table = {}
  local separator = { title = "-" }
  local empty_block = { title = hs.styledtext.new("n/a", empty_style), disabled = true }

  if (#pull_requests.users_prs > 0) then
    for _, pull_request in pairs(pull_requests.users_prs) do
      table.insert(menu_table, get_menu_line(pull_request))
    end
  else 
    table.insert(menu_table, empty_block)
  end 

  -- Separator
  table.insert(menu_table, separator)

  if (#pull_requests.review_requests > 0) then
    for _, pull_request in pairs(pull_requests.review_requests) do
      table.insert(menu_table, get_menu_line(pull_request))
    end
  else
    table.insert(menu_table, empty_block)
  end

  -- Separator
  table.insert(menu_table, separator)

  if (#pull_requests.involved > 0) then
    for _, pull_request in pairs(pull_requests.involved) do
      table.insert(menu_table, get_menu_line(pull_request))
    end
  else 
    table.insert(menu_table, empty_block)
  end

  menu:setMenu(menu_table)
end

local function set_menu_title(menu, pull_requests)
  local menu_title = "[PRs: " .. pull_requests.total_count .. "]"

  if (pull_requests.unread) then
    menu_title = hs.styledtext.new(menu_title, unread_style)
  end

  menu:setTitle(menu_title)
end

local function on_result(menu, pull_requests)
  set_menu_title(menu, pull_requests)
  set_menu_table(menu, pull_requests)
end

local PullRequests = {}
PullRequests.menu_item = hs.menubar.new()
-- PullRequests.timer = hs.timer.new(hs.timer.minutes(1), function() get_pull_requests(PullRequests.menu_item, on_result) end, true)
-- PullRequests.start = function() PullRequests.timer:start(); PullRequests.timer:fire() end
PullRequests.update = function() get_pull_requests(PullRequests.menu_item, on_result) end

return PullRequests
