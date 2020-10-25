-- luacheck: globals hs
--
-- token.lua - generate google authenticator token value keystrokes
-- written by Teun Vink <github@teun.tv>
-- https://github.com/teunvink/hammerspoon
--
-- Retrieve a google authenticator token seed from keychain and use this to calculate the current value
-- Simulate keystrokes for this token value

local gauth = require "gauth"
local keychain = require "keychain"

-- code is based on:
--   https://github.com/imzyxwvu/lua-gauth/blob/master/gauth.lua (with small modifications)
--   https://github.com/kikito/sha.lua

local Token = {}

-- read a token seed from keychain, generate a code and make keystrokes for it
function Token.token_keystroke(token_name)
    local token = keychain.password_from_keychain(token_name)
    local hash = gauth.GenCode(token, math.floor(os.time() / 30))

    -- generate keystrokes for the result
    hs.eventtap.keyStrokes(("%06d"):format(hash))
end

return Token
