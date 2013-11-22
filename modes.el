;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                       MODES.EL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This file starts modes and
;; defines the configuration for those

(require 'setup-ido)

(require 'yasnippet)
(yas/global-mode 1)
(yas/load-directory "~/.emacs.d/snippets")
(setq yas/indent-line nil) ;disable yasnippet auto-indent

;; multilpe cursor don't clutter config dir
(setq mc/list-file "~/.emacs.d/tmp/multiple-cursors-lists.el")

(require 'keyfreq)
(setq-default keyfreq-file "~/.emacs.d/tmp/keyfreq")
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'window-number)
(window-number-mode t)
(window-number-meta-mode)

(require 'wgrep)

(require 'uniquify)
; create unique buffer names with shared directoy components.
(setq uniquify-buffer-name-style 'forward)

(require 'diff-hl)
(global-diff-hl-mode t)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'smartparens-config)
(smartparens-global-mode t)

(require 'highlight-symbol)
(global-set-key (kbd "C-<f3>") 'highlight-symbol-at-point)
(global-set-key (kbd "<f3>") 'highlight-symbol-next)
(global-set-key (kbd "S-<f3>") 'highlight-symbol-prev)
(global-set-key (kbd "M-<f3>") 'highlight-symbol-remove-all)

;; CC-MODE
(defun gtags-generate-gtags ()
  "Generate a gtags file in the querried directory"
  (let* ((proj-root (read-directory-name "Root of the project: "))
	 (cmd (format "cd %s ; gtags" (expand-file-name proj-root))))
    (when (not (string= "" proj-root))
      (message (format "Generating gtags files: %s" cmd))
      (shell-command cmd))))

(defun gtags-update-gtags ()
  "Update the gtags files"
  (let ((gen-cmd "global -u"))
    (message (format "Updating gatgs files: %s" gen-cmd))
    (shell-command gen-cmd)))

(defun gtags-generate-or-update ()
  "If you can update the gtags files. If not generate them."
  (interactive)
  (if (null (gtags-get-rootpath))
      (gtags-generate-gtags)
    (gtags-update-gtags)))

(add-hook 'gtags-mode-hook 
          (lambda()
            (local-set-key (kbd "M-.") 'gtags-find-tag)   ;; find a tag, also M-.
            (local-set-key (kbd "M-,") 'gtags-find-rtag)  ;; reverse tag
            (local-set-key (kbd "M-*") 'gtags-pop-stack)));; go back


(global-set-key (kbd "M-/") 'hippie-expand)

(setq hippie-expand-try-functions-list '(try-expand-dabbrev 
                                         try-expand-dabbrev-all-buffers 
                                         try-expand-dabbrev-from-kill 
                                         try-complete-file-name-partially
                                         try-complete-file-name 
                                         try-expand-all-abbrevs
                                         try-expand-list 
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(require 'revive+) ; may be optional
(setq revive-plus:all-frames t)
(revive-plus:minimal-setup)

(require 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'browse-kill-ring)

(require 'buffer-move)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(require 'rect-mark)
(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x")   'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w")   'rm-kill-region)
(global-set-key (kbd "C-x r M-w")   'rm-kill-ring-save)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; file associations

(add-to-list 'auto-mode-alist '("\\README\\'" . markdown-mode))

(add-to-list 'auto-mode-alist '("bashrc\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("bash_aliases\\'" . shell-script-mode))


(defvar ediff-do-hexl-diff nil
  "variable used to store trigger for doing diff in hexl-mode")
(defadvice ediff-files-internal (around ediff-files-internal-for-binary-files activate)
  "catch the condition when the binary files differ

the reason for catching the error out here (when re-thrown from the inner advice)
is to let the stack continue to unwind before we start the new diff
otherwise some code in the middle of the stack expects some output that
isn't there and triggers an error"
  (let ((file-A (ad-get-arg 0))
        (file-B (ad-get-arg 1))
        ediff-do-hexl-diff)
    (condition-case err
        (progn
          ad-do-it)
      (error
       (if ediff-do-hexl-diff
           (let ((buf-A (find-file-noselect file-A))
                 (buf-B (find-file-noselect file-B)))
             (with-current-buffer buf-A
               (hexl-mode 1))
             (with-current-buffer buf-B
               (hexl-mode 1))
             (ediff-buffers buf-A buf-B))
         (error (error-message-string err)))))))

(defadvice ediff-setup-diff-regions (around ediff-setup-diff-regions-for-binary-files activate)
  "when binary files differ, set the variable "
  (condition-case err
      (progn
        ad-do-it)
    (error
     (setq ediff-do-hexl-diff
           (and (string-match-p "^Errors in diff output.  Diff output is in.*"
                                (error-message-string err))
                (string-match-p "^\\(Binary \\)?[fF]iles .* and .* differ"
                                (buffer-substring-no-properties
                                 (line-beginning-position)
                                 (line-end-position)))
                ;; (y-or-n-p "The binary files differ, look at the differences in hexl-mode? ")
                ))
     (error (error-message-string err)))))

(provide 'modes)
