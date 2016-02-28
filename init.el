
(setq gc-cons-threshold 100000000)

(set-frame-font "Monospace-11" t t)

(blink-cursor-mode -1)
(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(load-theme 'devel-tango t)

;; automatically start the debugger if something bad happens
(add-hook 'after-init-hook
          '(lambda () (setq debug-on-error t)))

;; load-path additions
(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;; Save comstum stuff in own file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(require 'defaults)
(require 'setup-packages)

(defvar user-cache-directory (concat user-emacs-directory "tmp") "Directory for user specific caching.")

;; Assure needed directories are present
(make-directory user-cache-directory t)

(require 'use-package)

(global-unset-key (kbd "C-z"))
(define-prefix-command 'user-shortcut-map)
(global-set-key (kbd "C-z") 'user-shortcut-map)

;; Load the following configuration files
(require 'functions)
(require 'file-functions)

(require 'keybindings)
(require 'modes)
(require 'programming)
(require 'compilation)

(require 'setup-session)
(require 'setup-modeline)
(require 'setup-navigation)
(require 'setup-debugging)
(require 'setup-org)

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

;; Set Shell for M-| command
(setq shell-file-name "/bin/bash")

(setq winner-dont-bind-my-keys t)
(winner-mode t)

;; reindent region after pasting
(defadvice yank (after indent-region activate)
  (indent-region (region-beginning) (region-end) nil))

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

(require 'setup-server)
