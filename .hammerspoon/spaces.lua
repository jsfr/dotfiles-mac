-- luacheck: globals hs

local space_font = { name = 'CD Numbers', size = 12 }
local inactive_color = { red = 0.35, green = 0.37, blue = 0.39, alpha = 1.0 }
local active_style = { font = space_font, baselineOffset = -10.0 }
local inactive_style = { font = space_font, baselineOffset = -10.0, color = inactive_color }
local space_icons = {
  [1] = 'e',
  [2] = 'f',
  [3] = 'g',
  [4] = 'i',
  [5] = 'j',
  [6] = 'k',
  [7] = 'l',
  [8] = 'm',
  [9] = 'n',
  [10] = 'o',
  ["f"] = 'a'
}

local spaces_menu = hs.menubar.new()
spaces_menu:setTitle('[spaces]')

local Spaces = {}

function Spaces.update(list_of_spaces, active_space)
  local spaces = hs.styledtext.new(' ')
  for _, space in pairs(list_of_spaces) do
    if (active_space == space) then
      spaces = spaces .. hs.styledtext.new(space_icons[space], active_style)
    else
      spaces = spaces .. hs.styledtext.new(space_icons[space], inactive_style)
    end
  end
  spaces_menu:setTitle(spaces)
end

return Spaces