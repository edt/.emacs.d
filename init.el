
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq gc-cons-threshold 100000000)

(set-frame-font "Monospace-11" t t)

(blink-cursor-mode -1)
(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; automatically start the debugger if something bad happens
(add-hook 'after-init-hook
          '(lambda () (setq debug-on-error t)))

;; load-path additions
(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;; Save comstum stuff in own file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)


(defvar user-cache-directory (concat user-emacs-directory "tmp") "Directory for user specific caching.")

;; Assure needed directories are present
(make-directory user-cache-directory t)

;; load-path additions
(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;; needed for use-package diminish feature
(use-package diminish
  :ensure t)


(use-package tangotango-theme
  :ensure t
  :load-path "themes"
  :config
  (load-theme 'tangotango t)
  )


(global-unset-key (kbd "C-z"))
(define-prefix-command 'user-shortcut-map)
(global-set-key (kbd "C-z") 'user-shortcut-map)

;;
;; previous defaults.el
;;

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

;; Set grep command options
(setq grep-command "grep -i -nH -e ")

;; Increase number of undo
(setq undo-limit 100000000)
(setq-default
 ; standard-indent 4
 tab-width 4
 indent-tabs-mode nil
 ; case-fold-search t ;; now default
 indicate-empty-lines t
 fill-column 120
 next-line-add-newlines nil
 ;; truncate kill ring after 5000 entries
 kill-ring-max 50000
 ;;truncate mark ring after 5000 entries
 mark-ring-max 50000
 ;; always have an empty line at end of file
 require-final-newline t
 ;; No beep when reporting errors
 ;visible-bell t
 search-highlight t
)



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



(require 'modes)
(require 'languages)
(require 'setup-session)
(require 'file-functions)
(require 'functions)

;; the t parameter apends to the hook, instead of prepending
;; this means it'd be run after other hooks that might fiddle
;; with the frame size
;(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(savehist-mode t)

;; make backups by copying
;; this prevents emacs from changing the creation time of the original file
(setq backup-by-copying t)
;; set directory for auto saved files
(setq auto-save-directory user-cache-directory)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . , user-cache-directory)))
(setq auto-save-file-name-transforms
      `((".*" , user-cache-directory t)))

;; Move between windows with META - direction
(require 'windmove)
(global-set-key (kbd "M-<left>")  'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>")    'windmove-up)
(global-set-key (kbd "M-<down>")  'windmove-down)

;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") 'split-window-below)
(global-set-key (kbd "C-3") 'split-window-right)
(global-set-key (kbd "C-0") 'delete-window)


(global-set-key (kbd "C-x p") 'pop-to-mark-command)
(setq set-mark-command-repeat-pop t)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; define meta-shift-t as a reverse transpose to switch words backwards
(global-set-key (kbd "M-T") (lambda () (interactive) (transpose-words -1)))

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; copy line or region
(global-set-key (kbd "C-z d") 'duplicate-line-or-region)

;;make delete button actually delete
(global-set-key [delete] 'delete-char)

;; (use-package amx
;;   :ensure t
;;   :init
;;   (amx-mode t))

;; (use-package ido
;;   :ensure t
;;   :init
;;   (progn
;;     (setq ido-enable-flex-matching t)
;;     (setq ido-everywhere t)
;;     (setq ido-max-directory-size 1000000)
;;     (setq ido-default-buffer-method 'selected-window)
;;     (setq ido-save-directory-list-file "~/.emacs.d/tmp/ido.last")
;;     )
;;   :config
;;   (progn
;;     (use-package ido-completing-read+
;;       :ensure t
;;       :config
;;       (ido-ubiquitous-mode t))

;;     ;; (use-package ido-grid-mode
;;     ;;   :config
;;     ;;   (ido-grid-mode t))
;;     (ido-mode t)

;;     ))


(use-package flycheck
  :ensure t
  :defer t
  :init
  (progn
    (global-flycheck-mode)
    ;; disable the annoying doc checker
    ;; (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
    (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
    (add-hook 'c-mode-hook (lambda () (setq flycheck-clang-language-standard "c99")))))

(use-package symbol-overlay
  :ensure t
  :commands (symbol-overlay-mode)
  :diminish
  :config
  (global-set-key (kbd "M-i") 'symbol-overlay-put)
  (global-set-key (kbd "<f7>") 'symbol-overlay-mode)
  (global-set-key (kbd "<f8>") 'symbol-overlay-remove-all))


;; (use-package symbol-overlay             ; Highlight symbols
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "M-i") 'symbol-overlay-put)
;;   (global-set-key (kbd "<f7>") 'symbol-overlay-mode)
;;   (global-set-key (kbd "<f8>") 'symbol-overlay-remove-all)
;;   )

(require 'server)

;; start server when not running
(if (and (fboundp 'server-running-p)
         (not (server-running-p)))
    (server-start))

;; In server mode, C-x C-c delete frame
(when (or (daemonp)
          server-mode)
  (global-set-key "\C-x\C-c" 'delete-frame))

;; Shortcut to kill emacs and server/deamon
(global-set-key (kbd "C-z C-q") (lambda ()
                                  (interactive)
                                  (when (y-or-n-p "Quit Emacs?")
                                    (save-buffers-kill-emacs))))
