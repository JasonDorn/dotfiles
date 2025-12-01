-- Hammerspoon Configuration
-- Reload config automatically when this file changes
local hotkey = require "hs.hotkey"
local application = require "hs.application"
local alert = require "hs.alert"

-- Hotkey to toggle kitty terminal with Cmd+`
hotkey.bind({"cmd"}, "`", function()
  local app = application.get("kitty")
  if app then
    if app:isFrontmost() then
      app:hide()
    else
      app:activate()
    end
  else
    application.launchOrFocus("/Applications/kitty.app")
  end
end)

-- Show alert when config is loaded
alert.show("Hammerspoon config loaded!")

-- Auto-reload config when this file changes
function reloadConfig(files)
  local doReload = false
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end

local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
alert.show("Config watcher started")
