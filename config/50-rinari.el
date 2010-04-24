(add-to-list 'load-path (extern-path "rinari"))
(require 'rinari)

(setq rinari-tags-file-name "TAGS")

;; (setf
;;  rinari-jump-schema
;;  '((model
;;     "m"
;;     (("app/controllers/\\1_controller.rb#\\2"  . "app/models/\\1.rb#\\2")
;;      ("app/views/\\1/.*"                       . "app/models/\\1.rb")
;;      ("app/helpers/\\1_helper.rb"              . "app/models/\\1.rb")
;;      ("db/migrate/.*create_\\1.rb"             . "app/models/\\1.rb")
;;      ("spec/models/\\1_spec.rb"                . "app/models/\\1.rb")
;;      ("spec/controllers/\\1_controller_spec.rb". "app/models/\\1.rb")
;;      ("spec/views/\\1/.*"                      . "app/models/\\1.rb")
;;      ("spec/fixtures/\\1.yml"                  . "app/models/\\1.rb")
;;      (t                                        . "app/models/"))
;;     (lambda (path)
;;       (rinari-generate "model"
;; 		       (and (string-match ".*/\\(.+?\\)\.rb" path)
;; 			    (match-string 1 path)))))
;;    (controller
;;     "c"
;;     (("app/models/\\1.rb"                      . "app/controllers/\\1_controller.rb")
;;      ("app/views/\\1/\\2\\..*"                 . "app/controllers/\\1_controller.rb#\\2")
;;      ("app/helpers/\\1_helper.rb"              . "app/controllers/\\1_controller.rb")
;;      ("db/migrate/.*create_\\1.rb"             . "app/controllers/\\1_controller.rb")
;;      ("spec/models/\\1_spec.rb"                . "app/controllers/\\1_controller.rb")
;;      ("spec/controllers/\\1_spec.rb"           . "app/controllers/\\1.rb")
;;      ("spec/views/\\1/\\2\\.*_spec.rb"         . "app/controllers/\\1_controller.rb#\\2")
;;      ("spec/fixtures/\\1.yml"                  . "app/controllers/\\1_controller.rb")
;;      (t                                        . "app/controllers/"))
;;     (lambda (path)
;;       (rinari-generate "controller"
;; 		       (and (string-match ".*/\\(.+?\\)_controller\.rb" path)
;; 			    (match-string 1 path)))))
;;    (view
;;     "v"
;;     (("app/models/\\1.rb"                      . "app/views/\\1/.*")
;;      ((lambda () ;; find the controller/view
;; 	(let* ((raw-file (and (buffer-file-name)
;; 			      (file-name-nondirectory (buffer-file-name))))
;; 	       (file (and raw-file
;; 			  (string-match "^\\(.*\\)_controller.rb" raw-file)
;; 			  (match-string 1 raw-file))) ;; controller
;; 	       (raw-method (ruby-add-log-current-method))
;; 	       (method (and file raw-method ;; action
;; 			    (string-match "#\\(.*\\)" raw-method)
;; 			    (match-string 1 raw-method))))
;; 	  (if (and file method) (rinari-follow-controller-and-action file method))))
;;       . "app/views/\\1/\\2.*")
;;      ("app/controllers/\\1_controller.rb"      . "app/views/\\1/.*")
;;      ("app/helpers/\\1_helper.rb"              . "app/views/\\1/.*")
;;      ("db/migrate/.*create_\\1.rb"             . "app/views/\\1/.*")
;;      ("spec/models/\\1_spec.rb"                . "app/views/\\1/.*")
;;      ("spec/controllers/\\1_spec.rb"           . "app/views/\\1/.*")
;;      ("spec/views/\\1/\\2_spec.rb"             . "app/views/\\1/\\2.*")
;;      ("spec/fixtures/\\1.yml"                  . "app/views/\\1/.*")
;;      (t                                        . "app/views/.*"))
;;     t)
;;    (test
;;     "t"
;;     (("app/models/\\1.rb#\\2"                  . "test/unit/\\1_test.rb#test_\\2")
;;      ("app/controllers/\\1.rb#\\2"             . "test/functional/\\1_test.rb#test_\\2")
;;      ("app/views/\\1/_?\\2\\..*"               . "test/functional/\\1_controller_test.rb#test_\\2")
;;      ("app/helpers/\\1_helper.rb"              . "test/functional/\\1_controller_test.rb")
;;      ("db/migrate/.*create_\\1.rb"             . "test/unit/\\1_test.rb")
;;      (t                                        . "test/.*"))
;;     t)
;;    (rspec
;;     "r"
;;     (("app/\\1\\.rb"                           . "spec/\\1_spec.rb")
;;      ("app/\\1"                                . "spec/\\1_spec.rb")
;;      ("spec/views/\\1_spec.rb"                 . "app/views/\\1")
;;      ("spec/\\1_spec.rb"                       . "app/\\1.rb")
;;      (t                                        . "spec/.*"))
;;     t)
;;    (fixture
;;     "x"
;;     (("app/models/\\1.rb"                      . "test/fixtures/\\1.yml")
;;      ("app/controllers/\\1_controller.rb"      . "test/fixtures/\\1.yml")
;;      ("app/views/\\1/.*"                       . "test/fixtures/\\1.yml")
;;      ("app/helpers/\\1_helper.rb"              . "test/fixtures/\\1.yml")
;;      ("db/migrate/.*create_\\1.rb"             . "test/fixtures/\\1.yml")
;;      ("spec/models/\\1_spec.rb"                . "test/fixtures/\\1.yml")
;;      ("spec/controllers/\\1_controller_spec.rb". "test/fixtures/\\1.yml")
;;      ("spec/views/\\1/.*"                      . "test/fixtures/\\1.yml")
;;      (t                                        . "test/fixtures/"))
;;     t)
;;    (rspec-fixture
;;     "z"
;;     (("app/models/\\1.rb"                      . "spec/fixtures/\\1.yml")
;;      ("app/controllers/\\1_controller.rb"      . "spec/fixtures/\\1.yml")
;;      ("app/views/\\1/.*"                       . "spec/fixtures/\\1.yml")
;;      ("app/helpers/\\1_helper.rb"              . "spec/fixtures/\\1.yml")
;;      ("db/migrate/.*create_\\1.rb"             . "spec/fixtures/\\1.yml")
;;      ("spec/models/\\1_spec.rb"                . "spec/fixtures/\\1.yml")
;;      ("spec/controllers/\\1_controller_spec.rb". "spec/fixtures/\\1.yml")
;;      ("spec/views/\\1/.*"                      . "spec/fixtures/\\1.yml")
;;      (t                                        . "spec/fixtures/"))
;;     t)
;;    (helper
;;     "h"
;;     (("app/models/\\1.rb"                      . "app/helpers/\\1_helper.rb")
;;      ("app/controllers/\\1_controller.rb"      . "app/helpers/\\1_helper.rb")
;;      ("app/views/\\1/.*"                       . "app/helpers/\\1_helper.rb")
;;      ("app/helpers/\\1_helper.rb"              . "app/helpers/\\1_helper.rb")
;;      ("db/migrate/.*create_\\1.rb"             . "app/helpers/\\1_helper.rb")
;;      ("spec/models/\\1_spec.rb"                . "app/helpers/\\1_helper.rb")
;;      ("spec/controllers/\\1_spec.rb"           . "app/helpers/\\1_helper.rb")
;;      ("spec/views/\\1/.*"                      . "app/helpers/\\1_helper.rb")
;;      (t                                        . "app/helpers/"))
;;     t)
;;    (migration
;;     "i"
;;     (("app/controllers/\\1_controller.rb"      . "db/migrate/.*create_\\1.rb")
;;      ("app/views/\\1/.*"                       . "db/migrate/.*create_\\1.rb")
;;      ("app/helpers/\\1_helper.rb"              . "db/migrate/.*create_\\1.rb")
;;      ("app/models/\\1.rb"                      . "db/migrate/.*create_\\1.rb")
;;      ("spec/models/\\1_spec.rb"                . "db/migrate/.*create_\\1.rb")
;;      ("spec/controllers/\\1_spec.rb"           . "db/migrate/.*create_\\1.rb")
;;      ("spec/views/\\1/.*"                      . "db/migrate/.*create_\\1.rb")
;;      (t                                        . "db/migrate/"))
;;     (lambda (path)
;;       (rinari-generate "migration"
;; 		       (and (string-match ".*create_\\(.+?\\)\.rb" path)
;; 			    (match-string 1 path)))))
;;    (environment "e" ((t . "config/environments/")) nil)
;;    (configuration "n" ((t . "config/")) nil)
;;    (script "s" ((t . "script/")) nil)
;;    (lib "l" ((t . "lib/")) nil)
;;    (log "o" ((t . "log/")) nil)
;;    (worker "w" ((t . "lib/workers/")) nil)
;;    (public "p" ((t . "public/")) nil)
;;    (stylesheet "y" ((t . "public/stylesheets/.*")) nil)
;;    (javascript "j" ((t . "public/javascripts/.*")) nil)
;;    (plugin "u" ((t . "vendor/plugins/")) nil)
;;    (file-in-project "f" ((t . ".*")) nil)
;;    (by-context
;;     ";"
;;     (((lambda () ;; Find-by-Context
;; 	(let ((path (buffer-file-name))
;; 	      cv)
;; 	  (when (string-match ".*/\\(.+?\\)/\\(.+?\\)\\..*" path)
;; 	    (setf cv (cons (match-string 1 path) (match-string 2 path)))
;; 	    (when (re-search-forward "<%=[ \n\r]*render(? *" nil t)
;; 	      (setf cv (rinari-ruby-values-from-render (car cv) (cdr cv)))
;; 	      (list (car cv) (cdr cv))))))
;;       . "app/views/\\1/\\2.*")))))