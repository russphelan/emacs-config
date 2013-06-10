;; window-system switch. run commands depending on whether emacs is in
;; GUI mode or terminal mode.
(if window-system
  (progn 
      (tool-bar-mode -1)
      (scroll-bar-mode 0)
      (set-fringe-mode 0))
  (progn
      (menu-bar-mode -1)
      (set-fringe-mode 0)))

;; custom faces (fonts)
(set-face-attribute 'default nil :font "Anonymous Pro 12")


;;------package and repository management------
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
;;------end package and repository management------


;;------custom theme management------
(load-theme 'solarized-dark t)
;;------end custom theme management------




;; variables and faces that were custom set in emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-startup-indented t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

