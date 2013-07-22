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

(require 'yafolding)
(define-key global-map (kbd "C-'") 'yafolding)
;;(define-key global-map (kbd "C-c C-f") 'yafolding-toggle-all)
(define-key global-map (kbd "C-c C-f") 'yafolding-toggle-all-by-current-level)
;;(add-hook 'indent-buffer-before-hook
;;    (lambda ()
;;      (yafolding-temp-toggle nil)))
;;(add-hook 'indent-buffer-after-hook
;;    (lambda ()
;;      (yafolding-temp-toggle t)))

;(require 'buffer-move)

;; multilpe cursor don't clutter config dir
(setq mc/list-file "~/.emacs.d/tmp/multiple-cursors-lists.el")

(require 'window-number)
(window-number-mode t)
(window-number-meta-mode)

(require 'highlight-symbol)
(global-set-key (kbd "C-<f3>") 'highlight-symbol-at-point)
(global-set-key (kbd "<f3>") 'highlight-symbol-next)
(global-set-key (kbd "S-<f3>") 'highlight-symbol-prev)
(global-set-key (kbd "M-<f3>") 'highlight-symbol-remove-all)

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

(require 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'browse-kill-ring)

(require 'rect-mark)
(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x")   'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w")   'rm-kill-region)
(global-set-key (kbd "C-x r M-w")   'rm-kill-ring-save)


