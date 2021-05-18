; -- luacheck: globals hs

; myTimer = nil
; enableAutoClick = false

; -- Seconds to delay before next click. 0.001 works OK.
; speedDelay = 0.005

; function mouseRightClick()
;     -- Run right mouseclick
;     hs.eventtap.rightClick(hs.mouse.getAbsolutePosition())
; end

; function isAutoClickerEnabled()
;     return enableAutoClick
; end

; function setupClicker()
;     -- Set continuous run to true
;     enableAutoClick = true
;     print("Enabled autoclicker")

;     myTimer = hs.timer.doWhile(isAutoClickerEnabled, mouseRightClick, speedDelay)
; end

; function stopClicker()
;     -- Stop autoclicker
;     enableAutoClick = false
; end

; function sleep(n)
;     local t = os.clock()
;     while os.clock() - t <= n do
;       -- nothing
;     end
; end

; hs.hotkey.bind({"cmd","alt","shift"}, "A", setupClicker)
; hs.hotkey.bind({"cmd","alt","shift"}, "D", stopClicker)
