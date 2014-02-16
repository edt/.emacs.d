(set-frame-font "Monospace-11" t t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(load-theme 'devel-tango t)

;; automatically start the debugger if something bad happens
(add-hook 'after-init-hook
          '(lambda () (setq debug-on-error t)))

;; load-path additions
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;; Save comstum stuff in own file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(require 'defaults)
(require 'setup-packages)

(defvar user-cache-directory (concat user-emacs-directory "tmp") "Directory for user specific caching.")

;; Assure needed directories are present
(make-directory user-cache-directory t)

;; Load the following configuration files
(require 'user_profile)
(require 'functions)
(require 'file-functions)
(require 'modes)
(require 'programming)
(require 'compilation)
(require 'keybindings)

(require 'setup-session)
(require 'setup-modeline)
(require 'setup-navigation)
(require 'setup-debugging)
(require 'setup-magit)

;; saner ediff default
(require 'ediff)
(add-hook 'ediff-before-setup-hook 'new-frame)
(add-hook 'ediff-quit-hook 'delete-frame)
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Highlight parenthesis pairs
(show-paren-mode 1)
;; Blinking parenthesis
(setq blink-matching-paren-distance nil)
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
;; auto-formatting in text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; Completion in mini-buffer
(icomplete-mode t)
;; Buffers in separate frames
(setq pop-up-frame t)

;; Use buffer name as frame title
(setq frame-title-format "Emacs - %b")

;; CxCb puts point on buffer list
(global-set-key "\C-x\C-b" 'buffer-menu)

;; Set grep command options
(setq grep-command "grep -i -nH -e ")

;; Color enabled
(global-font-lock-mode 1)
;; maximum possible fontification
;; not functioning
(setq font-lock-maximum-decoration t)

(blink-cursor-mode -1)

;; Increase number of undo
(setq undo-limit 100000)

(fringe-mode 4)

;========== Support Wheel Mouse Scrolling ==========
(mouse-wheel-mode t)

(setq scroll-conservatively 10000)
;; scroll one line at a time (less "jumpy" than defaults)

;; one line at a time
(setq mouse-wheel-scroll-amount '(5 ((shift) . 1)))

;; don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)

;; scroll window under mouse
(setq mouse-wheel-follow-mouse 't)

;; keyboard scroll one line at a time
(setq scroll-step 1)

;; enable clipboard interaction between emacs and system
(setq x-select-enable-clipboard t)

;; Set Shell for M-| command
(setq shell-file-name "/bin/bash")

;; No message at startup
(setq inhibit-startup-message t)

(setq winner-dont-bind-my-keys t)
(winner-mode t)

;; replace highlighted text with what I type rather than just inserting at point
(delete-selection-mode t)

;; reindent region after pasting
(defadvice yank (after indent-region activate)
  (indent-region (region-beginning) (region-end) nil))

;; Sentences end with one space
(setq sentence-end-double-space nil)

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


;;; == Search & Destroy == ;;;
(setq search-highlight t)

(require 'setup-server)

(setq redisplay-dont-pause t)
