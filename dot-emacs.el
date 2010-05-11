;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; load configuration files
;; adapted from jim weirich's load-ini.el
(setq ja-config-dir "~/.emacs.d/config")
(let ((files (directory-files ja-config-dir t "^.*\\.el$")))
  (while (not (null files))
    (load-file (car files))
    (setq files (cdr files))))

;; Beginning of the el4r block:
;; RCtool generated this block automatically. DO NOT MODIFY this block!
(add-to-list 'load-path "/usr/share/emacs/site-lisp")

;; (require 'el4r)
;; (el4r-boot)

;; End of the el4r block.
;; User-setting area is below this line.

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(comint-process-echoes t)
 '(face-font-family-alternatives (quote (("Monaco" "Bitstream Vera Sans Mono") ("arial black" "arial" "DejaVu Sans") ("arial" "DejaVu Sans") ("verdana" "DejaVu Sans"))))
 '(font-lock-keywords-case-fold-search t t)
 '(global-font-lock-mode t nil (font-lock))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(js2-basic-offset 2)
 '(large-file-warning-threshold nil)
 '(show-trailing-whitespace t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3f3f3f" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Monaco"))))
 '(erc-notice-face ((t (:foreground "SlateBlue" :weight light :height 0.7)))))

