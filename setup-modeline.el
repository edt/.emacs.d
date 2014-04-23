
;; diminish minor modes to save space
;; to view all minor modes C-h m
(when (require 'diminish nil 'noerror)
  (eval-after-load "company"
    '(diminish 'company-mode "Cmp"))
  (eval-after-load "abbrev"
    '(diminish 'abbrev-mode "Ab"))
  (eval-after-load "yasnippet"
    '(diminish 'yas-minor-mode))
  (eval-after-load "Projectile"
    '(diminish 'projectile-mode))
  (eval-after-load "smartparens"
    '(diminish 'smartparens-mode))
  )

;; Show date and time in 24h format in modeline
(setq display-time-day-and-date nil)
(setq display-time-24hr-format nil)
(display-time-mode -1)

;; Week starts monday
(setq calendar-week-start-day 1)

;; European style calendar
(calendar-set-date-style 'european)

(setq column-number-mode t)

;; display file-size
(setq size-indication-mode t)

;; (require 'smart-mode-line)
(setq sml/name-width 40)
(setq sml/mode-width 20)

(setq sml/theme 'respectful)
(setq sml/active-background-color "gray20")
(require 'smart-mode-line)
(sml/setup)

(provide 'setup-modeline)
