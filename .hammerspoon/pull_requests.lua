-- luacheck: globals hs

local JSON = require('JSON')
local keychain = require('keychain')

local username = "jsfr"
local token = keychain.password_from_keychain("github_api_token")

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

local function get_pull_requests(onResult)
  local callback = function(_, stdOut, _)
    local result = JSON:decode(stdOut)
    local pull_requests = hs.fnutils.imap(result.data.search.nodes, map_node)
    local total_count = #pull_requests

    onResult({
        total_count = total_count,
        users_prs = hs.fnutils.ifilter(pull_requests, function(x)
          return x.author == username or (x.isAssignee and not x.reviewRequested)
        end),
        review_requests = hs.fnutils.ifilter(pull_requests, function(x)
          return x.reviewRequested and x.author ~= username
        end),
        involved = hs.fnutils.ifilter(pull_requests, function(x)
          return not x.reviewRequested and x.author ~= username and not x.isAssignee
        end)
      })
  end

  local cmd = hs.fs.pathToAbsolute("./pull_requests/get_pull_requests")

  hs.task.new(cmd, callback, {username, token}):start()
end

local function get_title(pull_request)
  local title = pull_request.title

  if pull_request.draft then
    title = "[Draft] " .. title
  end

  return title
end

local function update_menu(menu)
  local unread_style = { color = { red = 1.0, green = 0.0, blue = 0.0, alpha = 1.0 } }

  local onResult = function(pull_requests)
    local menu_table = {}
    local unread = false
    local approved = "APPROVED"
    local changes_requested = "CHANGES_REQUESTED"

    for _, pull_request in pairs(pull_requests.users_prs) do
      local title = get_title(pull_request)

      if (pull_request.unread) then
        unread = true
        title = hs.styledtext.new(title, unread_style)
      end

      table.insert(menu_table, {
          title = title,
          fn = function() hs.urlevent.openURL(pull_request.url) end,
          state = (pull_request.reviewDecision == changes_requested and "mixed") or
          (pull_request.reviewDecision == approved and "on") or
          "off"
        })
    end

    if (#pull_requests.users_prs > 0 and (#pull_requests.review_requests > 0 or #pull_requests.involved > 0)) then
      table.insert(menu_table, { title = "-" })
    end

    for _, pull_request in pairs(pull_requests.review_requests) do
      local title = get_title(pull_request)

      if (pull_request.unread) then
        unread = true
        title = hs.styledtext.new(title, unread_style)
      end

      table.insert(menu_table, {
          title = title,
          fn = function() hs.urlevent.openURL(pull_request.url) end,
          state = (pull_request.reviewDecision == changes_requested and "mixed") or
          (pull_request.reviewDecision == approved and "on") or
          "off"
        })
    end

    if (#pull_requests.review_requests > 0 and #pull_requests.involved > 0) then
      table.insert(menu_table, { title = "-" })
    end

    for _, pull_request in pairs(pull_requests.involved) do
      local title = get_title(pull_request)

      if (pull_request.unread) then
        unread = true
        title = hs.styledtext.new(title, unread_style)
      end

      table.insert(menu_table, {
          title = title,
          fn = function() hs.urlevent.openURL(pull_request.url) end,
          state = (pull_request.reviewDecision == changes_requested and "mixed") or
          (pull_request.reviewDecision == approved and "on") or
          "off"
        })
    end

    local menu_title = '[PRs: ' .. pull_requests.total_count .. ']'

    if (unread) then
      menu_title = hs.styledtext.new(menu_title, unread_style)
    end

    menu:setTitle(menu_title)
    menu:setMenu(menu_table)
  end

  get_pull_requests(onResult)
end

local pull_requests_menu = hs.menubar.new()

local PullRequests = {}

PullRequests.timer = hs.timer.new(hs.timer.minutes(1), function() update_menu(pull_requests_menu) end, true)

function PullRequests.start()
  PullRequests.timer:start()
  PullRequests.timer:fire()
end

return PullRequests
