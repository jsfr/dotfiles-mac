(fn callback [app-name event-type application]
  (when (and (= app-name "rmenu") (= event-type hs.application.watcher.deactivated))
    (application:setFrontmost true)))

(local watcher (hs.application.watcher.new callback))

(fn start []
  (watcher:start))

{: start : watcher}
