

;; Character encodings default to utf-8.
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)


;; Define an alias
(defalias 'qrr 'query-replace-regexp)
;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)

(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Stack  minibuffers
(setq enable-recursive-minibuffers t)

;; Blinking parenthesis
(setq blink-matching-paren-distance nil)

;; Completion in mini-buffer
(icomplete-mode t)
;; Buffers in separate frames
(setq pop-up-frame t)


;; Set grep command options
(setq grep-command "grep -i -nH -e ")

;; Increase number of undo
;; (setq undo-limit 100000)

(setq-default
 standard-indent 4
 tab-width 4
 indent-tabs-mode nil
 case-fold-search t
 indicate-empty-lines t
 fill-column 80
 next-line-add-newlines nil
 ;; truncate kill ring after 5000 entries
 kill-ring-max 5000
 ;;truncate mark ring after 5000 entries
 mark-ring-max 5000
 ;; always have an empty line at end of file
 require-final-newline t
 ;; No beep when reporting errors
 visible-bell t
 search-highlight t
 x-select-enable-clipboard t
 xterm-mouse-mode t)

;; Cursor don't track end-of-line
(setq track-eol nil)
;; Paste at cursor position
(setq mouse-yank-at-point t)
;; Mouse avoids cursor
(mouse-avoidance-mode 'jump)
;; Don't truncate long lines
(setq truncate-partial-width-windows nil)
;; Minimal height of windows
(setq window-min-height 10)

;; Sentences end with one space
(setq sentence-end-double-space nil)

;; Highlight parenthesis pairs
(show-paren-mode 1)

;; replace highlighted text with what I type rather than just inserting at point
(delete-selection-mode t)

;; keep display responsive
(setq redisplay-dont-pause t)

(fringe-mode 8)

;;no extra whitespace after lines
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'defaults)
