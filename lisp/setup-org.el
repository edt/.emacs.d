

(require 'org)
(require 'org-clock)


(setq org-src-fontify-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t))) ; this line activates dot


;; save clock history across sessions
(setq org-log-done 'time)
(setq org-clock-persist t)
(org-clock-persistence-insinuate)
(setq org-clock-report-include-clocking-task t)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(global-set-key (kbd "C-z j") 'org-clock-goto)
(global-set-key (kbd "C-c a") 'org-agenda)
(use-package org
  :mode ("\\.\\(org\\|org_archive\\)\\'" . org-mode)
  :bind (("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb)
         ("C-c c" . org-capture))
  :init
  (setq org-M-RET-may-split-line nil
        org-agenda-files '("~/org/")
        org-agenda-include-diary t
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled
        org-agenda-skip-scheduled-if-deadline-is-shown 'repeated-after-deadline
        org-agenda-skip-scheduled-if-done t

        org-catch-invisible-edits 'error
        org-completion-use-ido t
        org-enforce-todo-dependencies t
        org-fast-tag-selection-single-key t
        org-use-fast-todo-selection t
        ;; allows changing todo states with S-left and S-right skipping all of the normal
        ;; processing when entering or leaving a todo state.
        ;; This cycles through the todo states but skips setting timestamps and entering
        ;; notes which is very convenient when all you want to do is fix up the status of an entry.
        org-treat-S-cursor-todo-selection-as-state-change nil

        org-image-actual-width 800
        org-log-done 'time
        org-log-into-drawer t
        org-return-follows-link t
        org-startup-indented t
        org-stuck-projects '("+PROJECT" ("NEXT") () "")
        org-tags-exclude-from-inheritance '("PROJECT")
        org-todo-repeat-to-state "NEXT"

        org-todo-keywords
        '((sequence "SOMEDAY(s!)" "TODO(t!)" "NEXT(n!)" "WAITING(w@/!)" "HOLD(h@\!)"
                    "|" "DONE(d!)" "CANCELED(c@!)"))

        org-todo-keyword-faces
        '(("SOMEDAY" :foreground "sky blue" :weight bold)
          ("TODO" :foreground "royal blue" :weight bold)
          ("NEXT" :foreground "red4" :weight bold)
          ("WAITING" :foreground "yellow3" :weight bold)
          ("HOLD" :foreground "orange2" :weight bold)
          ("DONE" :foreground "green3" :weight bold)
          ("CANCELED" :foreground "green4" :weight bold))

        org-tag-alist '((:startgroup)
                        ("@computer" . ?c)
                        ("@home" . ?h)
                        (:endgroup)
                        ("LEARN" . ?l)
                        ("MAIL" . ?m)
                        ("NOTE" . ?n)
                        ("PHONE" . ?p)
                        ("PROJECT" . ?P)
                        ("READ" . ?r)
                        ("WATCH" . ?w))

        org-agenda-custom-commands
        '(("h" "Habits" tags-todo "STYLE=\"habit\""
           ((org-agenda-overriding-header "Habits")))
          ("r" "Repeated Tasks" tags-todo "REPEATED"
           ((org-agenda-overriding-header "Repeated Tasks")))
          (" " "Agenda"
           ((agenda "" nil)
            (tags-todo "INBOX"
                       ((org-agenda-overriding-header "Inbox")))
            (tags-todo "-INBOX-REPEATED-STYLE=\"habit\"+TODO=\"NEXT\"-SCHEDULED={.}-DEADLINE={.}"
                       ((org-agenda-overriding-header "Next")))
            (tags-todo "-INBOX-REPEATED-STYLE=\"habit\"-TODO=\"NEXT\""
                       ((org-agenda-overriding-header "Tasks"))))))

        org-capture-templates
        '(("t" "Task" entry (file+headline "~/org/inbox.org" "Inbox")
           "* SOMEDAY %?\n:LOGBOOK:\n- State \"SOMEDAY\"    from \"\"           %U\n:END:")
          ("j" "Journal" plain (file+datetree+prompt "~/org/journal.org")
           "%?"))

        org-refile-targets '((nil :maxlevel . 9)
                             (org-agenda-files :maxlevel . 9))

        ;; Configure calendar
        calendar-week-start-day 1
        calendar-day-name-array
        ["Sonntag" "Montag" "Dienstag" "Mittwoch"
         "Donnerstag" "Freitag" "Samstag"]
        calendar-month-name-array
        ["Januar" "Februar" "März" "April" "Mai"
         "Juni" "Juli" "August" "September"
         "Oktober" "November" "Dezember"]
        solar-n-hemi-seasons
        '("Frühlingsanfang" "Sommeranfang" "Herbstanfang" "Winteranfang")

        ;; Configure holidays
        holiday-general-holidays
        '((holiday-fixed 1 1 "Neujahr")
          (holiday-fixed 2 14 "Valentinstag")
          (holiday-fixed 5 1 "Tag der Arbeit")
          (holiday-float 5 0 2 "Muttertag")
          (holiday-easter-etc +39 "Vatertag")
          (holiday-fixed 10 3 "Tag der Deutschen Einheit"))
        holiday-christian-holidays
        '((holiday-float 12 0 -4 "1. Advent" 24)
          (holiday-float 12 0 -3 "2. Advent" 24)
          (holiday-float 12 0 -2 "3. Advent" 24)
          (holiday-float 12 0 -1 "4. Advent" 24)
          (holiday-fixed 12 24 "Heiligabend")
          (holiday-fixed 12 25 "1. Weihnachtstag")
          (holiday-fixed 12 26 "2. Weihnachtstag")
          (holiday-easter-etc -2 "Karfreitag")
          (holiday-easter-etc +1 "Ostermontag")
          (holiday-easter-etc +39 "Christi Himmelfahrt")
          (holiday-easter-etc +50 "Pfingstmontag"))
        holiday-bahai-holidays nil
        holiday-hebrew-holidays nil
        holiday-islamic-holidays nil
        holiday-oriental-holidays nil
        holiday-solar-holidays
        '((solar-equinoxes-solstices)
          (holiday-sexp calendar-daylight-savings-starts
                        (format "Sommerzeit beginnt %s"
                                (solar-time-string
                                 (/ calendar-daylight-savings-starts-time
                                    (float 60))
                                 calendar-standard-time-zone-name)))
          (holiday-sexp calendar-daylight-savings-ends
                        (format "Winterzeit beginnt %s"
                                (solar-time-string
                                 (/ calendar-daylight-savings-ends-time
                                    (float 60))
                                 calendar-daylight-time-zone-name)))))
  :config
  (add-hook 'org-mode-hook
            (lambda ()
              (unbind-key "C-c [" org-mode-map)
              (unbind-key "C-c ]" org-mode-map)
              (add-to-list 'org-modules 'org-habit))))

(provide 'setup-org)
