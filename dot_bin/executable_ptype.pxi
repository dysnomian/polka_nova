#!/usr/local/bin/pixie

(ns ptype
  (:require [pixie.string :as s]
            [pixie.io :as io]
            [pixie.system :as sys]
            [pixie.io.tty :as tty]))

;; The file the script looks for to determine the project type and root.
(def project-file
  (or (first program-arguments) ""))

;; The directory the script is called from.
(def original-directory
  (str (sh "pwd")))

;; The source directory. This is the tricky one: mine is at ~/src, but
;; realistically, that has to be set elsewhere. Could also crawl up to $HOME.
(def src-dir (str (getenv "$HOME") "/src"))

(def max-depth (sh (str "dirdepth " src-dir)))

;; Project types => language

(map 'puts (pixie.string/split original-directory "/"))

(puts original-directory)
