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

