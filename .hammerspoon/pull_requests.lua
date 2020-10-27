-- luacheck: globals hs

local JSON = require('JSON')
local keychain = require('keychain')

local username = "jsfr"
local token = keychain.password_from_keychain("github_api_token")

local query = [[
{
  search(query: \\\"sort:updated-desc type:pr state:open involves:]] .. username .. [[\\\", type: ISSUE, first: 100) {
    edges {
      node {
        ... on PullRequest {
          author {
            login
          }
          url
          title
          isReadByViewer
          reviewDecision
          reviewRequests(first: 100) {
            edges {
              node {
                requestedReviewer {
                  ... on User {
                    login
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
]]

local url = "https://api.github.com/graphql"

local function has_requested_review(node)
  return node.node.requestedReviewer.login == username
end

local function map_node(node)
  return {
    title = node.node.title,
    url = node.node.url,
    unread = not node.node.isReadByViewer,
    reviewDecision = node.node.reviewDecision,
    reviewRequested = hs.fnutils.some(node.node.reviewRequests.edges, has_requested_review),
    author = node.node.author.login
  }
end

local function get_pull_requests()
  local cmd = '/usr/bin/curl -s -H "Authorization: bearer ' .. token .. '" -X POST -d '
  .. '" { \\"query\\": \\"'  .. query .. ' \\" } " ' .. url

  cmd = cmd:gsub("%s+", " ")

  local handle = io.popen(cmd)
  local result = handle:read("*a")

  handle:close()

  result = JSON:decode(result)

  local pull_requests = hs.fnutils.imap(result.data.search.edges, map_node)

  local total_count = #pull_requests

  return {
    total_count = total_count,
    users_prs = hs.fnutils.ifilter(pull_requests, function(x) return x.author == username end),
    review_requests = hs.fnutils.ifilter(pull_requests, function(x)
      return x.reviewRequested and x.author ~= username
    end),
    involved = hs.fnutils.ifilter(pull_requests, function(x) return not x.reviewRequested and x.author ~= username end)
  }
end


local function update_menu(menu)
  local unread_style = { color = { red = 1.0, green = 0.0, blue = 0.0, alpha = 1.0 } }
  local pull_requests = get_pull_requests()
  local menu_table = {}
  local unread = false
  local approved = "APPROVED"
  local changes_requested = "CHANGES_REQUESTED"

  for _, pull_request in pairs(pull_requests.users_prs) do
    local title = pull_request.title

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
    local title = pull_request.title

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
    local title = pull_request.title

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

local pull_requests_menu = hs.menubar.new()

local PullRequests = {}

local timer = hs.timer.new(hs.timer.minutes(1), function() update_menu(pull_requests_menu) end, true)

function PullRequests.start()
  timer:start()
  timer:fire()
end

return PullRequests
