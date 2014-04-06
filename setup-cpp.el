
(require 'auto-complete)

(semantic-mode)
(add-to-list 'ac-sources 'ac-source-semantic)

(require 'flycheck)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
(add-hook 'c-mode-hook (lambda () (setq flycheck-clang-language-standard "c99")))


(when (require 'irony nil :noerror)


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

  ;; irony related configuration
  (if (executable-find "irony-server")
      (progn
        (add-hook 'c++-mode-hook 'edt-irony-hook)
        (add-hook 'c-mode-hook 'edt-irony-hook))
    (message "Irony server not found. Disabled config."))

  (message "Irony enabled"))

(provide 'setup-cpp)
