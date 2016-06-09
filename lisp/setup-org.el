

(require 'org)
(require 'org-clock)


(setq org-src-fontify-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t))) ; this line activates dot

(setq org-agenda-files '("~/todo.org"))

;; save clock history across sessions
(setq org-log-done 'time)
(setq org-clock-persist t)
(org-clock-persistence-insinuate)
(setq org-clock-report-include-clocking-task t)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(global-set-key (kbd "C-z j") 'org-clock-goto)

(provide 'setup-org)
