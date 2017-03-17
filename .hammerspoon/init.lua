require('watcher')

local function keyCode(key, modifiers)
   modifiers = modifiers or {}
   return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
   end
end

local function keyCodeSet(keys)
   return function()
      for i, keyEvent in ipairs(keys) do
         keyEvent()
      end
   end
end

local function remapKey(modifiers, key, keyCode)
   hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

local function disableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:disable()
   end
end

local function enableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:enable()
   end
end

local function handleGlobalAppEvent(name, event, app)
   if event == hs.application.watcher.activated then
      -- hs.alert.show(name)
      if name == 'iTerm2' then
         disableAllHotkeys()
      else
         enableAllHotkeys()
      end
   end
end

appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()

-- move cursor
remapKey({'ctrl'}, 'f', keyCode('right'))
remapKey({'ctrl'}, 'b', keyCode('left'))
remapKey({'ctrl'}, 'n', keyCode('down'))
remapKey({'ctrl'}, 'p', keyCode('up'))
remapKey({'alt'}, 'f', keyCode('right', {'alt'}))
remapKey({'alt'}, 'b', keyCode('left', {'alt'}))
remapKey({'alt', 'shift'}, ',', keyCode('up', {'cmd'}))
remapKey({'alt', 'shift'}, '.', keyCode('down', {'cmd'}))

-- edit text
remapKey({'ctrl'}, 'w', keyCode('delete', {'alt'}))
remapKey({'alt'}, 'w', keyCode('delete', {'cmd'}))
remapKey({'ctrl'}, 'u', keyCodeSet({
  keyCode('e', {'ctrl'}),
  keyCode('delete', {'cmd'})
}))

-- command
remapKey({'ctrl'}, 's', keyCode('f', {'cmd'}))
remapKey({'ctrl'}, '/', keyCode('z', {'cmd'}))
remapKey({'ctrl'}, '[', keyCode('escape'))
remapKey({'ctrl'}, 'm', keyCode('return'))
remapKey({'ctrl'}, 'o', keyCode('return', {'ctrl'}))
remapKey({'ctrl'}, 'i', keyCode('tab'))

-- combination
remapKey({'ctrl', 'cmd'}, 'm', keyCode('return', {'cmd'}))
remapKey({'ctrl', 'cmd'}, 'p', keyCode('up', {'cmd'}))

-- page scroll
remapKey({'ctrl'}, 'v', keyCode('pagedown'))
remapKey({'alt'}, 'v', keyCode('pageup'))
