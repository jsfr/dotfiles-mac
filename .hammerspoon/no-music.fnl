(fn callback [app-name event-type application]
  (when (and (= app-name "Music") (= event-type hs.application.watcher.launching))
    (application:kill9)
    (print "Music.app tried to launch. Killed.")))

(local watcher (hs.application.watcher.new callback))

(fn start []
  (watcher:start))

{: start : watcher}
