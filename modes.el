;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                       MODES.EL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This file starts modes and
;; defines the configuration for those

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-max-directory-size 1000000)

(require 'yasnippet)
(yas/global-mode 1)
(yas/load-directory "~/.emacs.d/snippets")
(setq yas/indent-line nil) ;disable yasnippet auto-indent

(require 'buffer-move)

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

(setq smex-save-file "~/.emacs.d/smex.save") ;; keep my ~/ clean                                      
(require 'smex)                                                  
(smex-initialize) 

(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))

;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
