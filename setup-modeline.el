
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

;; custom settings for the modeline

(setq my-mode-line-buffer-name
      ;; the buffer name; the file name as a tool tip
      (list
       '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                           'help-echo (buffer-file-name)))
       ))

(setq my-mode-line-position
      ;; line and column
      (list
       ;; '%02' to set to 2 chars at least; prevents flickering
       (propertize "%02l" 'face 'font-lock-type-face) ","
       (propertize "%02c" 'face 'font-lock-type-face)
       ))

(setq my-modeline-major-mode
      ;; major modes
      (list
       '(:eval (propertize "%m" 'face 'font-lock-string-face
                           'help-echo buffer-file-coding-system))
       '("" mode-line-process)
       ))

(setq my-modeline-minor-modes
      ;; list of minor modes
      (list
       minor-mode-alist  ;; list of minor modes
       ))

(setq my-modeline-file-status
      ;; is it read only, modified, etc.
      (list
       "[" ;; insert vs overwrite mode, input-method in a tooltip
       '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                           'face 'font-lock-preprocessor-face
                           'help-echo (concat "Buffer is in "
                                              (if overwrite-mode "overwrite" "insert") " mode")))

       ;; was this buffer modified since the last save?
       '(:eval (when (buffer-modified-p)
                 (concat ","  (propertize "Mod"
                                          'face 'font-lock-warning-face
                                          'help-echo "Buffer has been modified"))))

       ;; is this buffer read-only?
       '(:eval (when buffer-read-only
                 (concat ","  (propertize "RO"
                                          'face 'font-lock-type-face
                                          'help-echo "Buffer is read-only"))))
       "]"))

;; use setq-default to set it for /all/ modes
(setq-default mode-line-format
              (list
               "  "
               my-mode-line-buffer-name
               " ["
               my-mode-line-position
               "]"
               ;; relative position, size of file
               "["
               (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
               "/"
               (propertize "%I" 'face 'font-lock-constant-face) ;; size
               "]-["
               my-modeline-major-mode
               "]["
               my-modeline-minor-modes
               "] - "
               my-modeline-file-status

               " -- "
               ;; add the time, with the date and the emacs uptime in the tooltip
               '(:eval (propertize (format-time-string "%H:%M")
                                   'help-echo
                                   (concat (format-time-string "%c; ")
                                           (emacs-uptime "Uptime:%hh"))))

               " %-" ;; fill with '-'
               ))

(provide 'setup-modeline)
