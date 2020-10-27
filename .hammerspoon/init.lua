-- luacheck: globals token spaces bitday pull_requests
require('auto_reload')
require('hs.ipc')
require('url_handler')

token = require('token')
spaces = require('spaces')

pull_requests = require('pull_requests')
bitday = require('bitday')

bitday.start()
pull_requests.start()
