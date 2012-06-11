(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(add-to-list 'load-path "/home/edt/.emacs.d")

;; Save comstum stuff in own file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Load the following configuration files
(load "user_profile.el")
(load "keybindings.el")
(load "modes.el")
(load "programming.el")

;(require 'color-theme)

;; ========== Support Wheel Mouse Scrolling ==========
 (mouse-wheel-mode t)

;; ========== Set key binding for GOTO
;(global-set-key "\C-l" 'goto-line)

(defalias 'qrr 'query-replace-regexp)          ; Define an alias
(global-font-lock-mode 1)                      ; Color enabled
(show-paren-mode 1)                            ; Highlight parenthesis pairs
(setq blink-matching-paren-distance nil)       ; Blinking parenthesis
(setq show-paren-style 'expression)            ; Highlight text between parens

(setq-default indicate-empty-lines t)          ; Show empty lines
(setq track-eol nil)                           ; Cursor don't track end-of-line
(setq mouse-yank-at-point t)                   ; Paste at cursor position
(setq scroll-preserve-screen-position nil)       ; Scroll without moving cursor
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
(setq calendar-week-start-day 1)               ; Week starts monday
(setq european-calendar-style 't)              ; European style calendar
 ;(global-unset-key "\C-x\C-v")                  ; Suppress a shortcut
(setq grep-command "grep -i -nH -e ")          ; Set grep command options
 
(setq ps-paper-type 'a4)                       ; Specify printing format
(setq-default case-fold-search t)              ; Search is case sensitive

 ;(require 'cl)                                  ; Use Common Lisp features
                                                ; Note: There are some problems
                                                ;  with this. It might be better
                                                ;  to just use it when compiling
                                                ; elisp files, see the elisp manual.

;; we want fontification in all modes
;;(global-font-lock-mode t t)
;; maximum possible fontification
;;not functioning
;(setq font-lock-maximum-decoration t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                    GENERAL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;; uniquify ;;;;;
;; give buffers more intelligent names.
;; standard emacs/xemacs package.
(require 'uniquify)
; create unique buffer names with shared directoy components.
;(setq uniquify-buffer-name-style 'forward)
(setq uniquify-buffer-name-style 'reverse)

;;;;;;;;;;;;;;;;;;; Appearance ;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;== Menu ==;;;;;;;;;;;;;;;;;;;;

(define-key menu-bar-tools-menu [games] nil)     ; Remove games menu

(scroll-bar-mode nil)
(tool-bar-mode nil)

 ;(add-to-list 'default-frame-alist '(font . "")); Change fonts
 (put 'narrow-to-region  'disabled nil)         ; Allow narrow-to-region command
 (setq disabled-command-hook nil)               ; Allow all disabled commands

 (setq undo-limit 100000)                       ; Increase number of undo
;(setq exec-path (append exec-path '("/bin")))  ; Change binary path

;;;;;;;;;;;;;;;;;;;== Editing ==;;;;;;;;;;;;;;;;;;

 (blink-cursor-mode 0)                           ; No blinking cursor

 ;(global-linum-mode t)                           ; Show line numbers

;;;;;;;;;;;;;;;;;;== Modeline ==;;;;;;;;;;;;;;;;;;

(display-time-mode t)                            ; display time
(setq column-number-mode t)                      ; display time
(setq size-indication-mode t)                    ; display file-size


;;;;;;;;;;;;;;;;;;;;; Behavior ;;;;;;;;;;;;;;;;;;;

(setq scroll-conservatively 5)                   ; not found
;; scroll one line at a time (less "jumpy" than defaults)
    
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
    
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
    
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
    
(setq scroll-step 1) ;; keyboard scroll one line at a time





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



(add-to-list 'load-path
           "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")


 
