-- luacheck: globals token spaces pull_requests

-- setup luarocks
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.luarocks/share/lua/5.4/?.lua;" .. os.getenv("HOME") .. "/.luarocks/share/lua/5.4/?/init.lua"
package.cpath = package.cpath .. ";" .. os.getenv("HOME") .. "/.luarocks/lib/lua/5.4/?.so"

-- leagcy lua configuration
-- pull_requests = require("pull_requests")
-- pull_requests.update()

-- setup fennel
local fennel = require("fennel")
table.insert(package.loaders or package.searchers, fennel.searcher)

-- run fennel init file
fennel.dofile("init.fnl", { allowedGlobals = false })
