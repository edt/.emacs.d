;; setup for python

;; used external packages

;; flake8 elpy rope pychecker

(when (require 'elpy nil t)
  (elpy-enable)
  (elpy-clean-modeline))

(defun my-elpy-hook ()
  "modifications for elpy"
  (highlight-indentation nil))

(add-hook 'elpy-mode-hook 'my-elpy-hook)

(provide 'setup-python)
