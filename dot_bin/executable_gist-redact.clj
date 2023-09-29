;;; Rename your github gists from your old username to your new
;;; username
;;;
;;; Why is this script necessary?
;;; When you change your username on GitHub, while it does update your
;;; username on the gist pages, it doesn't change anything in the git
;;; repos backing your gists. This means someone can clone your gist
;;; git repo and see your old username. If you changed your github
;;; username for privacy reasons, this is not ideal.
;;;
;;; For example, if you change your github username from "oldname" to
;;; "newname", the gists previously located at
;;; https://gist.github.com/oldname no longer exist and don't
;;; redirect. GitHub already moved them to
;;; https://gist.github.com/newname and they show your new username
;;; properly. But if you clone the git repo backing the gist, you'll
;;; see git commits by your old username under
;;; "oldname <oldname@users.noreply.github.com>". This script changes
;;; the commits to be under "newname <newname@users.noreply.github.com>",
;;; just as they'd be if you made a new gist under your new username.
;;;
;;; Requirements:
;;; * Leiningen - http://leiningen.org/
;;; * lein-exec - https://github.com/kumarshantanu/lein-exec
;;;
;;; * A shell script using git-filter-branch to change your name and
;;; email on on all commits in a git repo.
;;; One such example of a script lives at
;;; https://gist.github.com/trynity/35cc3b142131e0981868
;;;
;;; * Add new rules to the script you use for your github/gists
;;; username and email:
;;; old username: oldname
;;; old email: oldname@users.noreply.github.com
;;; new username: newname
;;; new email: newname@users.noreply.github.com
;;;
;;; * A personal access token for the GitHub API
;;; https://github.com/settings/applications
;;;
;;; Usage: GITHUB_AUTH="username:token" lein exec gist-rename.clj

(use '[leiningen.exec :only (deps)])
(deps '[
        [tentacles "0.3.0"]
        ])

(require '[tentacles.gists :as gists])
(require '[clojure.java.io :as io])
(require '[clojure.java.shell :refer (with-sh-dir sh)])

(def options {:auth (System/getenv "GITHUB_AUTH") :all-pages true})

(def tmpdir (io/file "/tmp/gists"))
(if-not (.exists tmpdir)
  (.mkdirs tmpdir))

(with-sh-dir tmpdir
  (let [gists (gists/gists options)
        total (count gists)
        ;; (map vector xs ys) is equivalent to zip(xs, yz) in python
        gists-with-count (map vector gists (range 1 (inc total)))]
    (doseq [[gist i] gists-with-count]
      (let [id (:id gist)]
        (println (str i "/" total " " id))
        (println "cloning" id)
        (sh "git" "clone" (str "git@gist.github.com:/" id))
        (with-sh-dir (io/file tmpdir id)
          (println "rewriting" id)
          ;; TODO Change this to your git-filter-branch script
          (sh "git trotskyify")
          ;; Change url to push with ssh because it's probably going to
          ;; work faster than asking for credentials for the default
          ;; https repo it gives us, even when cloning from the ssh url
          ;; for some reason
          (sh "git" "remote" "set-url" "origin" (str "git@gist.github.com:/" id))
          (println "pushing" id)
          (sh "git" "push" "-f" "origin" "master"))))))
