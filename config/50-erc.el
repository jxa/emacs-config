(defconst ja/erc-interesting-people
  '("dan" "ch0wda" "zak" "z" "z1" "jschairb" "jschairb_" 
    "josh" "alfred" "philo" "rellik" "patrick"
    "paul" "pizzle" "pinky" "brain" "thebrain" "the_real" 
    "busie" "Busie"))

(defun ja/interesting-person? (person)
  (if person
      (some #'(lambda (interesting-person)
                (string-match interesting-person person))
            ja/erc-interesting-people)
    nil))

(defun ja/erc-notify (msg)
  (with-match-subs "^<\\(.+?\\)>" msg person
                   (if (ja/interesting-person? person)
                       (todochiku-message person msg ""))))
                   
(add-hook 'erc-insert-pre-hook #'ja/erc-notify)
