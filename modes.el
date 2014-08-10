
(use-package ido
  :init
  (progn
    (setq ido-enable-flex-matching t)
    (setq ido-everywhere t)
    (setq ido-max-directory-size 1000000)
    (setq ido-default-buffer-method 'selected-window)
    (setq ido-save-directory-list-file "~/.emacs.d/tmp/ido.last")
    (ido-mode t)))


(use-package ido-ubiquitous
  :init
  (progn
    (ido-ubiquitous-mode t)))


(require 'yasnippet)
(yas/global-mode 1)
(yas/load-directory "~/.emacs.d/snippets")
(setq yas/indent-line nil) ;disable yasnippet auto-indent
(use-package smex
  :bind
  (("C-c C-c M-x" . execute-extended-command)
   ("M-x" . smex)
   ("M-X" . smex-major-mode-commands))
  :init
  (setq smex-save-file "~/.emacs.d/tmp/smex.save"))


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

(defadvice git-commit-commit (after git-commit-commit-after activate)
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when diff-hl-mode
        (diff-hl-update)))))

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
            (local-set-key (kbd "M-.") 'gtags-find-tag) ;; find a tag, also M-.
            (local-set-key (kbd "M-,") 'gtags-find-rtag) ;; reverse tag
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

(require 'revive+)
(setq revive-plus:all-frames t)
(revive-plus:minimal-setup)

(require 'indent-guide)
(indent-guide-global-mode t)

(setq projectile-cache-file (expand-file-name "projectile.cache" user-cache-directory))
(setq projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" user-cache-directory))
(setq projectile-enable-caching t)
(require 'projectile)
(projectile-global-mode t)

(require 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'browse-kill-ring)

(require 'buffer-move)
(global-set-key (kbd "<C-S-up>") 'buf-move-up)
(global-set-key (kbd "<C-S-down>") 'buf-move-down)
(global-set-key (kbd "<C-S-left>") 'buf-move-left)
(global-set-key (kbd "<C-S-right>") 'buf-move-right)

(require 'rect-mark)
(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; file associations

(add-to-list 'auto-mode-alist '("\\README\\'" . markdown-mode))

(add-to-list 'auto-mode-alist '("bashrc\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("bash_aliases\\'" . shell-script-mode))


;; saner ediff default
(eval-after-load "ediff"
  '(progn
     (add-hook 'ediff-before-setup-hook 'new-frame)
     (add-hook 'ediff-quit-hook 'delete-frame)
     (setq ediff-diff-options "-w")
     (setq ediff-split-window-function 'split-window-horizontally)
     (setq ediff-window-setup-function 'ediff-setup-windows-plain)


     (defvar ediff-do-hexl-diff nil
       "variable used to store trigger for doing diff in hexl-mode")
     (defadvice ediff-files-internal (around ediff-files-internal-for-binary-files activate)
       "Catch the condition when the binary files differ
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
                (and (string-match-p "^Errors in diff output. Diff output is in.*"
                                     (error-message-string err))
                     (string-match-p "^\\(Binary \\)?[fF]iles .* and .* differ"
                                     (buffer-substring-no-properties
                                      (line-beginning-position)
                                      (line-end-position)))
                     ;; (y-or-n-p "The binary files differ, look at the differences in hexl-mode? ")
                     ))
          (error (error-message-string err)))))
     ))

(require' flycheck)
(global-flycheck-mode)
;; disable the annoying doc checker
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(use-package magit
  :defer t
  :config
  (progn
    (defadvice magit-status (around magit-fullscreen activate)
      (window-configuration-to-register :magit-fullscreen)
      ad-do-it
      (delete-other-windows))

    (defun magit-quit-session ()
      "Restores the previous window configuration and kills the magit buffer"
      (interactive)
      (kill-buffer)
      (jump-to-register :magit-fullscreen))

    (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

    (defun magit-toggle-whitespace ()
      (interactive)
      (if (member "-w" magit-diff-options)
          (magit-dont-ignore-whitespace)
        (magit-ignore-whitespace)))

    (defun magit-ignore-whitespace ()
      (interactive)
      (add-to-list 'magit-diff-options "-w")
      (magit-refresh))

    (defun magit-dont-ignore-whitespace ()
      (interactive)
      (setq magit-diff-options (remove "-w" magit-diff-options))
      (magit-refresh))

    (define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)
    ))

(use-package fic-ext-mode
  :defer t
  :init
  (fic-ext-mode))


(provide 'modes)
