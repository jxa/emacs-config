(add-hook 'ruby-mode-hook
          '(lambda ()
             (progn
               (define-key ruby-mode-map (kbd "M-r") 'rspec-run-example-drb)
               (define-key ruby-mode-map (kbd "M-R") 'rspec-run-file-drb)
               (define-key ruby-mode-map (kbd "M-t") 'rspec-run-last-command))))
               