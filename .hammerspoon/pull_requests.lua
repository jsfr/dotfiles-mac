-- luacheck: globals hs

local JSON = require('JSON')
local keychain = require('keychain')

local username = "jsfr"
local token = keychain.password_from_keychain("github_api_token")

local query = [[
  {
    viewer {
      pullRequests(first: 100, states: OPEN) {
        edges {
          node {
            repository {
              nameWithOwner
            }
            url
            title
            isReadByViewer
          }
        }
      }
    }
    search(query: \\\"type:pr state:open review-requested:]] .. username .. [[\\\", type: ISSUE, first: 100) {
      edges {
        node {
          ... on PullRequest {
            repository {
              nameWithOwner
            }
            url
            title
            isReadByViewer
          }
        }
      }
    }
  }
]]

local url = "https://api.github.com/graphql"

local function map(func, array)
  local new_array = {}
  for i,v in ipairs(array) do
    new_array[i] = func(v)
  end
  return new_array
end

local function map_node(node)
  return {
    repository = node.node.repository.nameWithOwner,
    title = node.node.title,
    url = node.node.url,
    unread = not node.node.isReadByViewer
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

  local own_prs = map(map_node, result.data.viewer.pullRequests.edges)
  local review_requested = map(map_node, result.data.search.edges)
  local total_count = #own_prs + #review_requested

  return {
    total_count = total_count,
    own_prs = own_prs,
    review_requested = review_requested
  }
end


local function update_menu(menu)
  local unread_style = { red = 1.0, green = 0.0, blue = 0.0, alpha = 1.0 }
  local pull_requests = get_pull_requests()
  local menu_table = {}
  local unread = false

  for _, pull_request in pairs(pull_requests.own_prs) do
    local title = pull_request.title

    if (pull_request.unread) then
      unread = true
      title = hs.styledtext.new(title, unread_style)
    end

    table.insert(menu_table, {
        title = title,
        fn = function() hs.urlevent.openURL(pull_request.url) end
      })
  end

  if (#pull_requests.own_prs > 0 and #pull_requests.review_requested > 0) then
    table.insert(menu_table, { title = "-" })
  end

  for _, pull_request in pairs(pull_requests.review_requested) do
    local title = pull_request.title

    if (pull_request.unread) then
      unread = true
      title = hs.styledtext.new(title, unread_style)
    end

    table.insert(menu_table, {
        title = title,
        fn = function() hs.urlevent.openURL(pull_request.url) end
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

-- Set timer and fire first one immediately
hs.timer.doEvery(30, function() update_menu(pull_requests_menu) end):fire()
