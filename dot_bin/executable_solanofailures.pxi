#!/usr/local/bin/pixie

(ns solano-failures
  (require pixie.string :as s)
  (require pixie.io :as io))

(def run-id (if (empty? program-arguments)
             nil
             (str (first program-arguments))))

(defn fetch-failure-list [id]
  (sh (str "solano describe "
           id
           " | awk 'FNR > 6 {print $1}'")))

(if (nil? run-id)
  (puts "No suite ID given")
  (fetch-failure-list run-id))
