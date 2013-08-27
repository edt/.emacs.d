;; setup for python

;; used external packages

;; flake8 elpy rope pychecker

(when (require 'elpy nil t)
  (elpy-enable)
  (elpy-clean-modeline))

(setq-default elpy-default-minor-modes (remove 'highlight-indentation-mode elpy-default-minor-modes))

(defun my-elpy-hook ()
  "modifications for elpy"

  )

(add-hook 'elpy-mode-hook 'my-elpy-hook)

(provide 'setup-python)
