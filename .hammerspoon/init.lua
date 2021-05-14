-- luacheck: globals token spaces pull_requests
require("auto_reload")
require("hs.ipc")

token = require("token")

pull_requests = require("pull_requests")
pull_requests.update()

spaces = require("spaces")
spaces.update()
