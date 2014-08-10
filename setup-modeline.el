
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

(use-package smart-mode-line
  :init
  (progn
    (setq sml/name-width 30)
    (setq sml/mode-width 20)
    (setq sml/shorten-directory t)
    (setq sml/shorten-modes t)
    (setq sml/mode-width 'full)
    (sml/setup)))

(provide 'setup-modeline)
