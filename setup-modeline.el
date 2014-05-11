
;; Show date and time in 24h format in modeline
(setq display-time-day-and-date nil)
(setq display-time-24hr-format nil)
(display-time-mode -1)

(require 'calendar)

;; Week starts monday
(setq calendar-week-start-day 1)

;; European style calendar
(calendar-set-date-style 'european)

(setq column-number-mode t)

;; display file-size
(setq size-indication-mode t)

(require 'smart-mode-line)

(setq sml/name-width 30)
(setq sml/mode-width 20)
(setq sml/shorten-directory t)
(setq sml/shorten-modes t)
(setq sml/mode-width 'full)

(add-to-list 'sml/hidden-modes " Rbow")
(add-to-list 'sml/hidden-modes " Projectile")
(add-to-list 'sml/hidden-modes " ,")
(add-to-list 'sml/hidden-modes " SP")
(add-to-list 'sml/hidden-modes " hs")
(add-to-list 'sml/hidden-modes " MRev")
(add-to-list 'sml/hidden-modes " yas")
(add-to-list 'sml/hidden-modes " ing")
(add-to-list 'sml/hidden-modes " Guide")
(add-to-list 'sml/hidden-modes " AC")

(sml/setup)

(provide 'setup-modeline)
