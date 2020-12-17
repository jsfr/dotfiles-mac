-- luacheck: globals token spaces pull_requests
require('auto_reload')
require('url_handler')
require('hs.ipc')

token = require('token')

pull_requests = require('pull_requests')
pull_requests.start()

spaces = require('spaces')
spaces.start()

-- bitday = require('bitday')
-- bitday.start()
