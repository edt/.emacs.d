
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


(use-package multi-term
  :defer t
  :init
  (progn
    (setq multi-term-program "/bin/bash")))
;; (eval-after-load "yasnippet"
;; '(progn
;; (yas/global-mode 1)
;; (yas/load-directory "~/.emacs.d/snippets")
;; ;; disable yasnippet auto-indent
;; (setq yas/indent-line nil)
;; ))
;; multilpe cursor don't clutter config dir
(setq mc/list-file "~/.emacs.d/tmp/multiple-cursors-lists.el")


(require 'wgrep)






(use-package window-number
  :init
  (progn
    (window-number-meta-mode)
    (window-number-mode t)))


(use-package uniquify
  :init
  (setq uniquify-buffer-name-style 'forward))

(use-package diff-hl
  :init
  (progn
    (global-diff-hl-mode t)

    (defadvice git-commit-commit (after git-commit-commit-after activate)
      (dolist (buffer (buffer-list))
        (with-current-buffer buffer
          (when diff-hl-mode
            (diff-hl-update)))))))


(use-package ace-jump-mode
  :defer t
  :commands ace-jump-mode
  :bind
  ("C-c SPC" . ace-jump-mode))


(use-package smartparens-config
  :defer t
  :diminish smartparens-mode
  :init
  (smartparens-global-mode t))


(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; file associations

(add-to-list 'auto-mode-alist '("\\README\\'" . markdown-mode))

(add-to-list 'auto-mode-alist '("bashrc\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("bash_aliases\\'" . shell-script-mode))


(use-package expand-region
  :defer t
  :bind
  (("C-'" . er/expand-region)
   ("C-;" . er/contract-region)))


(use-package highlight-symbol
  :defer t
  :bind
  (( "C-<f3>" . highlight-symbol-at-point)
   ( "<f3>" . highlight-symbol-next)
   ( "S-<f3>" . highlight-symbol-prev)
   ( "M-<f3>" . highlight-symbol-remove-all)))


(use-package ggtags
  :defer t
  :init
  (progn
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
    ))

(use-package hippie-exp
  :defer t
  :bind
  ("M-/" . hippie-expand)
  :init
  (progn
    (setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                             try-expand-dabbrev-all-buffers
                                             try-expand-dabbrev-from-kill
                                             try-complete-file-name-partially
                                             try-complete-file-name
                                             try-expand-all-abbrevs
                                             try-expand-list
                                             try-expand-line
                                             try-complete-lisp-symbol-partially
                                             try-complete-lisp-symbol))))


(use-package revive+
  :init
  (progn
    (setq revive-plus:all-frames t)
    (revive-plus:minimal-setup)))


(use-package indent-guide
  :diminish indent-guide-mode
  :init
  (progn
    (indent-guide-global-mode t)))


(use-package projectile
  :diminish projectile-mode
  :init
  (progn
    (setq projectile-cache-file (expand-file-name "projectile.cache" user-cache-directory))
    (setq projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" user-cache-directory))
    (setq projectile-enable-caching t)
    (projectile-global-mode t)))


(use-package browse-kill-ring
  :defer t
  :bind
  ("C-c k" . browse-kill-ring))


(use-package buffer-move
  :defer t
  :bind
  (("<C-S-up>" . buf-move-up)
   ("<C-S-down>" . buf-move-down)
   ("<C-S-left>" . buf-move-left)
   ("<C-S-right>" . buf-move-right)))


(use-package rect-mark
  :defer t
  :bind
  (("C-x r C-SPC" . rm-set-mark)
   ("C-x r C-x" . rm-exchange-point-and-mark)
   ("C-x r C-w" . rm-kill-region)
   ("C-x r M-w" . rm-kill-ring-save)))

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


(use-package flycheck
  :defer t
  :init
  (progn
    (global-flycheck-mode)
    ;; disable the annoying doc checker
    (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
    (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
    (add-hook 'c-mode-hook (lambda () (setq flycheck-clang-language-standard "c99")))))


(use-package fold-dwim
  :defer t
  :diminish hs-minor-mode
  :bind
  ("C-c h" . fold-dwim-toggle)
  :init
  (progn
    (add-hook 'c-mode-common-hook 'hs-minor-mode)
    (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
    (add-hook 'java-mode-hook 'hs-minor-mode)
    (add-hook 'lisp-mode-hook 'hs-minor-mode)
    (add-hook 'perl-mode-hook 'hs-minor-mode)
    (add-hook 'sh-mode-hook 'hs-minor-mode)
    (add-hook 'python-mode-hook 'hs-minor-mode)))


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
  (progn
    (fic-ext-mode)
    '(fic-highlighted-words (quote ("FIXME:" "TODO:" "BUG:" "REDFLAG:")))))

(use-package auto-complete
  :diminish auto-complete-mode
  :defer t
  :init
  (progn
    (use-package auto-complete-config)
    (ac-config-default)
    (setq ac-use-menu-map t)

    (setq ac-dwim t)
    (setq ac-use-menu-map t)

    ;; (setq ac-delay 0.3)
    (setq ac-use-quick-help t)
    (setq ac-quick-help-delay 0.5)

    ;; Default settings
    (define-key ac-menu-map "\C-n" 'ac-next)
    (define-key ac-menu-map "\C-p" 'ac-previous)

    (define-key ac-completing-map "\C-m" nil)
    (define-key ac-menu-map "\C-m" 'ac-complete)

    (setq ac-sources '(ac-source-filename
                       ac-source-yasnippet
                       ac-source-abbrev
                       ac-source-dictionary
                       ac-source-words-in-same-mode-buffers))

    (global-auto-complete-mode t)
    )
  :bind
  ("C-<return>" . ac-complete))

(semantic-mode)
(add-to-list 'ac-sources 'ac-source-semantic)


(use-package irony
  :init
  (progn

    (defun irony-restart-process ()
      "Restart the irony process."
      (interactive)
      (irony-cancel-process)
      (setq irony-completion-marker (make-marker))
      (setq irony-completion-last-marker (make-marker))
      (setq irony-completion-request-running-count 0)
      (setq irony-completion-user-triggered nil)
      (setq irony-last-completion nil)
      (setq irony-flags-cache nil)
      (setq irony-compile-flags-work-dir nil)
      (setq irony-compile-flags nil)
      (irony-start-process-maybe))

    (defun edt-irony-hook ()
      "irony related hooks"
      (irony-mode 1)
      (irony-enable 'ac))

    (add-hook 'c++-mode-hook 'edt-irony-hook)
    (add-hook 'c-mode-hook 'edt-irony-hook)))


(use-package timeclock
  :bind
  (("C-z t i" . timeclock-in)
   ("C-z t o" . timeclock-out)
   ("C-z t c" . timeclock-change)
   ("C-z t r" . timeclock-reread-log)))

(provide 'modes)
