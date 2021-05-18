(local menu-item (hs.menubar.new))

(fn space-text [space active-space]
  "Returns the styled number block of a given space"
  (let [space-font {:name "CD Numbers" :size 12}
        inactive-color {:red 0.34 :green 0.37 :blue 0.39 :alpha 1.0}
        active-style {:font space-font :baselineOffset -5.0}
        inactive-style {:font space-font :baselineOffset -5.0 :color inactive-color}
        space-icons {1 :e 2 :f 3 :g 4 :i 5 :j 6 :k 7 :l 8 :m 9 :n 10 :o :f :a}
        space-icon-unknown :h]
    (hs.styledtext.new
      (or (?. space-icons space) space-icon-unknown)
      (if (= space active-space) active-style inactive-style)))
  )

(fn callback [exit-code std-out _]
  "Updates the menubar item given a set of spaces and an active space"
  (if (= exit-code 0)
    (let [result (hs.json.decode std-out)]
      (when (~= result nil)
        (let [visible-spaces (. result :spaces)
              active-space (. result :focused)]
          (var title (hs.styledtext.new " "))
          (each [_ space (pairs visible-spaces)]
            (set title (.. title (space-text space active-space))))
          (menu-item:setTitle title))))))

(var task nil)

(fn terminate-task []
  "Terminates the task if it is currently running"
  (when (and (~= task nil) (task:isRunning))
    (task:terminate)
    (set task nil)))

(fn run-task []
  "Run the task to update the menubar item"
  (let [command (hs.fs.pathToAbsolute "./spaces.sh")]
    (set task (: (hs.task.new command callback) :start))))

(fn update []
  "Asynchronously update the menubar item"
  (terminate-task)
  (run-task))

{: task : update : menu-item}
