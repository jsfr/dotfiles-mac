(var watcher nil)

(fn reload []
  (watcher:stop)
  (hs.reload))

(set watcher
     (let [config-path (.. (os.getenv :HOME) "/.hammerspoon/")]
       (hs.pathwatcher.new config-path reload)))

(fn start []
  (watcher:start))

{: start : watcher}
