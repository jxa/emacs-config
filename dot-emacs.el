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
(require 'el4r)
(el4r-boot)
;; End of the el4r block.
;; User-setting area is below this line.
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(comint-process-echoes t)
 '(erc-autojoin-channels-alist (quote (("irc.braintreeps.com" "#dev") ("irc.braintreeps.com" "#1337"))))
 '(erc-autojoin-mode t)
 '(erc-away-nickname "john|away")
 '(erc-nick "john")
 '(erc-nick-uniquifier "_")
 '(erc-port 56668)
 '(erc-prompt-for-password nil)
 '(erc-server "irc.braintreeps.com")
 '(erc-try-new-nick-p nil)
 '(erc-user-full-name "John Andrews")
 '(face-font-family-alternatives (quote (("Monaco" "Bitstream Vera Sans Mono") ("arial black" "arial" "DejaVu Sans") ("arial" "DejaVu Sans") ("verdana" "DejaVu Sans"))))
 '(font-lock-keywords-case-fold-search t t)
 '(global-font-lock-mode t nil (font-lock))
 '(js2-basic-offset 2)
 '(show-trailing-whitespace t)
 '(twit-follow-idle-interval 180)
 '(twit-new-tweet-hook (quote (twit-todochiku)))
 '(twit-pass "billywoo")
 '(twit-show-user-images t)
 '(twit-user "xandrews")
 '(twit-user-image-dir "~/.twit/images"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(erc-notice-face ((t (:foreground "SlateBlue" :weight light :height 0.7))))
 '(twit-title-face ((((background light)) (:background "DeepSkyBlue" :underline "PowderBlue" :box (:line-width 2 :color "DeepSkyBlue" :style 0))) (((background dark)) (:background "DeepSkyBlue" :underline "PowderBlue" :box (:line-width 2 :color "DeepSkyBlue" :style 0))) (t (:underline "white")))))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
