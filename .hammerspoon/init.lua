-- luacheck: globals token spaces bitday pull_requests
require('auto_reload')
require('url_handler')
require('hs.ipc')

token = require('token')
spaces = require('spaces')
pull_requests = require('pull_requests')
bitday = require('bitday')

bitday.start()
pull_requests.start()
spaces.start()
