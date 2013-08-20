
(require 'fold-dwim)
;(hs-minor-mode t)
;; (global-set-key (kbd "C-u C-c h") 'fold-dwim-hide-all)
(global-set-key (kbd "C-c h") 'fold-dwim-toggle)
;; (global-set-key [(C kp-6)] 'fold-dwim-show-all)

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'python-mode-hook     'hs-minor-mode)

(provide 'setup-code-folding)
