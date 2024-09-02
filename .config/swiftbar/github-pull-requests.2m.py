# #!/usr/bin/env python3
#
# # <bitbar.title>GitHub Pull Requests</bitbar.title>
# # <bitbar.version>v1.0</bitbar.version>
# # <bitbar.author>Jens Fredskov</bitbar.author>
# # <bitbar.author.github>jsfr</bitbar.author.github>
# # <bitbar.desc>Fetches information about pull requests a given user is involved in.</bitbar.desc>
# # <bitbar.dependencies>python3</bitbar.dependencies>
#
# # <swiftbar.hideAbout>true</swiftbar.hideAbout>
# # <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# # <swiftbar.hideLastUpdated>false</swiftbar.hideLastUpdated>
# # <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# # <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>
#
# import json
# import urllib.request
# import subprocess
#
# username = "jsfr"
# token = (
#     subprocess.run(
#         ["/usr/bin/security", "find-generic-password", "-wa", "github_api_token"],
#         stdout=subprocess.PIPE,
#     )
#     .stdout.decode("utf-8")
#     .strip()
# )
# url = "https://api.github.com/graphql"
# query = """
#   query ActivePullRequests($search: String!) {
#     search(query: $search, type: ISSUE, first: 100) {
#       issueCount nodes {
#         ... on PullRequest {
#           author {
#             login
#           }
#           url
#           title
#           isReadByViewer
#           isDraft
#           reviewDecision
#           reviewRequests(first: 100) {
#             nodes {
#               requestedReviewer {
#                 ... on User {
#                   login
#                 }
#               }
#             }
#           }
#           assignees(first: 100) {
#             nodes {
#               login
#             }
#           }
#         }
#       }
#     }
#   }
# """
# search = f"sort:updated-desc type:pr state:open involves:{username}"
#
#
# def is_author(node):
#     return node.get("author", {}).get("login", "") == username
#
#
# def in_review(node):
#     rs = node.get("reviewRequests", {}).get("nodes", [])
#
#     def login(r):
#         try:
#             return r["requestedReviewer"]["login"]
#         except KeyError:
#             return ""
#         except TypeError:
#             return ""
#
#     return any(login(r) == username for r in rs)
#
#
# def review_decision_image(node):
#     review_decision = node.get("reviewDecision", "")
#     if review_decision == "CHANGES_REQUESTED":
#         return "minus.square"
#     elif review_decision == "APPROVED":
#         return "checkmark.square"
#     else:
#         return "square"
#
#
# def print_pull_request(node):
#     title = node.get("title", "")
#     title = f"[Draft] {title}" if node.get("isDraft", False) else title
#
#     image = review_decision_image(node)
#     url = node.get("url", "")
#
#     output = f"{title} | href = {url} sfimage = {image}"
#     output = f"{output} color = red" if not node.get(
#         "isReadByViewer", True) else output
#
#     print(output)
#
#
# def print_pull_requests(nodes):
#     if len(nodes) == 0:
#         print("n/a | color = grey")
#     else:
#         for node in nodes:
#             print_pull_request(node)
#
#
# def print_sep():
#     print("---")
#
#
# def print_header(nodes, total_count):
#     has_unread = any(not node.get("isReadByViewer", True) for node in nodes)
#     header = f"{total_count} | sfimage = arrow.branch"
#     header = f"{header} color = red" if has_unread else header
#     header = f"{header} shortcut = CTRL+OPTION+SHIFT+COMMAND+P"
#     print(header)
#
#
# def print_menu(nodes, total_count):
#     author_nodes = []
#     review_nodes = []
#     involved_nodes = []
#
#     for node in nodes:
#         if is_author(node):
#             author_nodes.append(node)
#         elif in_review(node):
#             review_nodes.append(node)
#         else:
#             involved_nodes.append(node)
#
#     print_header(nodes, total_count)
#     print_sep()
#     print_pull_requests(author_nodes)
#     print_sep()
#     print_pull_requests(review_nodes)
#     print_sep()
#     print_pull_requests(involved_nodes)
#
#
# if __name__ == "__main__":
#     data = json.dumps({"query": query, "variables": {
#                       "search": search}}).encode("utf8")
#
#     req = urllib.request.Request(
#         url,
#         data=data,
#         headers={
#             "content-type": "application/json",
#             "authorization": f"bearer {token}",
#         },
#     )
#     resp = urllib.request.urlopen(req)
#     resp = json.loads(resp.read()).get("data", {}).get("search", {})
#     nodes = resp.get("nodes", [])
#     total_count = resp.get("issueCount", 0)
#
#     print_menu(nodes, total_count)
