-- 1. Create file plugin/0-tangerine.lua to bootstrap tangerine:
-- pick your plugin manager, default [standalone]
local pack = "paqs"

local function bootstrap (url)
	local name = url:gsub(".*/", "")
	local path = vim.fn.stdpath [[data]] .. "/site/pack/".. pack .. "/start/" .. name

	if vim.fn.isdirectory(path) == 0 then
		print(name .. ": installing in data dir...")

		vim.fn.system {"git", "clone", "--depth", "1", url, path}

		vim.cmd [[redraw]]
		print(name .. ": finished installing")
	end
end

bootstrap "https://github.com/lewis6991/impatient.nvim"
require "impatient"

bootstrap "https://github.com/udayvir-singh/tangerine.nvim"
require "tangerine".setup {
	-- save fnl output in a separate dir, it gets automatically added to package.path
	target = vim.fn.stdpath [[data]] .. "/tangerine",

	-- compile files in &rtp
	rtpdirs = {
		"plugin",
		"colors",
	},

	compiler = {
		-- disable popup showing compiled files
		verbose = false,

		-- compile every time changed are made to fennel files or on entering vim
		hooks = {"onsave", "oninit"}
	}	
}
