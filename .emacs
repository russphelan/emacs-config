;------window system switch------;
(if window-system
  (progn 
      (tool-bar-mode -1)
      (scroll-bar-mode 0)
      (set-fringe-mode 0))
  (progn
      (menu-bar-mode -1)
      (set-fringe-mode 0)))
;------end window system switch------;

;------custom keybinds------;
(setq mac-command-modifier 'control)
;------end custom keybinds------;

;------custom faces------;
(set-face-attribute 'default nil :font "Anonymous Pro 12")
(set-background-color "#002b36") ;make sure background color is right
;------end custom faces------;

;------other custom-set variables------;
(setq make-backup-files 'nil) ;keep emacs from generating backup files
(fset 'yes-or-no-p 'y-or-n-p) ;shorten yes-or-no prompts
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

;------variables set by Customize------;
(custom-set-variables
 '(org-log-done (quote note))
 '(org-src-fontify-natively t)
 '(org-startup-indented t))
(custom-set-faces
 '(org-date ((t (:foreground "#839496"))))
 '(org-hide ((t (:foreground "#073642"))))
 '(org-special-keyword ((t (:foreground "#52676f"))))
 '(org-todo ((t (:background "#c60007" :foreground "#042028" :inverse-video t 
			     :underline nil :slant normal :weight bold))))
 '(org-level-1 ((t (:foreground "#b58900"))))
 '(org-level-2 ((t (:foreground "#cb4b16"))))
 '(org-level-3 ((t (:foreground "#dc322f"))))
 '(org-level-4 ((t (:foreground "#d33682"))))
 '(org-level-5 ((t (:foreground "#6c71c4"))))
 '(org-level-6 ((t (:foreground "#268bd2"))))
 '(org-level-7 ((t (:foreground "#2aa198"))))
 '(org-level-8 ((t (:foreground "#859900")))))
 ;------end variables set by Customize------;

