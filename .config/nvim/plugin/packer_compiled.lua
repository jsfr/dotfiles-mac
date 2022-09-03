-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/jens/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/jens/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/jens/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/jens/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/jens/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\n'\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\16plugin/tmux\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/Navigator.nvim",
    url = "https://github.com/numToStr/Navigator.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-conjure"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/cmp-conjure",
    url = "https://github.com/PaterJason/cmp-conjure"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  conjure = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/conjure",
    url = "https://github.com/Olical/conjure"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/ctrlsf.vim",
    url = "https://github.com/dyng/ctrlsf.vim"
  },
  ["direnv.vim"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/direnv.vim",
    url = "https://github.com/direnv/direnv.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\18plugin/format\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fzf-lua"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\20plugin/selector\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\1\2\0D\1\1\0\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\20plugin/gitsigns\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["guess-indent.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\1\2\0D\1\1\0\nsetup\17guess-indent\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/nmac427/guess-indent.nvim"
  },
  ["hibiscus.nvim"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/hibiscus.nvim",
    url = "https://github.com/udayvir-singh/hibiscus.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["kanagawa.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0009\0\1\0'\2\2\0B\0\2\1+\0\2\0L\0\2\0\25colorscheme kanagawa\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lightline.vim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\22plugin/statusline\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/lightline.vim",
    url = "https://github.com/itchyny/lightline.vim"
  },
  ["lir.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\25plugin/file-explorer\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/lir.nvim",
    url = "https://github.com/tamago324/lir.nvim"
  },
  ["lsp-setup.nvim"] = {
    config = { "\27LJ\2\n&\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\15plugin/lsp\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/lsp-setup.nvim",
    url = "https://github.com/junnplus/lsp-setup.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.nvim"] = {
    config = { "\27LJ\2\n'\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\16plugin/mini\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\22plugin/completion\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\nQ\0\0\4\0\4\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0D\1\2\0\1\0\2\14calm_down\2\17nearest_only\2\nsetup\fhlslens\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lightline-lsp"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/nvim-lightline-lsp",
    url = "https://github.com/josa42/nvim-lightline-lsp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\26plugin/search-replace\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\22plugin/treesitter\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n:\0\0\4\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0D\1\2\0\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["tangerine.nvim"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/tangerine.nvim",
    url = "https://github.com/udayvir-singh/tangerine.nvim"
  },
  ["tree-sitter-just"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/tree-sitter-just",
    url = "https://github.com/IndianBoy42/tree-sitter-just"
  },
  undotree = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\20plugin/undotree\frequire\0" },
    keys = { { "", "U" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-abolish"] = {
    commands = { "Subvert", "Abolish" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/opt/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-expand-region"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\25plugin/expand-region\frequire\0" },
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/vim-expand-region",
    url = "https://github.com/terryma/vim-expand-region"
  },
  ["vim-just"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/vim-just",
    url = "https://github.com/NoahTheDuke/vim-just"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-tridactyl"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/vim-tridactyl",
    url = "https://github.com/tridactyl/vim-tridactyl"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/vim-visual-star-search",
    url = "https://github.com/bronson/vim-visual-star-search"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/jens/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\1\2\0D\1\1\0\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time([[Config for gitlinker.nvim]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
try_loadstring("\27LJ\2\n'\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\16plugin/mini\frequire\0", "config", "mini.nvim")
time([[Config for mini.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\20plugin/gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
try_loadstring("\27LJ\2\nQ\0\0\4\0\4\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0D\1\2\0\1\0\2\14calm_down\2\17nearest_only\2\nsetup\fhlslens\frequire\0", "config", "nvim-hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0009\0\1\0'\2\2\0B\0\2\1+\0\2\0L\0\2\0\25colorscheme kanagawa\bcmd\bvim\0", "config", "kanagawa.nvim")
time([[Config for kanagawa.nvim]], false)
-- Config for: lightline.vim
time([[Config for lightline.vim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\22plugin/statusline\frequire\0", "config", "lightline.vim")
time([[Config for lightline.vim]], false)
-- Config for: nvim-spectre
time([[Config for nvim-spectre]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\26plugin/search-replace\frequire\0", "config", "nvim-spectre")
time([[Config for nvim-spectre]], false)
-- Config for: vim-expand-region
time([[Config for vim-expand-region]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\25plugin/expand-region\frequire\0", "config", "vim-expand-region")
time([[Config for vim-expand-region]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\18plugin/format\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\n'\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\16plugin/tmux\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\22plugin/completion\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: lsp-setup.nvim
time([[Config for lsp-setup.nvim]], true)
try_loadstring("\27LJ\2\n&\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\15plugin/lsp\frequire\0", "config", "lsp-setup.nvim")
time([[Config for lsp-setup.nvim]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\25plugin/file-explorer\frequire\0", "config", "lir.nvim")
time([[Config for lir.nvim]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\1\2\0D\1\1\0\nsetup\17guess-indent\frequire\0", "config", "guess-indent.nvim")
time([[Config for guess-indent.nvim]], false)
-- Config for: fzf-lua
time([[Config for fzf-lua]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\20plugin/selector\frequire\0", "config", "fzf-lua")
time([[Config for fzf-lua]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\4\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0D\1\2\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\22plugin/treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Subvert lua require("packer.load")({'vim-abolish'}, { cmd = "Subvert", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Abolish lua require("packer.load")({'vim-abolish'}, { cmd = "Abolish", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> U <cmd>lua require("packer.load")({'undotree'}, { keys = "U", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
