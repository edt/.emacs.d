;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        PROGRAMMING.EL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'prog-mode
          (lambda()
            (flyspell-prog-mode t)))

(add-hook 'find-file-hooks 'goto-address-prog-mode)


(electric-indent-mode t)

(defun my-c-mode-common-hook ()
  "my customizations for all of c-mode, c++-mode, objc-mode, java-mode"
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'innamespace 0)
  (c-set-offset 'case-label '+)
  ;; other customizations can go here

  (local-set-key  (kbd "C-c o") 'ff-find-other-file)
  (local-set-key  (kbd "RET") 'newline-and-indent)
  ;; (local-set-key  (kbd "RET") 'reindent-then-newline-and-indent)

  (c-toggle-electric-state 1)
  (setq c++-tab-always-indent t))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;indent-style
(setq-default c-default-style "bsd"
              c-indent-level 4
              tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Perl section

(defalias 'perl-mode 'cperl-mode)

;; Elisp section

(require 'setup-elisp)

(provide 'programming)
