;------window system switch------;
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode 0)
      (set-fringe-mode 0)
      (set-face-attribute 'default nil :font "Anonymous Pro 12")
     (progn
      (menu-bar-mode -1))))
;------end window system switch------;

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

;load lisp from any subdirectories of .emacs.d
(let ((default-directory "~/.emacs.d/"))
      (normal-top-level-add-subdirs-to-load-path))

(require 'evil)
(evil-mode 1)
(require 'ace-jump-mode)
(require 'cl) ;needed to make ace-jump-mode work

(require 'elisp-slime-nav)
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'elisp-slime-nav-mode))
;------end package and repository management------;

;------custom keybinds------;
(setq mac-command-modifier 'control) ;if on a Mac, changes Command to Control
				     ;Command is intended to be changes with
				     ;Caps Lock outside of Emacs.

;makes 'jk' act as escape if pressed quickly
(define-key evil-insert-state-map "j" #'cofi/maybe-exit)

(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?k)
			   nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?k))
	(delete-char -1)
	(set-buffer-modified-p modified)
	(push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
					      (list evt))))))))
;------end custom keybinds------;

;------other custom-set variables------;
(setq make-backup-files 'nil) ;keep emacs from generating backup files
(fset 'yes-or-no-p 'y-or-n-p) ;shorten yes-or-no prompts
;------end other custom-set variables------;

;------ace jump mode config------;
(defmacro evil-enclose-ace-jump (&rest body)
`(let ((old-mark (mark))
(ace-jump-mode-scope 'window))
(remove-hook 'pre-command-hook #'evil-visual-pre-command t)
(remove-hook 'post-command-hook #'evil-visual-post-command t)
(unwind-protect
(progn
,@body
(recursive-edit))
(if (evil-visual-state-p)
(progn
(add-hook 'pre-command-hook #'evil-visual-pre-command nil t)
(add-hook 'post-command-hook #'evil-visual-post-command nil t)
(set-mark old-mark))
(push-mark old-mark)))))
 
(evil-define-motion evil-ace-jump-char-mode (count)
:type exclusive
(evil-enclose-ace-jump
(ace-jump-mode 5)))
 
(evil-define-motion evil-ace-jump-line-mode (count)
:type line
(evil-enclose-ace-jump
(ace-jump-mode 9)))
 
(evil-define-motion evil-ace-jump-word-mode (count)
:type exclusive
(evil-enclose-ace-jump
(ace-jump-mode 1)))
 
(evil-define-motion evil-ace-jump-char-to-mode (count)
:type exclusive
(evil-enclose-ace-jump
(ace-jump-mode 5)
(forward-char -1)))
 
(add-hook 'ace-jump-mode-end-hook 'exit-recursive-edit)
 
;some proposals for binding:
 
(define-key evil-motion-state-map (kbd "SPC") #'evil-ace-jump-char-mode)
(define-key evil-motion-state-map (kbd "C-SPC") #'evil-ace-jump-word-mode)
 
(define-key evil-operator-state-map (kbd "SPC") #'evil-ace-jump-char-mode) ; similar to f
(define-key evil-operator-state-map (kbd "C-SPC") #'evil-ace-jump-char-to-mode) ; similar to t
(define-key evil-operator-state-map (kbd "M-SPC") #'evil-ace-jump-word-mode)
 
;different jumps for different visual modes
(defadvice evil-visual-line (before spc-for-line-jump activate)
(define-key evil-motion-state-map (kbd "SPC") #'evil-ace-jump-line-mode))
 
(defadvice evil-visual-char (before spc-for-char-jump activate)
(define-key evil-motion-state-map (kbd "SPC") #'evil-ace-jump-char-mode))
 
(defadvice evil-visual-block (before spc-for-char-jump activate)
(define-key evil-motion-state-map (kbd "SPC") #'evil-ace-jump-char-mode))
;------end ace jump mode config------;

;------custom theme management------;
(load-theme 'solarized-dark t)
;------end custom theme management------;

;------language binaries------;
(setq scheme-program-name
    "/Applications/mit-scheme.app/Contents/Resources/mit-scheme")

(require 'xscheme)
;------end language binaries------;

;------variables set by Customize------;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-log-done (quote note))
 '(org-src-fontify-natively t)
 '(org-startup-indented t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minibuffer-prompt ((t (:foreground "#2075c7" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(org-date ((t (:foreground "#839496"))) t)
 '(org-hide ((t (:foreground "#073642"))) t)
 '(org-level-1 ((t (:foreground "#b58900" :height 140))) t)
 '(org-level-2 ((t (:foreground "#cb4b16"))) t)
 '(org-level-3 ((t (:foreground "#dc322f"))) t)
 '(org-level-4 ((t (:foreground "#d33682"))) t)
 '(org-level-5 ((t (:foreground "#6c71c4"))) t)
 '(org-level-6 ((t (:foreground "#268bd2"))) t)
 '(org-level-7 ((t (:foreground "#2aa198"))) t)
 '(org-level-8 ((t (:foreground "#859900"))) t)
 '(org-special-keyword ((t (:foreground "#52676f"))) t)
 '(org-todo ((t (:background "#c60007" :foreground "#042028" :inverse-video t :underline nil :slant normal :weight bold))) t))
 ;------end variables set by Customize------;
