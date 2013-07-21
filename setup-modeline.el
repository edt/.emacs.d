
;; diminish minor modes to save space
;; to view all minor modes C-h m
(when (require 'diminish nil 'noerror)
  (eval-after-load "company"
      '(diminish 'company-mode "Cmp"))
  (eval-after-load "abbrev"
    '(diminish 'abbrev-mode "Ab"))
  (eval-after-load "yasnippet"
    '(diminish 'yas-minor-mode "Y"))
  (eval-after-load "Projectile"
    '(diminish 'projectile-mode "P")))

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
