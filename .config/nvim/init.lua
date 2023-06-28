-- vim.loader.enable()

local datapath = vim.fn.stdpath("data") .. "/lazy/"
local lazypath = datapath .. "lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("Bootstrapping lazy.nvim")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local function bootstrap(url, ref)
	local name = url:gsub(".*/", "")
	local path = datapath .. name

	if vim.fn.isdirectory(path) == 0 then
		print(name .. ": installing in data dir...")

		vim.fn.system({"git", "clone", url, path})
		if ref then
			vim.fn.system({"git", "-C", path, "checkout", ref})
		end

		vim.cmd("redraw")
		print(name .. ": finished installing")
	end
	
	vim.opt.rtp:prepend(path)
end

bootstrap "https://github.com/udayvir-singh/hibiscus.nvim"
bootstrap("https://github.com/udayvir-singh/tangerine.nvim")

require("tangerine").setup {
	-- save fnl output in a separate dir, it gets automatically added to package.path
	target = vim.fn.stdpath("data") .. "/tangerine",

	-- compile files in &rtp
	rtpdirs = {
		"plugin"
	},

	compiler = {
		-- disable popup showing compiled files:
		verbose = false,

		-- compile every time changed are made to fennel files or on entering vim
		hooks = {"onsave", "oninit"}
	}	
}

