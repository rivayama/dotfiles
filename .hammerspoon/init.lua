local home = os.getenv("HOME")

local function handleGlobalEvent(name, event, app)
    if event == hs.application.watcher.activated then
        -- hs.alert.show(name)
        if name == "MacVim" then
            hs.execute(home .. '/.hammerspoon/karabiner-switcher 1', true)
        else
            hs.execute(home .. '/.hammerspoon/karabiner-switcher 0', true)
        end
    end
end

watcher = hs.application.watcher.new(handleGlobalEvent)
watcher:start()
