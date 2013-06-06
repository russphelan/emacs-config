;; window-system switch. run commands depending on whether emacs is in
;; GUI mode or terminal mode.
(if window-system
  (progn 
      (tool-bar-mode -1)
      (scroll-bar-mode -1))
  (progn
      (menu-bar-mode -1)))

;; custom faces (fonts)
(set-face-attribute 'default nil :font "Anonymous Pro 12")

;; package and repository management
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(defvar my-packages '(color-theme-solarized)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p)))

