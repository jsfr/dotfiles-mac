-- setup fennel
local fennel = require("fennel")

-- allow requiring of fennel modules
table.insert(package.loaders or package.searchers, fennel.searcher)

-- run fennel init file
fennel.dofile("init.fnl", { allowedGlobals = false })
