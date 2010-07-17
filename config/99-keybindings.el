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
(define-key layout-keymap (kbd "C-a") 'delete-other-windows)
(define-key layout-keymap (kbd "C-b") 'balance-windows)
(define-key layout-keymap (kbd "C-n") 'other-window)
(define-key layout-keymap (kbd "C-p") 'other-window-backward)
(define-key layout-keymap (kbd "C-f") 'toggle-fullscreen)
(define-key layout-keymap (kbd "C-c") 'split-window-vertically)
(define-key layout-keymap (kbd "C-h") 'delete-window)
(define-key layout-keymap (kbd "C-k") (lambda () (interactive) (kill-buffer)))
(define-key layout-keymap (kbd "C-w") 'toggle-truncate-lines)

;; make a new prefix key, C-t
(global-unset-key (kbd "C-t"))
(defvar to-keymap (make-sparse-keymap "to"))
(define-key global-map (kbd "C-t") to-keymap)

(define-key to-keymap (kbd "C-t") 'transpose-chars)
(define-key to-keymap (kbd "C-a") 'beginning-of-line-text)
(define-key to-keymap (kbd "C-h") 'beginning-of-buffer)
(define-key to-keymap (kbd "C-l") 'end-of-buffer)

;; isearch customizations

(defun ja-isearch-current-match ()
  (buffer-substring (match-beginning 0) (match-end 0)))

(defvar isearch-paste-keymap (make-sparse-keymap "isearch-paste"))
(define-key isearch-mode-map (kbd "C-v") isearch-paste-keymap)

;; C-v C-v : paste isearch match
(define-key isearch-paste-keymap (kbd "C-v")
  (lambda () (interactive) 
    (goto-char isearch-opoint)
    (insert (ja-isearch-current-match))
    (isearch-done)))

;; C-v C-v : paste isearch match as ruby string quoted var
(define-key isearch-paste-keymap (kbd "C-s")
  (lambda () (interactive) 
    (goto-char isearch-opoint)
    (insert (concat "#{" (ja-isearch-current-match) "}"))
    (isearch-done)))
