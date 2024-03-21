;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; Must Have packages
;; (package! helm-org-rifle)
(package! org-ql)
(package! org-noter-pdftools)
;; useful for parsing web pages
(package! org-web-tools)
;; Testing
;; analyze when you have entered data and filter activity based on your clocking
(package! org-analyzer)
(package! org-mru-clock) ;; clocking in and out easier
(package! grab-x-link) ;; grabbing links from firefox, chrome and so on.
(package! xkcd)
(package! anki-editor)
(package! nepali-romanized
  :recipe (:host github :repo "bishesh/emacs-nepali-romanized"))
(package! org-clock-convenience)
(package! magit-delta
  :recipe (:host github :repo "dandavison/magit-delta"))
(package! ov
  :recipe (:host github :repo "emacsorphanage/ov.el"))

;; Who likes hydra when it's not centered?
(package! hydra-posframe
  :recipe (:host github :repo "Ladicle/hydra-posframe"))

;; Why go to scihub when emacs can do it?
(package! scihub
  :recipe (:host github :repo "emacs-pe/scihub.el"))

;; Managing citations with zotero
(package! zotxt)

;; handle very large files
(package! vlf :recipe (:host github :repo "m00natic/vlfi" :files ("*.el")))
(package! ox-ipynb
  :recipe (:host github :repo "jkitchin/ox-ipynb"))
;; easy to read auto fill without doing anything
(package! virtual-auto-fill)
(package! org-fragtog)
(package! focus)
(package! aggressive-indent)
(package! visual-regexp-steroids)
(package! org-edna)
(package! org-super-agenda)
(package! ess-view)
(package! screenshot :recipe (:host github :repo "tecosaur/screenshot"))
(package! laas)
(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))
(package! wallabag
  :recipe (:host github
           :repo "chenyanming/wallabag.el"
           :files ("*.el" "*.alist" "*.css")))
(package! page-break-lines)
(package! websocket)
(package! org-roam-ui :recipe (:host github :repo "org-roam/org-roam-ui" :files ("*.el" "out")))
(package! ox-json)
;; (package! org-roam-bibtex)
(package! powershell)
(package! evil-escape :disable t)
(package! org-modern)
(package! org-appear)
(package! copilot
  :recipe (:host github :repo "zerolfx/copilot.el" :files ("*.el" "dist")))
(package! elfeed-tube
  :recipe (:host github :repo "karthink/elfeed-tube"))
(package! elfeed-tube-mpv
  :recipe (:host github :repo "karthink/elfeed-tube"))
(package! numpydoc
  :recipe (:host github :repo "douglasdavis/numpydoc.el"))
;; (package! evil-colemak-basics)
;; for managing book reading
;; (package! ein :recipe (:no-byte-compile t))
;; (package! ein)

;;looks
;; (package! focus)
;; (package! dimmer)
(package! info-colors)
;; (package! svg-tag-mode)
;; (package! solaire-mode :disable t)

;;nano
;; (package! nano-theme)
;; (package! evil-colemak-basics)

;; Optional
;; (package! gnuplot)
(package! leetcode)
;; (package! org-ref-cite
;;  :recipe (:host github :repo "jkitchin/org-ref-cite"))

;; Download images directly into org mode
;; (package! org-download)
;;(package! memrise)
(package! academic-phrases)
;; (package! lorem-ipsum)

;; (package! dockerfile-mode)
;; (package! docker)
(package! elfeed-score)
(unpin! emacsql)
(package! org-books
  :recipe (:host github :repo "goderich/org-books"))

;; ;; (straight-use-package '(tsx-mode :type git :host github :repo "orzechowskid/tsx-mode.el"
;; (package! tsx-mode
;;   :recipe (:host github :repo "orzechowskid/tsx-mode.el" :branch "emacs28"))
;; (package! tsi
;;   :recipe (:host github :repo "orzechowskid/tsi.el"))
;;; (pa! org-time-budgets
;;   :recipe (:host github :repo "leoc/org-time-budgets" :branch "develop" :no-byte-compile t)) ;; budgeting on tasks
(package! org-transclusion)
(package! org-remark)
;; (unpin! ox-hugo)
;; (package! gptel)
(package! org-fancy-priorities)

;; (unpin! saveplace-pdf-view)

(package! org-time-budgets
  :recipe (:host github :repo "dragarok/org-time-budgets" :branch "cl-lib")) ;; budgeting on tasks
(package! orgmdb)
(package! gptel)(package! evil-tutor)

;; Org-roam
(unpin! org-roam)
(package! org-roam-ui)

(package! transient
      :pin "c2bdf7e12c530eb85476d3aef317eb2941ab9440"
      :recipe (:host github :repo "magit/transient"))

(package! with-editor
          :pin "bbc60f68ac190f02da8a100b6fb67cf1c27c53ab"
          :recipe (:host github :repo "magit/with-editor"))

