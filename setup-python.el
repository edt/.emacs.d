;; setup for python

;; used external packages

;; flake8 elpy rope

(when (require 'elpy nil t)
  (elpy-enable)
  (elpy-clean-modeline)
  (highlight-indentation-mode nil))

(provide 'setup-python)
