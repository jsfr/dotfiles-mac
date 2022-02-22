(local log (hs.logger.new :url-handler))

(fn notion [_ _ _ full-url]
  (let [notion-page (string.match full-url "https?://.-notion.so/(.*)")]
    (if (~= notion-page nil)
      (do (hs.urlevent.openURL (.. "notion://" notion-page))
        true)
      false)))

(fn miro [_ _ _ full-url]
  false)

(fn zoom [_ _ _ full-url]
  ; local meeting_id = string.match(fullURL, "https?://.-zoom.us/j/(%d+)")
  ; meeting_id = string.match(fullURL, "https?://.-zoom.us/event/callback/slack/(%d+)")
  ; hs.urlevent.openURL("zoommtg://zoom.us/join?zc=0&confno=" .. meeting_id)
  false)

(fn slack [_ _ _ full-url]
  false)

(fn fallback [_ _ _ full-url]
  (hs.urlevent.openURLWithBundle full-url "org.mozilla.firefox")
  true)

(fn http-callback [scheme host params full-url]
  (let [handlers [notion zoom slack miro fallback]]
    (var is-handled false)
    (each [_ handler (ipairs handlers) :until is-handled]
      (set is-handled (handler scheme host params full-url)))))

(fn start [] 
  (set hs.urlevent.httpCallback http-callback))

(fn stop []
  (set hs.urlevent.httpCallback nil))

{: start : stop}
