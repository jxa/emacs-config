(add-to-list 'load-path (extern-path "anything-config"))
(require 'anything)
(require 'anything-config)
;; (require 'anything-etags)
(require 'anything-match-plugin)
(require 'anything-yaetags)
(require 'thing-cmds)

(setq anything-sources
      (list anything-c-source-buffers+
            anything-c-source-file-name-history
            anything-c-source-files-in-current-dir+
            anything-c-source-ffap-guesser
            anything-c-source-complex-command-history
            ;; anything-c-source-ctags
            ;; anything-c-source-etags-select
            anything-c-source-yaetags-select
            anything-c-source-kill-ring
            anything-c-source-fixme
            anything-c-source-locate))
