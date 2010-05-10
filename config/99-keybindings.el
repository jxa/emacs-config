(setq ns-command-modifier 'meta)

(global-set-key (kbd "C-;") 'anything-at-point)
(global-set-key "\M-n"      'duplicate-line)
(global-set-key "\C-x\\"    'align-regexp)
(global-set-key "\M-#"      'comment-or-uncomment-region)
(global-set-key "\C-xp"     'other-window-backward)
(global-set-key (kbd "M-.") 'anything-yaetags-find-tag)

;; make a new prefix key, C-l
(global-unset-key (kbd "C-l"))
(defvar layout-keymap (make-sparse-keymap "layout"))
(define-key global-map (kbd "C-l") layout-keymap)
;; define commands like C-l C-n
(define-key layout-keymap (kbd "C-l") 'recenter)
(define-key layout-keymap (kbd "C-n") 'other-window)
(define-key layout-keymap (kbd "C-p") 'other-window-backward)
(define-key layout-keymap (kbd "C-f") 'toggle-fullscreen)
