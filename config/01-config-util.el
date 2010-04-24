(setq ja-extern-dir "~/.emacs.d/ext/")
(setq ja-emacswiki-dir "~/.emacs.d/emacswiki/")

(add-to-list 'load-path ja-emacswiki-dir)

(defun extern-path (path)
  "return full path to external library which is under version control"
  (concat ja-extern-dir path))

(defun emacswiki-path (path)
  "return path to library acquired from emacswiki"
  (concat ja-emacswiki-dir path))