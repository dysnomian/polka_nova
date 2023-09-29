
(use '[leiningen.exec :only (deps)])
(deps '[
        [tentacles "0.3.0"]
        ])

(require '[tentacles.repos.user-repos :as repos])
(require '[clojure.java.io :as io])
(require '[clojure.java.shell :refer (with-sh-dir sh)])

(def options 
{:auth (System/getenv "GITHUB_AUTH") :all-pages true})

