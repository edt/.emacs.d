(set-frame-font "Monospace-10" t t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;;------------------------------------------------------------------------------
;; el-get
;;------------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; Wenn el-get nicht geladen werden kann, lädt er die aktuelle (development)
;; Version herunter und installiert es.
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
       (lambda (s)
         (let (el-get-master-branch)
           (goto-char (point-max))
           (eval-print-last-sexp))))))

;; Hier die packages hinzufügen
;; Namen kann man im el-get repository nachschauen (recipes ordner)
;; Alternativ auch halt eigene recipes schreiben
(setq my-packages
      '(el-get
        color-theme
        smex
        highlight-symbol
        multiple-cursors
        ace-jump-mode
        yasnippet))

;; Initialisiere alles und so...
(el-get 'sync my-packages)

;;------------------------------------------------------------------------------


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

;; Load the following configuration files
(load "user_profile.el")
(load "functions.el")
(load "modes.el")
(load "programming.el")
(load "compilation.el")
(load "keybindings.el")

;; directories for .emacs.desktop and .emacs.desktop.lock files
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")

;; Define an alias
(defalias 'qrr 'query-replace-regexp)
;; Color enabled
(global-font-lock-mode 1)
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

;; Remove games menu
(define-key menu-bar-tools-menu [games] nil)

;; Allow narrow-to-region command
(put 'narrow-to-region  'disabled nil)
;; Allow all disabled commands
(setq disabled-command-hook nil)

;; Increase number of undo
(setq undo-limit 100000)

;;;;;;;;;;;;;;;;;;== Modeline ==;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;; Behavior ;;;;;;;;;;;;;;;;;;;

;; ========== Support Wheel Mouse Scrolling ==========
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
;; Save session before quitting
(desktop-save-mode t)

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
