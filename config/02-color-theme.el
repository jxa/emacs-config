
(add-to-list 'load-path (emacswiki-path "color-theme-6.6.0"))
(add-to-list 'load-path (concat (emacswiki-path "color-theme-6.6.0") "/themes"))
(require 'color-theme)
(setq color-theme-load-all-themes nil)
(set-face-attribute 'default nil :height 140)

;;(require 'zenburn)
;;(zenburn)
(require 'color-theme-blackboard)
(color-theme-blackboard)
(set-face-attribute 'cursor  nil :background "#666")
(set-face-attribute 'cursor  nil :foreground "#fff")

;;(require 'color-theme-tangotango)
;;(color-theme-tangotango)
