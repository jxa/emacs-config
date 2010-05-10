;; put scroll bar on right
(set-scroll-bar-mode 'right)

;; frame title bar formatting to show full path to file
(setq-default
 frame-title-format
 (list
  '((buffer-file-name
     " %f"
     (dired-directory
      dired-directory
      (revert-buffer-function
       " %b"
       ("%b - Dir:  " default-directory)))))))

;; allow line-wrap with vertical windows
(setq truncate-partial-width-windows nil)

; No line wrap by default
(set 'default-truncate-lines t)

;; enable ocpy / paste from other applications
(setq x-select-enable-clipboard t)

;; use y instead of yes
(fset 'yes-or-no-p 'y-or-n-p)

;; use spaces when indenting code
(setq-default indent-tabs-mode nil)

;; dired should offer to recursively copy folders
(setq dired-recursive-copies t)

;; don't have to C-k twice to delete the whole line
(setq kill-whole-line t)

;; tilde-files should go to a different dir
(setq backup-directory-alist '(("." . "/tmp/emacs/")))

;; this fixes a bug in isearch replace - it doesn't replace current selection
;; Move cursor to beginning of match after search
(add-hook 'isearch-mode-end-hook 'isearch-goto-beginning-after-finished)
(defun isearch-goto-beginning-after-finished ()
  (when (and isearch-forward isearch-success)
  (goto-char isearch-other-end)))

;; turn off the toolbar
(tool-bar-mode -1)

;; enable ido mode
(ido-mode 1)

;; record changes in window configuration to allow undo/redo
;; with C-c left (undo) and C-c right (redo)
(winner-mode 1)

(defun other-window-backward ()
  "Select the previous window."
  (interactive)
  (other-window -1))

(defun toggle-fullscreen () 
  (interactive) 
  (if (frame-parameter nil 'fullscreen)
      (do-fullscreen)
    (undo-fullscreen)))
      

(defun undo-fullscreen()
  (progn
    (set-frame-parameter nil 'fullscreen nil)
    (if (frame-parameter nil 'jandrews-previous-x)
        (progn
          (set-frame-size (selected-frame) 
                          (frame-parameter nil 'jandrews-previous-x)
                          (frame-parameter nil 'jandrews-previous-y))))))

(defun do-fullscreen ()
  (progn
    (set-frame-parameter nil 'jandrews-previous-x (frame-pixel-width))
    (set-frame-parameter nil 'jandrews-previous-y (frame-pixel-height))
    (set-frame-parameter nil 'fullscreen 'fullboth)))

;; show current column
(column-number-mode 1)

(defun generate-tags (tagfile)
  (interactive "DTag Dir:")
  (let* ((dir (file-name-directory tagfile))
         (cmd (concat "cd " dir " && etags -R -o TAGS 2>/dev/null")))
    (message "TAGS command: %s" cmd)
    (shell-command cmd)
    (visit-tags-table tagfile)))

