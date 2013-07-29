(set-frame-font "Monospace-10" t t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; http://www.chemie.fu-berlin.de/chemnet/use/info/elisp/elisp_16.html
;; automatically start the debugger if something bad happens
(add-hook 'after-init-hook
          '(lambda () (setq debug-on-error t)))

(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(add-to-list 'load-path "/home/edt/.emacs.d")
(add-to-list 'load-path "/home/edt/.emacs.d/lisp")

;; Save comstum stuff in own file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'setup-packages)
;; Load the following configuration files
(load "user_profile.el")
(load "functions.el")
(load "file-functions.el")
(load "modes.el")
(load "programming.el")
(load "compilation.el")
(load "keybindings.el")

(require 'setup-session)
(require 'setup-modeline)
(require 'setup-navigation)
(require 'setup-debugging)

(require 'projectile)
(setq projectile-enable-caching t)
(projectile-global-mode t)
(setq projectile-cache-file "~/.emacs.d/tmp/projectile.cache")
(setq projectile-known-projects-file
      "~/.emacs.d/tmp/projectile-bookmarks.eld")

;; (require 'autopair)
;; (autopair-global-mode 1)
;; (setq autopair-autowrap t)

(global-subword-mode t)
(require 'wgrep)
;; (require 'whole-line-or-region)
;; (whole-line-or-region-mode t)

;; Character encodings default to utf-8.
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; Define an alias
(defalias 'qrr 'query-replace-regexp)

;; Highlight parenthesis pairs
(show-paren-mode 1)
;; Blinking parenthesis
(setq blink-matching-paren-distance nil)
;; Show empty lines
(setq-default indicate-empty-lines t)
;; Cursor don't track end-of-line
(setq track-eol nil)
;; Paste at cursor position
(setq mouse-yank-at-point t)
;; Mouse avoids cursor
(mouse-avoidance-mode 'jump)
;; Don't truncate long lines
(setq truncate-partial-width-windows nil)
;; No beep when reporting errors
(setq visible-bell t)
;; Minimal height of windows
(setq window-min-height 10)
;; Text-mode is default mode
(setq default-major-mode 'text-mode)
;; auto-formatting in text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)
;; Completion in mini-buffer
(icomplete-mode t)
;; Buffers in separate frames
(setq pop-up-frame t)
;; Use buffer name as frame title
(setq frame-title-format "%b - emacs")
;; CxCb puts point on buffer list
(global-set-key "\C-x\C-b" 'buffer-menu)
;; Stack  minibuffers
(setq enable-recursive-minibuffers t)

(winner-mode t)                                ;
 ;(setq confirm-kill-emacs 'yes-or-no-p)          ; Confirm quit

(setq grep-command "grep -i -nH -e ")          ; Set grep command options

(setq ps-paper-type 'a4)                       ; Specify printing format
(setq-default case-fold-search t)              ; Search is case sensitive

;; http://hustoknow.blogspot.de/2011/05/removing-trailing-whitespace-in-emacs.html
;; delete trailing whitespaces before saving a file
;(add-hook 'before-save-hook '(delete-trailing-whitespace (untabify start end))

;; Color enabled
(global-font-lock-mode 1)
;; maximum possible fontification
;; not functioning
(setq font-lock-maximum-decoration t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                    GENERAL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;; uniquify ;;;;;
;; give buffers more intelligent names.
;; standard emacs/xemacs package.
(require 'uniquify)
; create unique buffer names with shared directoy components.
(setq uniquify-buffer-name-style 'forward)
;(setq uniquify-buffer-name-style 'reverse)

;;;;;;;;;;;;;;;;;;; Appearance ;;;;;;;;;;;;;;;;;;;

(require 'color-theme)
(load "my-color-theme.el")
(my-color-theme )

;; No blinking cursor
(blink-cursor-mode 0)
;;;;;;;;;;;;;;;;;;;;== Menu ==;;;;;;;;;;;;;;;;;;;;

;; Increase number of undo
(setq undo-limit 100000)

; Week starts monday
(setq calendar-week-start-day 1)

; European style calendar
(setq european-calendar-style 't)

;;;;;;;;;;;;;;;;;;;;; Behavior ;;;;;;;;;;;;;;;;;;;

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

;; Set Shell used by TeX
(setq tex-shell-file-name "/bin/bash")

;; No message at startup
(setq inhibit-startup-message t)

;;;;;;;;;;;;;;;;;;;== Editing ==;;;;;;;;;;;;;;;;;;

(setq next-line-add-newlines nil)                ; no new line at the end of file during scrolling
(delete-selection-mode t)                        ; replace highlighted text with what I type rather than just inserting at point

;; Set standard indent to 4
(setq standard-indent 4)

;; Length of tab is 4 SPC
(setq tab-width 4)

(setq-default standard-indent 4)
;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)
;; Sentences end with one space
(setq sentence-end-double-space nil)

;; == Backup == ;;
;; http://emacswiki.org/emacs/BackupDirectory
;; check if folder exists, and create if it doesn't
(unless (file-exists-p "~/.emacs.d/tmp/")
  (make-directory "~/.emacs.d/tmp/" 'parent))

;; make backups by copying
;; this prevents emacs from changing the creation time of the original file
(setq backup-by-copying t)

;; set directory for auto saved files
(setq auto-save-directory "~/.emacs.d/tmp/")

(setq backup-directory-alist
      `((".*" . ,"~/.emacs.d/tmp")))

;; always have an empty line at end of file
(setq require-final-newline t)

;;; == Search & Destroy == ;;;
(setq search-highlight t)
