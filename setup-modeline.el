

;; Show date and time in 24h format in modeline
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time-mode 1)

; Week starts monday
(setq calendar-week-start-day 1)

; European style calendar
(setq european-calendar-style 't)

; display time
(setq column-number-mode t)
; display file-size
(setq size-indication-mode t)

(provide 'setup-modeline)
