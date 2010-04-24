(add-to-list 'load-path (extern-path "rhtml"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))
(add-to-list 'auto-mode-alist '("\\.ot_html\\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\.erb$" . rhtml-mode))
