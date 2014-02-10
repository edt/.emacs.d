

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


(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Stack  minibuffers
(setq enable-recursive-minibuffers t)

(global-subword-mode t)


(setq-default
 standard-indent 4
 tab-width 4
 indent-tabs-mode nil
 case-fold-search t
 indicate-empty-lines t
 fill-column 80
 next-line-add-newlines nil
 ;; always have an empty line at end of file
 require-final-newline t
 ;; No beep when reporting errors
 visible-bell t)


(provide 'defaults)
