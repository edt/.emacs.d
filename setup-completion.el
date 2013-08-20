
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-menu-map t)
;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;; allow <return> to complete
(define-key ac-completing-map "\C-m" nil)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-m" 'ac-complete)

;; (ac-set-trigger-key "<return>")
(global-set-key (kbd "C-<return>") 'auto-complete)

;; (global-set-key (kbd "<return>") 'newline-and-indent)

(provide 'setup-completion)
