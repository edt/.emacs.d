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
        yasnippet))

;; Initialisiere alles und so...
(el-get 'sync my-packages)

;;------------------------------------------------------------------------------


;; http://www.chemie.fu-berlin.de/chemnet/use/info/elisp/elisp_16.html
(add-hook 'after-init-hook
          '(lambda () (setq debug-on-error t)))


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
(load "functions.el")
(load "modes.el")
(load "programming.el")
(load "keybindings.el")

; directories for .emacs.desktop and .emacs.desktop.lock files
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")


(require 'color-theme)
;(require 'w3m-load)

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


;; http://hustoknow.blogspot.de/2011/05/removing-trailing-whitespace-in-emacs.html
;; delete trailing whitespaces before saving a file
;(add-hook 'before-save-hook '(delete-trailing-whitespace (untabify start end))

;; maximum possible fontification
;;not functioning
(setq font-lock-maximum-decoration t)

;; highlight the search string for recursive searches
(setq search-highlight t)

;; prefer vertical window split over horizontal
;; http://stackoverflow.com/questions/2081577/setting-emacs-split-to-horizontal
;;(setq split-height-threshold nil)
;;(setq split-width-threshold 0)

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

(load "my-color-theme.el")
(my-color-theme )


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

;; == Backup == ;;
;; http://emacswiki.org/emacs/BackupDirectory
;; check if folder exists, and create if it doesn't
(unless (file-exists-p "~/.emacs.d/tmp/")
  (make-directory "~/.emacs.d/tmp/" 'parent))

;; set directory for backups
;;(setq backup-directory-alist "~/.emacs.d/tmp")

;; make backups by copying 
;; this prevents emacs from changing the creation time of the original file
(setq backup-by-copying t)

;; set directory for auto saved files
(setq auto-save-directory "~/.emacs.d/tmp/")

(setq backup-directory-alist
      `((".*" . ,"~/.emacs.d/tmp")))

;; always have an empty line at end of file
(setq require-final-newline t)

;;; == Search & Destroy == ;;  ;; Is this section obsolete???

;(setq search-highlight t)

;(setq query-replace-highlight t)

;(setq case-fold-search t)


;; https://sites.google.com/site/steveyegge2/my-dot-emacs-file
;;
;; Never understood why Emacs doesn't have this function.
;;
(defun rename-file-and-buffer (new-name)
 "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
 (let ((name (buffer-name))
	(filename (buffer-file-name)))
 (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
 (if (get-buffer new-name)
	 (message "A buffer named '%s' already exists!" new-name)
	(progn 	 (rename-file name new-name 1)
                 (rename-buffer new-name)
                 (set-visited-file-name new-name)
                 (set-buffer-modified-p nil)))))) ;;
;; Never understood why Emacs doesn't have this function, either.
;;
(defun move-buffer-file (dir)
 "Moves both current buffer and file it's visiting to DIR." (interactive "DNew directory: ")
 (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
	 (if (string-match dir "\\(?:/\\|\\\\)$")
	 (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))

 (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
 (progn 	(copy-file filename newname 1)
                (delete-file filename)
                (set-visited-file-name newname)
                (set-buffer-modified-p nil) 	t))))





