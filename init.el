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
        yasnippet))

;; Initialisiere alles und so...
(el-get 'sync my-packages)

;;------------------------------------------------------------------------------


(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(add-to-list 'load-path "/home/edt/.emacs.d")
(add-to-list 'load-path "/home/edt/.emacs.d/lisp")

;; (add-to-list 'load-path
;;            "~/.emacs.d/plugins/yasnippet")

;; Save comstum stuff in own file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Load the following configuration files
(load "user_profile.el")
(load "modes.el")
(load "programming.el")
(load "keybindings.el")

;(require 'color-theme)

;; ========== Set key binding for GOTO
;(global-set-key "\C-l" 'goto-line)

(defalias 'qrr 'query-replace-regexp)          ; Define an alias
(global-font-lock-mode 1)                      ; Color enabled
(show-paren-mode 1)                            ; Highlight parenthesis pairs
(setq blink-matching-paren-distance nil)       ; Blinking parenthesis
;(setq show-paren-style 'expression)            ; Highlight text between parens

(setq-default indicate-empty-lines t)          ; Show empty lines
(setq track-eol nil)                           ; Cursor don't track end-of-line
(setq mouse-yank-at-point t)                   ; Paste at cursor position
;(setq scroll-preserve-screen-position nil)       ; Scroll without moving cursor
(mouse-avoidance-mode 'jump)                   ; Mouse avoids cursor
; (setq require-final-newline 't)                ; Always newline at end of file
 ;(setq next-line-add-newlines t)                ; Add newline when at buffer end
(setq truncate-partial-width-windows nil)      ; Don't truncate long lines
(setq visible-bell t)                          ; No beep when reporting errors
(setq window-min-height 10)                    ; Minimal height of windows
;; (setq auto-save-timeout 60)                    ; Autosave every minute
(setq default-major-mode 'text-mode)           ; Text-mode is default mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)  ; auto-formatting in text-mode
(defalias 'yes-or-no-p 'y-or-n-p)              ; y/n instead of yes/no
(icomplete-mode t)                             ; Completion in mini-buffer
(setq pop-up-frame t)                          ; Buffers in separate frames
(setq frame-title-format "%b - emacs")         ; Use buffer name as frame title
(global-set-key "\C-x\C-b" 'buffer-menu)       ; CxCb puts point on buffer list
(setq enable-recursive-minibuffers t)          ; Stack  minibuffers

(winner-mode t)                                ;
 ;(setq confirm-kill-emacs 'yes-or-no-p)          ; Confirm quit
 ;(setq ispell-dictionary "english")             ; Set ispell dictionary

 ;(global-unset-key "\C-x\C-v")                  ; Suppress a shortcut
(setq grep-command "grep -i -nH -e ")          ; Set grep command options
 
(setq ps-paper-type 'a4)                       ; Specify printing format
(setq-default case-fold-search t)              ; Search is case sensitive

 ;(require 'cl)                                  ; Use Common Lisp features
                                                ; Note: There are some problems
                                                ;  with this. It might be better
                                                ;  to just use it when compiling
                                                ; elisp files, see the elisp manual.

;; maximum possible fontification
;;not functioning
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


;;;;;;;;;;;;;;;;;;;;== Menu ==;;;;;;;;;;;;;;;;;;;;

(define-key menu-bar-tools-menu [games] nil)     ; Remove games menu

(scroll-bar-mode -1)
(tool-bar-mode -1)

 ;(add-to-list 'default-frame-alist '(font . "")); Change fonts
 (put 'narrow-to-region  'disabled nil)         ; Allow narrow-to-region command
 (setq disabled-command-hook nil)               ; Allow all disabled commands

 (setq undo-limit 100000)                       ; Increase number of undo
;(setq exec-path (append exec-path '("/bin")))  ; Change binary path

;;;;;;;;;;;;;;;;;;;== Editing ==;;;;;;;;;;;;;;;;;;

 (blink-cursor-mode 0)                           ; No blinking cursor

 ;(global-linum-mode t)                           ; Show line numbers

;;;;;;;;;;;;;;;;;;== Modeline ==;;;;;;;;;;;;;;;;;;

;; Show date and time in 24h format in modeline
;;(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time-mode 1)

(setq calendar-week-start-day 1)               ; Week starts monday
(setq european-calendar-style 't)              ; European style calendar

(setq column-number-mode t)                      ; display time
(setq size-indication-mode t)                    ; display file-size


     (defun fullscreen ()
       "Tells Window Manager to toggle fullscreen mode"
       (interactive)
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

(global-set-key [f11] 'fullscreen)

;;;;;;;;;;;;;;;;;;;;; Behavior ;;;;;;;;;;;;;;;;;;;

;; ========== Support Wheel Mouse Scrolling ==========
 (mouse-wheel-mode t)

(setq scroll-conservatively 10000)                   ; not found
;; scroll one line at a time (less "jumpy" than defaults)
    
(setq mouse-wheel-scroll-amount '(5 ((shift) . 1))) ;; one line at a time
    
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
    
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
    
(setq scroll-step 1) ;; keyboard scroll one line at a time


;; enable clipboard interaction between emacs and system
(setq x-select-enable-clipboard t)



(setq shell-file-name "/bin/bash")               ; Set Shell for M-| command
(setq tex-shell-file-name "/bin/bash")           ; Set Shell used by TeX



(setq inhibit-startup-message t)                 ; No message at startup
(desktop-save-mode t)                            ; Save session before quitting

;;;;;;;;;;;;;;;;;;;== Editing ==;;;;;;;;;;;;;;;;;;



(setq next-line-add-newlines nil)                ; no new line at the end of file during scrolling
(delete-selection-mode t)                        ; replace highlighted text with what I type rather than just inserting at point

(setq standard-indent 4)                         ; Set standard indent to 4
(setq tab-width 4)                               ; Length of tab is 4 SPC
  

(setq-default indent-tabs-mode nil)              ; Use spaces instead of tabs
(setq sentence-end-double-space nil)             ; Sentences end with one space

;; == Files == ;;

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq require-final-newline t)

;;; == Search & Destroy == ;;  ;; Is this section obsolete???

;(setq search-highlight t)

;(setq query-replace-highlight t)

;(setq case-fold-search t)


