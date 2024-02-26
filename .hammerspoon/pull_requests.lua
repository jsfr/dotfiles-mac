local username = "jsfr"
-- token = (
--     subprocess.run(
--         ["/usr/bin/security", "find-generic-password", "-wa", "github_api_token"],
--         stdout=subprocess.PIPE,
--     )
--     .stdout.decode("utf-8")
--     .strip()
-- )
local url = "https://api.github.com/graphql"
local query = [[
  query ActivePullRequests($search: String!) {
    search(query: $search, type: ISSUE, first: 100) {
      issueCount nodes {
        ... on PullRequest {
          author {
            login
          }
          url
          title
          isReadByViewer
          isDraft
          reviewDecision
          reviewRequests(first: 100) {
            nodes {
              requestedReviewer {
                ... on User {
                  login
                }
              }
            }
          }
          assignees(first: 100) {
            nodes {
              login
            }
          }
        }
      }
    }
  }
]]
local search = "sort:updated-desc type:pr state:open involves:" .. username

local function is_author(node)
   return  
end

local function get_pull_requests()
    
end
