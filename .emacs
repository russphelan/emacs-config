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

;------custom keybinds------;
(setq mac-command-modifier 'control)
;------end custom keybinds------;

;------custom faces------;
(set-face-attribute 'default nil :font "Anonymous Pro 12")
;------end custom faces------;

;------other custom-set variables------;
(setq make-backup-files nil)
;------end other custom-set variables------;

;------package and repository management------;
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
;------end package and repository management------;


;------custom theme management------;
(load-theme 'solarized-dark t)
;------end custom theme management------;

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
 '(org-date ((t (:foreground "#a57705" :underline t))))
 '(org-hide ((t (:foreground "#0a2832")))) ;face for hidden stars
 '(org-level-1 ((t (:foreground "#bd3612"))))
 '(org-level-2 ((t (:foreground "#259185"))))
 '(org-level-3 ((t (:foreground "#2075c7"))))
 '(org-level-4 ((t (:foreground "#728a05"))))
 '(org-special-keyword ((t (:foreground "#52676f"))))
 '(org-todo ((t (:background "#c60007" :foreground "#042028" :inverse-video t :underline nil :slant normal :weight bold)))))
 ;red TODO keywords

